*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    url=https://www.facebook.com/       browser=chrome
    ${actual_title}     Get Title
    Log To Console    ${actual_title}
    Should Be Equal As Strings    ${actual_title}    Facebook – log in or sign up
    Close Browser

TC2
    Open Browser    url=https://www.facebook.com/       browser=chrome
#    Input Text    locator=id:email    text=john123456@gmail.com
    Input Text    id:email    john123456@gmail.com
    Input Password    css=#pass    welcome123
    Click Element    name=login

TC3
    Open Browser    browser=chrome
    Set Selenium Implicit Wait    20s
    Maximize Browser Window
    Go To    url=https://www.facebook.com/
    #click on create new account
    Click Element    link=Create new account
    Input Text    name=firstname    john
    Input Text    name=lastname    wick
    #click custom radio button
    #select the date 20 Dec 2000
    Select From List By Label    id=day     20
    Select From List By Label    id=month   Dec
#    Select From List By Value    id=month   12
#    Select From List By Index    id=month   11
    Select From List By Label    id=year    2000
    Click Element    xpath=//input[@value='-1']
