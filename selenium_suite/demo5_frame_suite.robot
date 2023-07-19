*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    Select Frame    xpath=//frame[@name='login_page']
    #enter userid as  john123
    Input Text    name=fldLoginUserId7787    john123
    #click on Continue
    Click Element    link=CONTINUE
    Unselect Frame
    [Teardown]      Close Browser
