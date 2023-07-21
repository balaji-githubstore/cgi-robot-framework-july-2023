*** Settings ***
Library     RPA.PDF

*** Test Cases ***
TC1
    Open Pdf    source_path=C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    ${res}      Get Text From Pdf
    Log    ${res}
    ${page1}    Convert To Integer    1
    Log    ${res}[${page1}]


TC2
    Open Pdf    source_path=C:${/}Mine${/}Balaji-Profile_2023_1.pdf
    ${page_count}   Get Number Of Pages
    Log    ${page_count}

    ${res}      Get Text From Pdf
    Log    ${res}

    ${page1}    Convert To Integer    1
    Log    ${res}[${page1}]