*** Settings ***
Documentation     This suite file verify the valid users are allowed to access the portal


Resource    ../../resource/base/CommonFunctionalities.resource
Resource    ../../resource/templates/LoginTemplate.resource


Test Setup      Launch Browser And Navigate To URL
Test Teardown   Close Browser

Test Template   Verify Valid Login Template

*** Test Cases ***
Verify Accountant Login Test
    accountant  accountant  English (Indian)    OpenEMR

Verify Admin Login Test
    admin  pass  English (Indian)    OpenEMR

Verify Physician Login Test
    physician  physician  English (Indian)    OpenEMR

