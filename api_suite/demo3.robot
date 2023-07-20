*** Settings ***
Documentation       Get request for path parameter and query parameter
Library     RequestsLibrary
Library    OperatingSystem


*** Test Cases ***
TC1 Get Token
   @{cred}   Create List     user    passwd
   Create Session    alias=httpbin    url=https://httpbin.org/basic-auth    auth=${cred}
   ${res}   GET On Session   alias=httpbin   url=/user/passwd
   Log    ${res.json()}

TC2 Get Token
    @{cred}   Create List     user    passwd
   Create Session    alias=httpbin    url=https://httpbin.org/      auth=${cred}
   ${res}   GET On Session   alias=httpbin   url=/bearer