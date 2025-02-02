*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Settings ***
Library     SeleniumLibrary
Resource    ./login_variables.resource
Resource    ../common/browser.resource


*** Keywords ***
Perform To Login
    [Arguments]    ${username}    ${password}
    Open Login Page
    Login Wtih The Username And Password    ${username}    ${password}

Open Login Page
    # Click Element    ${LOCATER_BTN_LOGIN_PAGE}
    Wait Until Page Contains    ${CONTENT_LOGIN_PAGE}    10s

Login Wtih The Username And Password
    [Arguments]    ${username}    ${password}
    Enter Credentials    ${username}    ${password}
    Click Login Button

Enter Credentials
    [Arguments]    ${username}    ${password}

    Wait Until Element Is Visible    ${LOCATOR_USERNAME}    10s

    Input Text    ${LOCATOR_USERNAME}    ${username}
    Input Password    ${LOCATOR_PASSWORD}    ${password}

Click Login Button
    Click Element    ${LOCATOR_BTN_LOGIN}
