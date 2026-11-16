import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class InstitutionalholdingsValidationException implements Exception {
  final List<String> errors;

  InstitutionalholdingsValidationException(this.errors);

  @override
  String toString() => 'InstitutionalholdingsValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Institutional Holdings API client.
///
/// For more information, visit: https://apiverve.com/marketplace/institutionalholdings?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [cik] - SEC Central Index Key of the 13F filer, e.g. 1067983 for Berkshire Hathaway. Returns that manager's holdings. [maxLength: 10]
/// * [manager] - Manager name to search for instead of cik, e.g. bridgewater. The best match is returned, with other close matches in otherMatches. [maxLength: 100]
/// * [ticker] - Ticker symbol. Alone, lists the managers holding it; with cik or manager, filters that manager's holdings to it. [maxLength: 10]
/// * [cusip] - 9-character CUSIP. Alone, lists the managers holding it; with cik or manager, filters that manager's holdings to it. [minLength: 8, maxLength: 9]
/// * [period] - Quarter to read, as a quarter end (2026-03-31) or quarter (2026Q1). Defaults to the latest quarter.
/// * [changeType] - Only positions that are new, increased, decreased, unchanged or soldout since the previous quarter. Sold-out positions appear only with soldout.
/// * [putCall] - Option filter: put, call, none (shares and principal only) or all. Defaults to all.
/// * [minValue] - Only positions worth at least this many US dollars. [min: 0]
/// * [maxValue] - Only positions worth at most this many US dollars. [min: 0]
/// * [sort] - Sort by value (default), shares, change (share change), changepercent or portfolio (weight).
/// * [order] - Sort order: desc (default) or asc.
/// * [limit] - Rows to return (1-100). Defaults to 10. [min: 1, max: 100]
/// * [offset] - Rows to skip, for paging through a large portfolio or holder list. [min: 0]
/// * [summary] - Add a summary: for a manager, value change, position counts by change type, top-10 concentration and turnover; for a security, holder flows and top-10 share concentration.
class InstitutionalholdingsClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'cik': ValidationRule(type: 'string', required: false, maxLength: 10),
    'manager': ValidationRule(type: 'string', required: false, maxLength: 100),
    'ticker': ValidationRule(type: 'string', required: false, maxLength: 10),
    'cusip': ValidationRule(type: 'string', required: false, minLength: 8, maxLength: 9),
    'period': ValidationRule(type: 'string', required: false),
    'changeType': ValidationRule(type: 'string', required: false),
    'putCall': ValidationRule(type: 'string', required: false),
    'minValue': ValidationRule(type: 'number', required: false, min: 0),
    'maxValue': ValidationRule(type: 'number', required: false, min: 0),
    'sort': ValidationRule(type: 'string', required: false),
    'order': ValidationRule(type: 'string', required: false),
    'limit': ValidationRule(type: 'integer', required: false, min: 1, max: 100),
    'offset': ValidationRule(type: 'integer', required: false, min: 0),
    'summary': ValidationRule(type: 'boolean', required: false),
  };

  InstitutionalholdingsClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/institutionalholdings',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [InstitutionalholdingsValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw InstitutionalholdingsValidationException(errors);
    }
  }

  /// Execute a request to the Institutional Holdings API.
  ///
  /// Parameters are validated before sending the request.
  Future<InstitutionalholdingsResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw InstitutionalholdingsException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return InstitutionalholdingsResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw InstitutionalholdingsException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw InstitutionalholdingsException('Resource not found');
      } else {
        throw InstitutionalholdingsException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is InstitutionalholdingsException) rethrow;
      throw InstitutionalholdingsException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Institutional Holdings API client.
class InstitutionalholdingsException implements Exception {
  final String message;

  InstitutionalholdingsException(this.message);

  @override
  String toString() => 'InstitutionalholdingsException: $message';
}
