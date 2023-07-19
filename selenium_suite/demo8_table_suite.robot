*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
    ${name1}    Get Text    xpath=//table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}
    ${name2}    Get Text    xpath=//table[@id='example']/tbody/tr[2]/td[2]
    Log To Console    ${name2}
    
TC2
   FOR    ${i}    IN RANGE    1    11
       Log To Console    ${i}
   END

TC3 Get Name
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
   FOR    ${i}    IN RANGE    1    11
       ${name1}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name1}
   END
   
TC4 Get Name and click checkbox
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
   FOR    ${i}    IN RANGE    1    11
       ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        IF    '${name}'=='Brenden Wagner'
             Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
             BREAK
        END
   END

TC5 Get Name and click checkbox
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
   FOR    ${i}    IN RANGE    1    11
       ${name}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        IF    '${name}'=='Thor Walton'
             Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
             BREAK
        END
   END

TC4 Get Name From All page
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/initialisation/checkbox.html
   FOR    ${i}    IN RANGE    1    11
       ${name1}    Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name1}
   END