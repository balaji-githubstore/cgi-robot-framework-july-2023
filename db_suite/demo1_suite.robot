*** Settings ***
Library     DatabaseLibrary

Suite Setup     Connect To Database  dbapiModuleName=pymysql
    ...     dbName=dbfree_db    dbUsername=dbfree_db
    ...    dbPassword=12345678    dbHost=db4free.net    dbPort=3306

Suite Teardown      Disconnect From Database

*** Comments ***
Table name - Products
Column name - Product_ID, ProductName, description

*** Test Cases ***
TC1
    ${row_count}     Row Count    select * from Products
    Log To Console    ${row_count}
    
TC2
    Row Count Is Equal To X    select * from Products where ProductName='watch'    1
    Row Count Is Greater Than X    select * from Products    100
    Row Count Is Less Than X   select * from Products    200

TC3
    ${output}  Query    select * from Products where Product_ID<=1
    Log To Console    ${output}
    Log To Console    ${output}[0]
    Log To Console    ${output}[0][0]
    Log To Console    ${output}[0][1]
    Log To Console    ${output}[0][2]
    
    ${res}  Get Length    ${output}
    Log To Console    ${res}

TC4
    ${output}  Query    select * from Products
    Log To Console    ${output}
    Log To Console    ${output}[0]
    Log To Console    ${output}[0][0]
    Log To Console    ${output}[0][1]
    Log To Console    ${output}[0][2]
    ${res}  Get Length    ${output}
    Log To Console    ${res}
    ${res}  Get Length    ${output}[0]
    Log To Console    ${res}


TC5
    ${output}  Query    select * from Products where Product_ID=1
    Log To Console    ${output}

TC6
    Execute Sql String    update Products set ProductName='NEW WATCH' where Product_ID=1
    Row Count Is Equal To X    select * from Products where ProductName='NEW WATCH' and Product_ID=1    1
    Check If Exists In Database    select * from Products where ProductName='NEW WATCH'