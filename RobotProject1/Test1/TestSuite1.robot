*** Settings ***
Library    SeleniumLibrary    
Test Setup    Open Browser    ${url}    chrome
Test Teardown    Close Browser
Default Tags    Sanity

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/
@{credentials}    Admin    admin123
&{credential}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{credentials}[0]    
    Input Password    id=txtPassword    &{credential}[password]
    Click Button    id=btnLogin

*** Test Cases ***
    
LoginSeleniumTest
    [Documentation]    This is my first sample test for login
    Set Browser Implicit Wait    5
    LoginKW
    Sleep    5
    Click Element    id=welcome    
    Click Link    link=Logout        
    Log    Login than Logout from OrangeHRM
    Log    this test executed by %{username} in %{os}
    
*** Comments ***
MyFirstTest
    Log    Hello World    
    
FirstSeleniumTest
    
    Set Browser Implicit Wait    5
    Input Text    name=q    wasiqul   
    Sleep    5
    Press Keys    name=btnK    ENTER
    Sleep    5    
    