*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1 
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=https://www.salesforce.com/in/form/signup/freetrial-sales/
    Input Text    name=UserFirstName    John
    Input Text    name=UserLastName    wick
    Input Text    xpath=//input[contains(@id,'UserEmail')]    john@gmail.com
    Select From List By Label    name=UserTitle     IT Manager
    Input Text    name=CompanyName    CCCS
    #    Select country as “United Kingdom”
    Select From List By Label    name=CompanyCountry    United Kingdom
    Select From List By Value    name=CompanyEmployees      150
#9.  Click on check box
    Click Element    xpath=//div[@class='checkbox-ui']
    Click Element    name=start my free trial
    Element Text Should Be    xpath=//span[contains(@id,'UserPh')]    Enter a valid phone number