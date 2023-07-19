*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC3
    Log To Console    hello${SPACE}${SPACE}${SPACE}world
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    #click on Go
    Click Element    xpath=//img[@alt='Go']
    ${actual_alert_text}    Handle Alert    action=ACCEPT   timeout=20s
    Log To Console    ${actual_alert_text}
    Should Be Equal As Strings    ${actual_alert_text}    Customer ID${SPACE}${SPACE}cannot be left blank.

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    #click on Go
#    Click Element    xpath=//img[@alt='Go']
    Alert Should Be Present     text=Customer ID${SPACE}${SPACE}cannot be left blank.   action=ACCEPT  timeout=20s