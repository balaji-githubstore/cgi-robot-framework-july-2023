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
    ${row_count}     Row Count    select * from Products
    Log To Console    ${row_count}






