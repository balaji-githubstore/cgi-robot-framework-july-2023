*** Settings ***
Library    Collections

*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red     green    yellow
&{MOBILE_CAPS}   deviceName=oneplus      platformName=android    browserName=chrome

*** Test Cases ***
TC3
    Log To Console    ${MOBILE_CAPS}
    Log To Console    ${MOBILE_CAPS}[deviceName]

TC1
    Log To Console    ${BROWSER_NAME}
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]
    Log To Console    ${COLORS}[2]

TC2
   @{fruits}   Create List     mango   orange  apple
   Log To Console    ${fruits}
   #append grapes to the list
   Append To List    ${fruits}      grapes
   #remove orange from the list
   Remove Values From List    ${fruits}     orange
   #insert orange at index 0
   Insert Into List    ${fruits}    0    orange
   #print the list
   Log To Console    ${fruits}