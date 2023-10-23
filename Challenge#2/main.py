import requests
import json

metadata_url = "" # Define the azure instance metadata URL

headers = {
    "Metadata": "true"
}

try:
    response = requests.get(metadata_url, headers=headers) # Send an HTTP GET request to the metadata URL with headers

    if response.status_code == 200: # Check if the request was successful
        metadata = json.loads(response.text)

        print(json.dumps(metadata, indent=4))
    else:
        print(f"failed to retrieve azure instance metadata. status code: {response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"An error occurred: {e}")

