*** Settings ***
Library     OperatingSystem

*** Test Cases ***
TC1
    Create Directory    C:${/}Mine${/}Demo${/}hello_folder
    Directory Should Exist    C:${/}Mine${/}Demo${/}hello_folder
    Remove Directory    C:${/}Mine${/}Demo${/}hello_folder
    Directory Should Not Exist    C:${/}Mine${/}Demo${/}hello_folder
    
TC2
   ${files}  List Files In Directory    C:${/}Mine${/}Demo${/}
   Log To Console    ${files}
   Log To Console    ${files}[0]
   
TC3
    ${output}   Get Binary File    C:${/}Mine${/}Demo${/}output.xml
    Log To Console    ${output}