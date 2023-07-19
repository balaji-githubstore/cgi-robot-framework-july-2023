*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Launch Browser
    [Arguments]     ${browser_name}
    Open Browser    browser=${browser_name}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s

*** Test Cases ***
TC1 Upload File
    Launch Browser  chrome
    Go To    url=https://smallpdf.com/pdf-to-word
    Choose File    xpath=//input[@type='file']    C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    Sleep    4s
    [Teardown]  Close Browser

TC2
    Launch Browser  edge
    Go To    url=https://nasscom.in/about-us/contact-us
    Mouse Over    xpath=//a[text()='Membership']
    Click Element    xpath=//a[text()='Members Listing']


TC3 JS
    Launch Browser  chrome
    Go To    url=https://www.citibank.co.in/ssjsps/forgetuseridmidssi.jsp
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Execute Javascript  document.querySelector("#bill-date-long").value='10/12/2000'
    Sleep    5s
    [Teardown]  Close Browser

TC4 JS & WebELement
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.citibank.co.in/ssjsps/forgetuseridmidssi.jsp
    Click Element    link=select your product type
    Click Element    link=Credit Card
    ${ele}      Get Webelement  xpath=//input[@id='bill-date-long']
    Execute Javascript  arguments[0].value='10/12/2000'     ARGUMENTS       ${ele}
    Sleep    5s
    [Teardown]  Close Browser