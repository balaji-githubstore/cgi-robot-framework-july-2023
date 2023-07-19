*** Settings ***
Documentation     This resource file contains all templates related to login suite

Resource    ../base/CommonFunctionalities.resource

*** Keywords ***
Verify Valid Login Template
    [Arguments]     ${username}     ${password}     ${langauge}     ${expected_title}
    Input Text    id=authUser    ${username}
    Input Password    css=#clearPass     ${password}
    Select From List By Label    name=languageChoice      ${langauge}
    Click Element    id=login-button
    Title Should Be    ${expected_title}

Verify Invalid Login Template
    [Arguments]     ${username}     ${password}     ${langauge}     ${expected_error}
    Input Text    id=authUser    ${username}
    Input Password    css=#clearPass    ${password}
    Select From List By Label    name=languageChoice      ${langauge}
    Click Element    id=login-button
    Element Text Should Be    xpath=//p[contains(text(),'Invalid')]    ${expected_error}