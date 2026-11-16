/**
 * Institutional Holdings API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the Institutional Holdings API.
 * API Documentation: https://docs.apiverve.com/ref/institutionalholdings
 */

const API_KEY = process.env.APIVERVE_API_KEY || 'YOUR_API_KEY_HERE';
const API_URL = 'https://api.apiverve.com/v1/institutionalholdings';

/**
 * Make a GET request to the Institutional Holdings API
 */
async function callInstitutionalHoldingsAPI() {
  try {
    // Query parameters
    const params &#x3D; new URLSearchParams({
            cik: &#x27;1067983&#x27;,
            manager: &#x27;berkshire hathaway&#x27;,
            ticker: &#x27;AAPL&#x27;,
            cusip: &#x27;037833100&#x27;,
            changeType: &#x27;new&#x27;,
            putCall: &#x27;none&#x27;,
            minValue: 1000000,
            maxValue: 1000000000,
            sort: &#x27;value&#x27;,
            order: &#x27;desc&#x27;
        });

    const response = await fetch(`${API_URL}?${params}`, {
      method: 'GET',
      headers: {
        'x-api-key': API_KEY
      }
    });

    // Check if response is successful
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();

    // Check API response status
    if (data.status === 'ok') {
      console.log('✓ Success!');
      console.log('Response data:', data.data);
      return data.data;
    } else {
      console.error('✗ API Error:', data.error || 'Unknown error');
      return null;
    }

  } catch (error) {
    console.error('✗ Request failed:', error.message);
    return null;
  }
}

// Run the example
callInstitutionalHoldingsAPI()
  .then(result => {
    if (result) {
      console.log('\n📊 Final Result:');
      console.log(JSON.stringify(result, null, 2));
    }
  });
