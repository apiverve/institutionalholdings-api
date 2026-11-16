# Institutional Holdings API - Dart/Flutter Client

Institutional Holdings returns SEC Form 13F holdings: every position a fund manager reported for a quarter, with shares, value, portfolio weight, put/call, discretion and voting authority, plus the quarter-over-quarter change on every position. Look up a manager by CIK or name, or reverse it and list every institution holding a ticker or CUSIP.

[![pub package](https://img.shields.io/pub/v/apiverve_institutionalholdings.svg)](https://pub.dev/packages/apiverve_institutionalholdings)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_institutionalholdings: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_institutionalholdings/apiverve_institutionalholdings.dart';

void main() async {
  final client = InstitutionalholdingsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'cik': '1067983',
      'manager': 'berkshire hathaway',
      'ticker': 'AAPL',
      'cusip': '037833100',
      'period': '2026Q1',
      'changeType': 'new',
      'putCall': 'none',
      'minValue': 1000000,
      'maxValue': 1000000000,
      'sort': 'value',
      'order': 'desc',
      'limit': 25,
      'offset': 25,
      'summary': true
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "mode": "manager",
    "period": "2026-06-30",
    "quarter": "2026Q2",
    "previousPeriod": "2026-03-31",
    "manager": {
      "cik": "0001067983",
      "name": "Berkshire Hathaway Inc",
      "city": "Omaha",
      "state": "NE"
    },
    "filing": {
      "formType": "13F-HR",
      "accessionNumber": "0001193125-26-352200",
      "filingDate": "2026-08-14",
      "amendments": 0,
      "url": "https://www.sec.gov/Archives/edgar/data/1067983/000119312526352200/"
    },
    "totalValue": 299253556246,
    "positionCount": 29,
    "count": 5,
    "offset": 0,
    "totalMatches": 29,
    "holdings": [
      {
        "issuer": "APPLE INC",
        "ticker": "AAPL",
        "cusip": "037833100",
        "figi": "BBG001S5N8V8",
        "titleOfClass": "COM",
        "shares": 227917808,
        "shareType": "SH",
        "value": 65950296923,
        "portfolioPercent": 22.0383,
        "putCall": null,
        "investmentDiscretion": "DFND",
        "votingAuthority": {
          "sole": 227917808,
          "shared": 0,
          "none": 0
        },
        "previousShares": 227917808,
        "previousValue": 57843260493,
        "shareChange": 0,
        "shareChangePercent": 0,
        "valueChange": 8107036430,
        "changeType": "unchanged",
        "isNew": false
      },
      {
        "issuer": "AMERICAN EXPRESS CO COM",
        "ticker": "AXP",
        "cusip": "025816109",
        "figi": "BBG001S5P034",
        "titleOfClass": "Stock",
        "shares": 151610700,
        "shareType": "SH",
        "value": 51282319275,
        "portfolioPercent": 17.1367,
        "putCall": null,
        "investmentDiscretion": "DFND",
        "votingAuthority": {
          "sole": 151610700,
          "shared": 0,
          "none": 0
        },
        "previousShares": 151610700,
        "previousValue": 45859204536,
        "shareChange": 0,
        "shareChangePercent": 0,
        "valueChange": 5423114739,
        "changeType": "unchanged",
        "isNew": false
      },
      {
        "issuer": "COCA COLA CO",
        "ticker": "KO",
        "cusip": "191216100",
        "figi": "BBG001S5SMQ8",
        "titleOfClass": "COM",
        "shares": 400000000,
        "shareType": "SH",
        "value": 32508000000,
        "portfolioPercent": 10.863,
        "putCall": null,
        "investmentDiscretion": "DFND",
        "votingAuthority": {
          "sole": 400000000,
          "shared": 0,
          "none": 0
        },
        "previousShares": 400000000,
        "previousValue": 30420000000,
        "shareChange": 0,
        "shareChangePercent": 0,
        "valueChange": 2088000000,
        "changeType": "unchanged",
        "isNew": false
      },
      {
        "issuer": "ALPHABET INC",
        "ticker": "GOOGL",
        "cusip": "02079K305",
        "figi": "BBG009S39JY5",
        "titleOfClass": "CAP STK CL A",
        "shares": 78791167,
        "shareType": "SH",
        "value": 28157599351,
        "portfolioPercent": 9.4093,
        "putCall": null,
        "investmentDiscretion": "DFND",
        "votingAuthority": {
          "sole": 78791167,
          "shared": 0,
          "none": 0
        },
        "previousShares": 54249798,
        "previousValue": 15600071913,
        "shareChange": 24541369,
        "shareChangePercent": 45.24,
        "valueChange": 12557527438,
        "changeType": "increased",
        "isNew": false
      },
      {
        "issuer": "BANK OF AMER CORP COM",
        "ticker": "BAC",
        "cusip": "060505104",
        "figi": "BBG000BD2C18",
        "titleOfClass": "Stock",
        "shares": 483394015,
        "shareType": "SH",
        "value": 27543790975,
        "portfolioPercent": 9.2042,
        "putCall": null,
        "investmentDiscretion": "DFND",
        "votingAuthority": {
          "sole": 483394015,
          "shared": 0,
          "none": 0
        },
        "previousShares": 513624165,
        "previousValue": 25039178044,
        "shareChange": -30230150,
        "shareChangePercent": -5.89,
        "valueChange": 2504612931,
        "changeType": "decreased",
        "isNew": false
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/institutionalholdings](https://docs.apiverve.com/ref/institutionalholdings?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
