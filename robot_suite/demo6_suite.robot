
*** Settings ***
Test Template   TC1 Template

*** Test Cases ***
TC1
    hi     john

TC2
    hello   peter


#overriding the template in settings section
TC3
    [Template]
    Log To Console    hello

*** Keywords ***
TC1 Template
    [Arguments]     ${message}   ${name}
    Log To Console    ${message}
    Log To Console    ${name}