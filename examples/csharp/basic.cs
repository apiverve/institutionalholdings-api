/*
 * Institutional Holdings API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Institutional Holdings API.
 * API Documentation: https://docs.apiverve.com/ref/institutionalholdings
 */

using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Linq;

namespace APIVerve.Examples
{
    class InstitutionalHoldingsExample
    {
        private static readonly string API_KEY = Environment.GetEnvironmentVariable("APIVERVE_API_KEY") ?? "YOUR_API_KEY_HERE";
        private static readonly string API_URL = "https://api.apiverve.com/v1/institutionalholdings";

        /// <summary>
        /// Make a GET request to the Institutional Holdings API
        /// </summary>
        static async Task<JsonDocument> CallInstitutionalHoldingsAPI()
        {
            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("x-api-key", API_KEY);

                // Query parameters
                var queryParams &#x3D; new Dictionary&lt;string, string&gt; { [&quot;cik&quot;] &#x3D; &quot;1067983&quot;, [&quot;manager&quot;] &#x3D; &quot;berkshire hathaway&quot;, [&quot;ticker&quot;] &#x3D; &quot;AAPL&quot;, [&quot;cusip&quot;] &#x3D; &quot;037833100&quot;, [&quot;changeType&quot;] &#x3D; &quot;new&quot;, [&quot;putCall&quot;] &#x3D; &quot;none&quot;, [&quot;minValue&quot;] &#x3D; 1000000, [&quot;maxValue&quot;] &#x3D; 1000000000, [&quot;sort&quot;] &#x3D; &quot;value&quot;, [&quot;order&quot;] &#x3D; &quot;desc&quot; };

                var queryString = string.Join("&",
                    queryParams.Select(kvp => $"{kvp.Key}={Uri.EscapeDataString(kvp.Value)}"));
                var url = $"{API_URL}?{queryString}";

                var response = await client.GetAsync(url);

                // Check if response is successful
                response.EnsureSuccessStatusCode();

                var responseBody = await response.Content.ReadAsStringAsync();
                var data = JsonDocument.Parse(responseBody);

                // Check API response status
                if (data.RootElement.GetProperty("status").GetString() == "ok")
                {
                    Console.WriteLine("✓ Success!");
                    Console.WriteLine("Response data: " + data.RootElement.GetProperty("data"));
                    return data;
                }
                else
                {
                    var error = data.RootElement.TryGetProperty("error", out var errorProp)
                        ? errorProp.GetString()
                        : "Unknown error";
                    Console.WriteLine($"✗ API Error: {error}");
                    return null;
                }
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine($"✗ Request failed: {e.Message}");
                return null;
            }
        }

        static async Task Main(string[] args)
        {
            Console.WriteLine("📤 Calling Institutional Holdings API...\n");

            var result = await CallInstitutionalHoldingsAPI();

            if (result != null)
            {
                Console.WriteLine("\n📊 Final Result:");
                Console.WriteLine(result.RootElement.GetProperty("data"));
            }
            else
            {
                Console.WriteLine("\n✗ API call failed");
            }
        }
    }
}
