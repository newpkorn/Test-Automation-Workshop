*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Settings ***
Library     SeleniumLibrary
Resource    ./shipping_variables.resource
Resource    ../authen/login_keywords.resource


*** Keywords ***
Perform Shipping Address
    Log    Navigate to Shipping Address...

    Click Element    ${LOCATOR_BTN_PROCEED_TO_PAYMENT}
    Wait Until Page Contains    สามารถเข้าใช้งานด้วยบัญชีเดียวกับ 7 App    10s

    # Login with the existing account to proceed payment
    Navigate To Login Page    ${username}    ${password}
    Wait Until Page Contains    รายละเอียดการจัดส่งสินค้า    10s

    Enter Shipping Address
    ...    ชญานิศา
    ...    วงศ์ภักดี
    ...    0895678912
    ...    45/89
    ...    พระโขนง
    ...    กรุงเทพมหานคร
    ...    คลองเตย
    ...    คลองเตย
    ...    10110

Navigate To Login Page
    [Arguments]    ${username}    ${password}
    Perform To Login    ${username}    ${password}

Enter Shipping Address
    [Arguments]
    ...    ${name}
    ...    ${lastname}
    ...    ${phone}
    ...    ${addr_no}
    ...    ${soi}
    ...    ${province}
    ...    ${district}
    ...    ${sub_district}
    ...    ${postal_code}

    Click Element    ${LOCATOR_ADDRESS_TAB}
    Wait Until Element Is Visible    ${LOCATOR_NEW_ADDRESS}
    Click Element    ${LOCATOR_NEW_ADDRESS}

    Wait Until Element Is Visible    ${LOCATOR_CUSTOMER_NAME}
    Input Text    ${LOCATOR_CUSTOMER_NAME}    ${name}
    Input Text    ${LOCATOR_CUSTOMER_LASTNAME}    ${lastname}
    Input Text    ${LOCATOR_CUSTOMER_PHONE_NUMBER}    ${phone}
    Input Text    ${LOCATOR_CUSTOMER_ADDRESS_NUMBER}    ${addr_no}
    Input Text    ${LOCATOR_CUSTOMER_ADDRESS_SOI}    ${soi}

    Click Element    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_PROVINCE}
    Wait Until Element Is Visible    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_PROVINCE_RESULTS}
    Click Element    css=[id$='-${province}']

    Click Element    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT}
    Wait Until Element Is Visible    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT_RESULTS}
    Click Element    css=[id$='-${district}']

    Click Element    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT}
    Wait Until Element Is Visible    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT_RESULTS}
    Click Element    css=[id$='-${sub_district}']

    Select Popup Location

    # wait button continue payment visible and enabled
    Wait Until Element Is Visible    ${LOCATOR_BTN_CONTINUE_PAYMENT}    10s
    Wait Until Element Is Enabled    ${LOCATOR_BTN_CONTINUE_PAYMENT}

    # click continue payment
    Scroll Element Into View    ${LOCATOR_BTN_CONTINUE_PAYMENT}
    Click Element    ${LOCATOR_BTN_CONTINUE_PAYMENT}

    Wait Until Page Contains    วิธีการชำระเงิน

Select Popup Location
    Sleep    2s
    Wait Until Element Is Visible    ${LOCATOR_BTN_SELECT_LOCATION}
    Click Element    ${LOCATOR_BTN_SELECT_LOCATION}

    Sleep    2s
    Wait Until Element Is Visible    ${LOCATOR_BTN_SELECT_ADDR}
    Click Element    ${LOCATOR_BTN_SELECT_ADDR}
