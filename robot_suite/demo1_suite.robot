*** Test Cases ***
TC1 Print My Name
  Log To Console    Balaji

TC2 Print My Name
  Log To Console    message=Welcome to Robot Framework Session

TC3
    ${my_name}  Set Variable    Balaji Dinakaran
    Log To Console    ${my_name}

TC4
    ${num1}  Set Variable  10
    ${num2}  Set Variable  20
    #add and print the result
    ${res}  Evaluate    ${num1}+${num2}
    Log To Console    ${res}
    Log    ${res}

TC5
    ${time}     Get Time
    Log To Console    ${time}
