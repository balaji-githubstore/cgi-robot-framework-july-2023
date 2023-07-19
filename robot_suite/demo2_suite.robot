*** Settings ***
Library   DateTime
Library     String
*** Variables ***
${BROWSER_NAME}     chrome

*** Test Cases ***
TC1
    ${current_data}  Get Current Date
    Log To Console    ${current_data}
    Log To Console    ${BROWSER_NAME}

TC2
    Log To Console    ${BROWSER_NAME}

TC3
    ${new_browser}  Convert To Upper Case    ${BROWSER_NAME}
    Log To Console    ${new_browser}

TC4
    ${num1}  Set Variable  $100,000
    ${num2}  Set Variable  $200,000,000
    #add two values and print it
    ${num1}     Remove String    ${num1}    $   ,
    ${num2}     Remove String    ${num2}    $   ,
#    ${num1}     Convert To Number    ${num1}
#    ${num2}     Convert To Integer    ${num2}
    ${res}      Evaluate    ${num1}+${num2}
    Log To Console    ${res}