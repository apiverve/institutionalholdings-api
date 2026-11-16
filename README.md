# [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Institutional Holdings returns SEC Form 13F holdings: every position a fund manager reported for a quarter, with shares, value, portfolio weight, put/call, discretion and voting authority, plus the quarter-over-quarter change on every position. Look up a manager by CIK or name, or reverse it and list every institution holding a ticker or CUSIP.

The Institutional Holdings API provides a simple, reliable way to integrate institutional holdings functionality into your applications. Built for developers who need production-ready institutional holdings capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/institutionalholdings?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/institutionalholdings?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/institutionalholdings)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.InstitutionalHoldings)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-institutionalholdings/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_institutionalholdings)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/institutionalholdings)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_institutionalholdings)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callInstitutionalHoldingsAPI() {
    try {
        const params = new URLSearchParams({
            cik: '1067983',
            manager: 'berkshire hathaway',
            ticker: 'AAPL',
            cusip: '037833100',
            changeType: 'new',
            putCall: 'none',
            minValue: 1000000,
            maxValue: 1000000000,
            sort: 'value',
            order: 'desc'
        });

        const response = await fetch(`https://api.apiverve.com/v1/institutionalholdings?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callInstitutionalHoldingsAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/institutionalholdings?cik=1067983&manager=berkshire%20hathaway&ticker=AAPL&cusip=037833100&changeType=new&putCall=none&minValue=1000000&maxValue=1000000000&sort=value&order=desc" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/institutionalholdings
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/institutionalholdings) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.InstitutionalHoldings
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.InstitutionalHoldings) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-institutionalholdings
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-institutionalholdings/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_institutionalholdings
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_institutionalholdings) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/institutionalholdings
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/institutionalholdings) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_institutionalholdings
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_institutionalholdings) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:institutionalholdings-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/institutionalholdings-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/institutionalholdings](https://docs.apiverve.com/ref/institutionalholdings)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Institutional Holdings API is commonly used for:

- **Web Applications** - Add institutional holdings features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with institutional holdings capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Institutional Holdings API:

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

---

## Support & Community

- 🏠 **API Home**: [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
