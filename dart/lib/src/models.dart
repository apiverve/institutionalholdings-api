/// Response models for the Institutional Holdings API.

/// API Response wrapper.
class InstitutionalholdingsResponse {
  final String status;
  final dynamic error;
  final InstitutionalholdingsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  InstitutionalholdingsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory InstitutionalholdingsResponse.fromJson(Map<String, dynamic> json) => InstitutionalholdingsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? InstitutionalholdingsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Institutional Holdings API.

class InstitutionalholdingsData {
  String? mode;
  String? period;
  String? quarter;
  String? previousPeriod;
  InstitutionalholdingsDataManager? manager;
  InstitutionalholdingsDataFiling? filing;
  num? totalValue;
  num? positionCount;
  num? count;
  num? offset;
  num? totalMatches;
  List<InstitutionalholdingsDataHoldingsItem>? holdings;

  InstitutionalholdingsData({
    this.mode,
    this.period,
    this.quarter,
    this.previousPeriod,
    this.manager,
    this.filing,
    this.totalValue,
    this.positionCount,
    this.count,
    this.offset,
    this.totalMatches,
    this.holdings,
  });

  factory InstitutionalholdingsData.fromJson(Map<String, dynamic> json) => InstitutionalholdingsData(
      mode: json['mode'],
      period: json['period'],
      quarter: json['quarter'],
      previousPeriod: json['previousPeriod'],
      manager: json['manager'] != null ? InstitutionalholdingsDataManager.fromJson(json['manager']) : null,
      filing: json['filing'] != null ? InstitutionalholdingsDataFiling.fromJson(json['filing']) : null,
      totalValue: json['totalValue'],
      positionCount: json['positionCount'],
      count: json['count'],
      offset: json['offset'],
      totalMatches: json['totalMatches'],
      holdings: (json['holdings'] as List?)?.map((e) => InstitutionalholdingsDataHoldingsItem.fromJson(e)).toList(),
    );
}

class InstitutionalholdingsDataManager {
  String? cik;
  String? name;
  String? city;
  String? state;

  InstitutionalholdingsDataManager({
    this.cik,
    this.name,
    this.city,
    this.state,
  });

  factory InstitutionalholdingsDataManager.fromJson(Map<String, dynamic> json) => InstitutionalholdingsDataManager(
      cik: json['cik'],
      name: json['name'],
      city: json['city'],
      state: json['state'],
    );
}

class InstitutionalholdingsDataFiling {
  String? formType;
  String? accessionNumber;
  String? filingDate;
  num? amendments;
  String? url;

  InstitutionalholdingsDataFiling({
    this.formType,
    this.accessionNumber,
    this.filingDate,
    this.amendments,
    this.url,
  });

  factory InstitutionalholdingsDataFiling.fromJson(Map<String, dynamic> json) => InstitutionalholdingsDataFiling(
      formType: json['formType'],
      accessionNumber: json['accessionNumber'],
      filingDate: json['filingDate'],
      amendments: json['amendments'],
      url: json['url'],
    );
}

class InstitutionalholdingsDataHoldingsItem {
  String? issuer;
  String? ticker;
  String? cusip;
  String? figi;
  String? titleOfClass;
  num? shares;
  String? shareType;
  num? value;
  num? portfolioPercent;
  dynamic putCall;
  String? investmentDiscretion;
  InstitutionalholdingsDataHoldingsItemVotingauthority? votingAuthority;
  num? previousShares;
  num? previousValue;
  num? shareChange;
  num? shareChangePercent;
  num? valueChange;
  String? changeType;
  bool? isNew;

  InstitutionalholdingsDataHoldingsItem({
    this.issuer,
    this.ticker,
    this.cusip,
    this.figi,
    this.titleOfClass,
    this.shares,
    this.shareType,
    this.value,
    this.portfolioPercent,
    this.putCall,
    this.investmentDiscretion,
    this.votingAuthority,
    this.previousShares,
    this.previousValue,
    this.shareChange,
    this.shareChangePercent,
    this.valueChange,
    this.changeType,
    this.isNew,
  });

  factory InstitutionalholdingsDataHoldingsItem.fromJson(Map<String, dynamic> json) => InstitutionalholdingsDataHoldingsItem(
      issuer: json['issuer'],
      ticker: json['ticker'],
      cusip: json['cusip'],
      figi: json['figi'],
      titleOfClass: json['titleOfClass'],
      shares: json['shares'],
      shareType: json['shareType'],
      value: json['value'],
      portfolioPercent: json['portfolioPercent'],
      putCall: json['putCall'],
      investmentDiscretion: json['investmentDiscretion'],
      votingAuthority: json['votingAuthority'] != null ? InstitutionalholdingsDataHoldingsItemVotingauthority.fromJson(json['votingAuthority']) : null,
      previousShares: json['previousShares'],
      previousValue: json['previousValue'],
      shareChange: json['shareChange'],
      shareChangePercent: json['shareChangePercent'],
      valueChange: json['valueChange'],
      changeType: json['changeType'],
      isNew: json['isNew'],
    );
}

class InstitutionalholdingsDataHoldingsItemVotingauthority {
  num? sole;
  num? shared;
  num? none;

  InstitutionalholdingsDataHoldingsItemVotingauthority({
    this.sole,
    this.shared,
    this.none,
  });

  factory InstitutionalholdingsDataHoldingsItemVotingauthority.fromJson(Map<String, dynamic> json) => InstitutionalholdingsDataHoldingsItemVotingauthority(
      sole: json['sole'],
      shared: json['shared'],
      none: json['none'],
    );
}

class InstitutionalholdingsRequest {
  String? cik;
  String? manager;
  String? ticker;
  String? cusip;
  String? period;
  String? changeType;
  String? putCall;
  double? minValue;
  double? maxValue;
  String? sort;
  String? order;
  int? limit;
  int? offset;
  bool? summary;

  InstitutionalholdingsRequest({
    this.cik,
    this.manager,
    this.ticker,
    this.cusip,
    this.period,
    this.changeType,
    this.putCall,
    this.minValue,
    this.maxValue,
    this.sort,
    this.order,
    this.limit,
    this.offset,
    this.summary,
  });

  Map<String, dynamic> toJson() => {
      if (cik != null) 'cik': cik,
      if (manager != null) 'manager': manager,
      if (ticker != null) 'ticker': ticker,
      if (cusip != null) 'cusip': cusip,
      if (period != null) 'period': period,
      if (changeType != null) 'changeType': changeType,
      if (putCall != null) 'putCall': putCall,
      if (minValue != null) 'minValue': minValue,
      if (maxValue != null) 'maxValue': maxValue,
      if (sort != null) 'sort': sort,
      if (order != null) 'order': order,
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
      if (summary != null) 'summary': summary,
    };
}
