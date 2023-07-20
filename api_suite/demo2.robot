*** Settings ***
Documentation       Get request for path parameter and query parameter
Library     RequestsLibrary
Library    OperatingSystem

Suite Setup     Create Session    alias=petshop    url=https://petstore.swagger.io/v2
Suite Teardown      Delete All Sessions


*** Test Cases ***
TC1 Add Valid Pet
    ${json}     Get Binary File     ${EXECDIR}${/}test_data${/}new_pet.json

    &{header_dic}   Create Dictionary       Content-Type=application/json       Connection=keep-alive

    ${response}    POST On Session     alias=petshop       url=/pet      headers=${header_dic}
    ...  data=${json}     expected_status=200
    Log    ${response.json()}
    Log    ${response.json()}[name]
    Should Be Equal As Integers    ${response.json()}[id]    788
    Should Be Equal As Strings    ${response.json()}[name]    doggie-788

TC2 Delete Valid Pet
    &{api_key_dic}      Create Dictionary       api_key=jdjfsjsfdj234423
    ${response}     DELETE On Session   alias=petshop      url=/pet/788
    ...  headers=${api_key_dic}    expected_status=200
    Log    ${response.json()}

TC3 Delete Valid Pet
    ${token}    Get Access Token New
    &{api_key_dic}      Create Dictionary       api_key=${token}
    ${response}     DELETE On Session   alias=petshop      url=/pet/788
    ...  headers=${api_key_dic}    expected_status=200
    Log    ${response.json()}

    
TC4 Upload Image 
    ${file}     Get Binary File    ${EXECDIR}${/}test_data${/}feedback 3.png
    &{dic}      Create Dictionary   file=${file}    type=image/png
    ${response}     POST On Session   alias=petshop     url=/pet/788/uploadImage    files=${dic}
    Log    ${response.json()}
    Should Contain    ${response.json()}[message]    File uploaded


*** Keywords ***
Get Access Token
   @{cred}   Create List     user    passwd
   Create Session    alias=httpbin    url=https://httpbin.org/basic-auth    auth=${cred}
   ${res}   GET On Session   alias=httpbin   url=/user/passwd
   Log    ${res.json()}

Get Access Token New
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}     GET On Session      alias=petshop   url=/pet/788    expected_status=200
    [Return]    ${response.json()}[id]

