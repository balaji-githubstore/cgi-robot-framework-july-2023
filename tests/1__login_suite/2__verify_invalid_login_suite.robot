*** Settings ***
Documentation     This suite file verify the invalid users are not allowed
...  to access the portal


Resource    ../../resource/base/CommonFunctionalities.resource
Resource    ../../resource/templates/LoginTemplate.resource

Test Setup      Launch Browser And Navigate To URL
Test Teardown   Close Browser

Test Template   Verify Invalid Login Template

*** Test Cases ***
TC1
    john    john123     Dutch   Invalid username or password
TC2
    peter    peter123     Dutch   Invalid username or password


