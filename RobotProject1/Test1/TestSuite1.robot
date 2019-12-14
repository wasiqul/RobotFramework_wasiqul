*** Settings ***
Library    SeleniumLibrary    
Test Setup    Open Browser    ${url}    chrome
Test Teardown    Close Browser
Default Tags    Sanity

*** Variables ***
${url}    https://sso.autobill.com/
@{credentials}    Admin    admin123
&{credential}    username=implementer@4e78d51f    password=autobill

*** Keywords ***
LoginKW
    Input Text    id=email    &{credential}[username]  
    Input Password    id=password    &{credential}[password]
    Click Button    class=login-button

*** Test Cases ***
    
LoginSeleniumTest
    [Documentation]    This is my first sample test for login
    Set Browser Implicit Wait    5
    LoginKW
    Sleep    5
    Click Element    class=place-holder-image 
    Sleep    5 
    Click Element    xpath=//span[contains(text(),'Logout')]   
    Log    Login than Logout from Autobill
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
    