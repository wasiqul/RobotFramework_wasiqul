*** Settings ***
Library    SeleniumLibrary 
Library    String       
Suite Setup    Open Browser    ${url}    chrome
Suite Teardown    Close Browser
Default Tags    Sanity

*** Variables ***
${url}    https://sso.autobill.com/
&{credential}    username=implementer@4e78d51f    password=autobill

*** Keywords ***
LoginKW
    Input Text          id=email        &{credential}[username]  
    Input Password      id=password     &{credential}[password]
    Click Button        class=login-button
    Sleep               5
    
LogoutKW
    Click Element       class=place-holder-image 
    Sleep               3
    Click Element       xpath=//span[contains(text(),'Logout')]   
    
CreateAccountKW
    ${email-number}     Generate Random String  8  [NUMBERS]
    [Return]            ${email-number}
    
    Click Element       xpath=//span[@class='icon lnr lnr-plus-circle']
    Sleep               2
    Click Element       xpath=//span[@class='new-text'][contains(text(),'Account')]    
    Input Text          name=name    WasiqulAutobot    
    Input Text          name=emailAddress    abc${email-number}@yoho.com
    Click Button        xpath=//button[@class='submit-button common-tab-actions'] 
    Sleep               5  

*** Test Cases ***
    
LoginAutobillTest
    [Documentation]     This is Autobill login test case
    
    Set Browser Implicit Wait    5
    
    LoginKW
    Log    Loging in to Autobill

CreateAccountAutobillTest
    [Documentation]     This is Autobill Create Account test case
    
    CreateAccountKW
    Log    Creating an account

LogoutAutobillTest
    [Documentation]     This is Autobill logout test case
    
    LogoutKW
    Log    Loging out from Autobill
    
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
    