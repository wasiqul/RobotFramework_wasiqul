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
    Sleep               5
    Click Element       xpath=//li[@class='new-item create-new-account-link skip-ajax-validation tab-opener']//span[@class='new-text'][contains(text(),'Account')]   
    Input Text          name=name    WasiqulAutobot    
    Input Text          name=emailAddress    abc${email-number}@yoho.com
    Click Button        xpath=//button[@class='submit-button common-tab-actions'] 
    Sleep               5  
    
CreateProductKW
    Click Element           class=place-holder-image 
    Sleep                   3
    Click Element           xpath=//span[contains(text(),'Products')] 
    Sleep                   5
    Double Click Element    xpath=//span[@class='icon create']
    Sleep                   5
    Click Element           xpath=//input[contains(@placeholder,'Product Name')]   
    Input Text              name=name    WasiqulAutobotProduct   
    Click Button            xpath=//button[contains(@class,'submit-button common-tab-actions')]
    Sleep                   3  

CreateRateKW
   Maximize Browser Window
   Scroll Element Into View    xpath=//div[contains(@class,'create-for-no-item product-create rate')]//div[contains(@class,'create-new add-rate')][contains(text(),'Add Rate')]
   Sleep                       3
   Click Element               xpath=//div[contains(@class,'create-for-no-item product-create rate')]//div[contains(@class,'create-new add-rate')][contains(text(),'Add Rate')]
   Sleep                       3
   Scroll Element Into View    xpath=//div[@class='new-list new-list-initialized boundary-check ps ps--theme_default move-action-menu-done initialized hide_this_dropdown_applicable']//span[@class='new-text'][contains(text(),'Metered Rate')]
   Sleep                       3
   Click Element               xpath=//div[contains(@class,'create-for-no-item product-create rate')]//div[contains(@class,'create-new add-rate')][contains(text(),'Add Rate')]
   Sleep                       3
   Click Element               xpath=//div[contains(@class,'create-for-no-item product-create rate sdfcddm need-to-hide-dropdown-panel')]//li[2]
   Sleep                       3
   Scroll Element Into View    xpath=//td[contains(@class,'rate_cell amount required-field')]//input[contains(@name,'price')]
   Click Element               xpath=//td[contains(@class,'rate_cell amount required-field')]//input[contains(@name,'price')] 
   Input Text                  name=price    50   
   Click Button                xpath=//button[contains(@class,'submit-button')]
   Sleep                       5 
   
*** Test Cases ***
    
LoginAutobillTest
    [Documentation]     This is Autobill login test case
    
    Set Browser Implicit Wait    5
    
    LoginKW
    Log    Loging in to Autobill

CreateProducttAutobillTest
   [Documentation]     This is Autobill Create Productt test case
   
   CreateProductKW
   Log    Creating a Product
   
   CreateRateKW
   Log    Creating a Rate

CreateAccountAutobillTest
    [Documentation]     This is Autobill Create Account test case
    
    CreateAccountKW
    Log    Creating an account
    
CreateOrderTest
    [Documentation]    This is Autobill Create Order test case
     
    Log    Creating an order

LogoutAutobillTest
    [Documentation]     This is Autobill logout test case
    
    LogoutKW
    Log    Loging out from Autobill
    
    Log    this test executed by %{username} in %{os}
       
    