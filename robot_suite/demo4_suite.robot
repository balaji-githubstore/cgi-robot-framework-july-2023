*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC2
    Log To Console    hello${SPACE}${SPACE}${SPACE}world
    Log To Console    ${CURDIR}
    Log To Console    ${EXECDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}
    Log To Console    ${TEMPDIR}
 
TC3
    Log To Console    C:\\Mine\\Balaji-Profile_2023_1.pdf
    Log To Console    C:${/}Mine${/}Balaji-Profile_2023_1.pdf