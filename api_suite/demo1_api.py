import requests

response=requests.get("https://petstore.swagger.io/v2/pet/10")
print(response)
print(response.status_code)
print(response.reason)
print(response.text)
print(response.json())


