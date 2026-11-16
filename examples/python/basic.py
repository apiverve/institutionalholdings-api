"""
Institutional Holdings API - Basic Usage Example

This example demonstrates the basic usage of the Institutional Holdings API.
API Documentation: https://docs.apiverve.com/ref/institutionalholdings
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/institutionalholdings'

def call_institutionalholdings_api():
    """
    Make a GET request to the Institutional Holdings API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;cik&#x27;: &#x27;1067983&#x27;, &#x27;manager&#x27;: &#x27;berkshire hathaway&#x27;, &#x27;ticker&#x27;: &#x27;AAPL&#x27;, &#x27;cusip&#x27;: &#x27;037833100&#x27;, &#x27;changeType&#x27;: &#x27;new&#x27;, &#x27;putCall&#x27;: &#x27;none&#x27;, &#x27;minValue&#x27;: 1000000, &#x27;maxValue&#x27;: 1000000000, &#x27;sort&#x27;: &#x27;value&#x27;, &#x27;order&#x27;: &#x27;desc&#x27;}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Institutional Holdings API...\n')

    result = call_institutionalholdings_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
