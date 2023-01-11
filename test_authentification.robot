*** Settings ***
Documentation     Test Authtentification.
Library           SeleniumLibrary 

*** Variables ***

${URL}      https://www.amazon.fr
${BROWSER}  Firefox
${login}    annemarziale@hotmail.com
${password}  12345
${USERNAME}  Anne

*** Test Cases ***
Valid Login
    Open Browser To Home Page
    Click To Login Page
    Send Login
    Click To Continue
    Click To Submit
    [TearDown]   Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser     ${URL}    ${BROWSER}

Accept Cookie
    Wait Until Element Is Visible    sp-cc-accept
    Click Element    sp-cc-accept
Click To Login Page
    Wait Until Element Is Visible   nav-link-accountList-nav-line-1
    Click Element    nav-link-accountList-nav-line-1

Send Login
    Input Text  email  ${login}

Click To Continue
    Click Element  continue

Send Password
    Input Text  password  ${password}

Click To Submit 
    Click Element  signInSubmit

Check UserName
    Element Should Contain    nav-link-accountList-nav-line-1   ${USERNAME}
