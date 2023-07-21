*** Settings ***
Library     RPA.Excel.Files

*** Test Cases ***
TC1
    Open Workbook    path=${EXECDIR}${/}test_data${/}OpenEMRData.xlsx
    @{sheets}    List Worksheets
    Log    ${sheets}

TC2
    Open Workbook    path=${EXECDIR}${/}test_data${/}OpenEMRData.xlsx
    ${sheeet}   Read Worksheet      test_invalid_login
    Log  ${sheeet}
    Log  ${sheeet}[0]
     Log  ${sheeet}[0][A]

TC3
    Open Workbook    path=${EXECDIR}${/}test_data${/}OpenEMRData.xlsx
    ${sheeet}   Read Worksheet      test_invalid_login
    ${cell}     Get Cell Value    1    1
    Log    ${cell}
    Set Cell Value    1    3    hello
    Save Workbook