*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 Switch Window Using Title
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/
    Click Element    partial link=phpMyAdmin
    #below keyword helps to switch to new tab or window
    Switch Window   phpMyAdmin
    Input Text    id=input_username    admin
    #enter passsword as admin123
    Input Password    id=input_password    admin12
    #click on login
    Click Element    id=input_go
    #validate the error message contains "Access denied for user"
    Element Should Contain    id=pma_errors    Access denied for user
    Close Browser

TC1 Switch Window Using NEW & MAIN
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.db4free.net/
    Click Element    partial link=phpMyAdmin
    #below keyword helps to switch to latest opened tab or window
    Switch Window   NEW
    Input Text    id=input_username    admin
    #enter passsword as admin123
    Input Password    id=input_password    admin12
    #click on login
    Click Element    id=input_go
    #validate the error message contains "Access denied for user"
    Element Should Contain    id=pma_errors    Access denied for user
    Close Window
    Switch Window   MAIN
    Log Title
    Close Browser
