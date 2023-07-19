*** Settings ***
Documentation     This suite file verify the valid users are allowed to access the portal
...  Here is the example for data driven using excel
Library     DataDriver        file=../../test_data/OpenEMRData.xlsx     sheet_name=VerifyValidLoginTemplate

Resource    ../../resource/base/CommonFunctionalities.resource
#Resource    ../../resource/templates/LoginTemplate.resource

Test Setup      Launch Browser And Navigate To URL
Test Teardown   Close Browser

Test Template   Verify Valid Login Template

*** Test Cases ***
TC1


*** Keywords ***
Verify Valid Login Template
    [Arguments]     ${username}     ${password}     ${langauge}     ${expected_title}
    Input Text    id=authUser    ${username}
    Input Password    css=#clearPass     ${password}
    Select From List By Label    name=languageChoice      ${langauge}
    Click Element    id=login-button
    Title Should Be    ${expected_title}


