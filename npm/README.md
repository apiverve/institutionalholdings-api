# Institutional Holdings API

Institutional Holdings returns SEC Form 13F holdings: every position a fund manager reported for a quarter, with shares, value, portfolio weight, put/call, discretion and voting authority, plus the quarter-over-quarter change on every position. Look up a manager by CIK or name, or reverse it and list every institution holding a ticker or CUSIP.

[![npm version](https://img.shields.io/npm/v/@apiverve/institutionalholdings.svg)](https://www.npmjs.com/package/@apiverve/institutionalholdings)

This is a JavaScript wrapper for the [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/institutionalholdings
```

Using yarn:
```shell
yarn add @apiverve/institutionalholdings
```

---

## Configuration

Before using the Institutional Holdings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Institutional Holdings API documentation is found here: [https://docs.apiverve.com/ref/institutionalholdings](https://docs.apiverve.com/ref/institutionalholdings?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const institutionalholdingsAPI = require('@apiverve/institutionalholdings');
const api = new institutionalholdingsAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  cik: "1067983",
  manager: "berkshire hathaway",
  ticker: "AAPL",
  cusip: "037833100",
  period: "2026Q1",
  changeType: "new",
  putCall: "none",
  minValue: 1000000,
  maxValue: 1000000000,
  sort: "value",
  order: "desc",
  limit: 25,
  offset: 25,
  summary: true
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  cik: "1067983",
  manager: "berkshire hathaway",
  ticker: "AAPL",
  cusip: "037833100",
  period: "2026Q1",
  changeType: "new",
  putCall: "none",
  minValue: 1000000,
  maxValue: 1000000000,
  sort: "value",
  order: "desc",
  limit: 25,
  offset: 25,
  summary: true
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  cik: "1067983",
  manager: "berkshire hathaway",
  ticker: "AAPL",
  cusip: "037833100",
  period: "2026Q1",
  changeType: "new",
  putCall: "none",
  minValue: 1000000,
  maxValue: 1000000000,
  sort: "value",
  order: "desc",
  limit: 25,
  offset: 25,
  summary: true
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
