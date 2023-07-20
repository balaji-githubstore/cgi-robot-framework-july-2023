import requests
import json

url = "https://petstore.swagger.io/v2/pet/"

payload = json.dumps({
  "id": 8966,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie-8966",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
})


headers = {
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
