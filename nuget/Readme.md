Institutional Holdings API
============

Institutional Holdings returns SEC Form 13F holdings: every position a fund manager reported for a quarter, with shares, value, portfolio weight, put/call, discretion and voting authority, plus the quarter-over-quarter change on every position. Look up a manager by CIK or name, or reverse it and list every institution holding a ticker or CUSIP.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.InstitutionalHoldings.svg)](https://www.nuget.org/packages/APIVerve.API.InstitutionalHoldings)

This is a .NET wrapper for the [Institutional Holdings API](https://apiverve.com/marketplace/institutionalholdings?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.InstitutionalHoldings
```

Using the Package Manager:
```
nuget install APIVerve.API.InstitutionalHoldings
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.InstitutionalHoldings
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.InstitutionalHoldings"
5. Click on the APIVerve.API.InstitutionalHoldings package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Institutional Holdings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.InstitutionalHoldings;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new InstitutionalHoldingsQueryOptions {
            Cik = "1067983",
            Manager = "berkshire hathaway",
            Ticker = "AAPL",
            Cusip = "037833100",
            Period = "2026Q1",
            ChangeType = "new",
            PutCall = "none",
            MinValue = 1000000,
            MaxValue = 1000000000,
            Sort = "value",
            Order = "desc",
            Limit = 25,
            Offset = 25,
            Summary = true
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Institutional Holdings API documentation is found here: [https://docs.apiverve.com/ref/institutionalholdings](https://docs.apiverve.com/ref/institutionalholdings?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Institutional Holdings API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.InstitutionalHoldings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new InstitutionalHoldingsQueryOptions {
            Cik = "1067983",
            Manager = "berkshire hathaway",
            Ticker = "AAPL",
            Cusip = "037833100",
            Period = "2026Q1",
            ChangeType = "new",
            PutCall = "none",
            MinValue = 1000000,
            MaxValue = 1000000000,
            Sort = "value",
            Order = "desc",
            Limit = 25,
            Offset = 25,
            Summary = true
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.InstitutionalHoldings;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new InstitutionalHoldingsQueryOptions {
            Cik = "1067983",
            Manager = "berkshire hathaway",
            Ticker = "AAPL",
            Cusip = "037833100",
            Period = "2026Q1",
            ChangeType = "new",
            PutCall = "none",
            MinValue = 1000000,
            MaxValue = 1000000000,
            Sort = "value",
            Order = "desc",
            Limit = 25,
            Offset = 25,
            Summary = true
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.InstitutionalHoldings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new InstitutionalHoldingsQueryOptions {
            Cik = "1067983",
            Manager = "berkshire hathaway",
            Ticker = "AAPL",
            Cusip = "037833100",
            Period = "2026Q1",
            ChangeType = "new",
            PutCall = "none",
            MinValue = 1000000,
            MaxValue = 1000000000,
            Sort = "value",
            Order = "desc",
            Limit = 25,
            Offset = 25,
            Summary = true
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.InstitutionalHoldings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new InstitutionalHoldingsQueryOptions {
            Cik = "1067983",
            Manager = "berkshire hathaway",
            Ticker = "AAPL",
            Cusip = "037833100",
            Period = "2026Q1",
            ChangeType = "new",
            PutCall = "none",
            MinValue = 1000000,
            MaxValue = 1000000000,
            Sort = "value",
            Order = "desc",
            Limit = 25,
            Offset = 25,
            Summary = true
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new InstitutionalHoldingsQueryOptions {
    Cik = "1067983",
    Manager = "berkshire hathaway",
    Ticker = "AAPL",
    Cusip = "037833100",
    Period = "2026Q1",
    ChangeType = "new",
    PutCall = "none",
    MinValue = 1000000,
    MaxValue = 1000000000,
    Sort = "value",
    Order = "desc",
    Limit = 25,
    Offset = 25,
    Summary = true
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new InstitutionalHoldingsQueryOptions {
    Cik = "1067983",
    Manager = "berkshire hathaway",
    Ticker = "AAPL",
    Cusip = "037833100",
    Period = "2026Q1",
    ChangeType = "new",
    PutCall = "none",
    MinValue = 1000000,
    MaxValue = 1000000000,
    Sort = "value",
    Order = "desc",
    Limit = 25,
    Offset = 25,
    Summary = true
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new InstitutionalHoldingsQueryOptions {
    Cik = "1067983",
    Manager = "berkshire hathaway",
    Ticker = "AAPL",
    Cusip = "037833100",
    Period = "2026Q1",
    ChangeType = "new",
    PutCall = "none",
    MinValue = 1000000,
    MaxValue = 1000000000,
    Sort = "value",
    Order = "desc",
    Limit = 25,
    Offset = 25,
    Summary = true
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new InstitutionalHoldingsQueryOptions {
    Cik = "1067983",
    Manager = "berkshire hathaway",
    Ticker = "AAPL",
    Cusip = "037833100",
    Period = "2026Q1",
    ChangeType = "new",
    PutCall = "none",
    MinValue = 1000000,
    MaxValue = 1000000000,
    Sort = "value",
    Order = "desc",
    Limit = 25,
    Offset = 25,
    Summary = true
};

using (var apiClient = new InstitutionalHoldingsAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
