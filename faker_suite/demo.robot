*** Settings ***
Library     FakerLibrary

*** Test Cases ***
TC1
    ${word}     FakerLibrary.Word
    Log To Console    ${word}
    ${word}     FakerLibrary.Credit Card Number
    Log To Console    ${word}
    ${word}     FakerLibrary.First Name
    Log To Console    ${word}
