*** Settings ***
Documentation     A resource file with reusable keywords.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary and Screenshot.
Library           SeleniumLibrary

Resource          ${CONFIG_FILE_PATH}
Resource          ${KEYWORDS_FILE_PATH}
Resource          ${POM_FILES_PATH}

*** Keywords ***
Open and Maximize Browser
    [Arguments]     ${browser}
    Custom Tag  Open and Maximize Browser
    
    Open Browser    browser=${browser}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    
Go To Website
    [Arguments]     ${page}
    Custom Tag  Go To Website
    Go To   ${page}

Login user with username and password
    [Arguments]     ${username}     ${password}
    Custom Tag  Login user with username and password
    Input Text  ${Username_input}   ${username}
    Input Text  ${Password_input}   ${password}
    Click Element   ${Login_button}

Verify page title is visible
    [Arguments]     ${title}
    Custom Tag  Verify page title is visible
    Element Text Should Be  ${Page_title}   ${title}    ignore_case=True
    Custom Screenshot   Page

Verify page title is not visible
    Custom Tag  Verify page title is not visible
    Element Should Not Be Visible   ${Page_title}
    
Verify error message is visible
    Custom Tag  Verify error message is visible
    Element Should Be Visible   ${Error_message}
    Custom Screenshot   Page