*** Settings ***
Library     RequestsLibrary

Suite Setup     Create Session    alias=petshop    url=https://petstore.swagger.io/v2
Suite Teardown      Delete All Sessions

*** Test Cases ***
TC1 Get Valid Pet By ID
    ${response}     GET On Session      alias=petshop   url=/pet/10     expected_status=200
    Log   ${response}
    Log   ${response.status_code}
    Log   ${response.json()}
    Log   ${response.json()}[id]
    Should Be Equal As Integers    ${response.json()}[id]    10
    Should Be Equal As Strings    ${response.json()}[name]    doggie
    
TC2 Get Invalid Pet ID
    ${response}     GET On Session      alias=petshop   url=/pet/8666   expected_status=404
    Log   ${response.json()}
    Log    ${response.json()}[message]
    Should Be Equal As Strings    ${response.json()}[message]    	Pet not found
