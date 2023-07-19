*** Settings ***
Documentation    This resource files contains browser and screenshot configuration
...  for the openemr application

Library    SeleniumLibrary

*** Variables ***
${BROWSER_NAME}     chrome
${URL}   https://demo.openemr.io/b/openemr

*** Keywords ***
Launch Browser And Navigate To URL
    Open Browser    browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    20s
    Go To    url=${URL}
    Set Screenshot Directory    ${EXECDIR}${/}log${/}screenshots