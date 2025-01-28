*** Comments ***
# Deverlop By: Pakorn Soikham
# Date: 25-01-2025


*** Settings ***
Library     SeleniumLibrary
Library     env_keywords.py
Library     String
Library     Collections
Resource    variables.resource


*** Keywords ***
Open Web Browser
    # Set Selenium Speed    0.5
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window

Search and Select Products
    [Arguments]    ${Search Keyword}    ${Search Results}
    Search Product    ${Search Keyword}
    Press Enter
    Review Search Results    ${Search Results}
    Select Product    ${Search Keyword}

Search Product
    [Arguments]    ${Search Keyword}
    Wait Until Element Is Visible    ${LOCATOR_SEARCH}
    Input Text    ${LOCATOR_SEARCH}    ${Search Keyword}

Press Enter
    Press Keys    None    RETURN

Review Search Results
    [Arguments]    ${expected_keyword}
    Wait Until Page Contains    ${expected_keyword}    10s

Select Product
    [Arguments]    ${Product_Name}
    ${DYNAMIC_LOCATOR}    Set Variable    css=a[title*='${Product_Name}']
    Wait Until Element Is Visible    ${LOCATOR_COOKIE_POPUP}
    Scroll Element Into View    ${DYNAMIC_LOCATOR}
    Sleep    1s
    Click Element    ${DYNAMIC_LOCATOR}

    # check if the product is selected.
    Wait Until Page Contains    ${Product_Name}    timeout=5s
    Click Button    ${LOCATOR_BTN_ADD_TO_CART}

Open Shopping Cart
    Double Click Element    ${LOCATOR_MINI_BASKET}
    Wait Until Page Contains    ตะกร้าของฉัน    10s

Review and Checkout
    [Arguments]
    ...    ${xpath_Name}
    ...    ${Product_Name}
    ...    ${xpath_Quantity}
    ...    ${Quantity_Expected}
    ...    ${xpath_Price}
    ...    ${Price_Expected}
    Check Product Details
    ...    ${xpath_Name}
    ...    ${Product_Name}
    ...    ${xpath_Quantity}
    ...    ${Quantity_Expected}
    ...    ${xpath_Price}
    ...    ${Price_Expected}

Check Product Details
    [Arguments]
    ...    ${xpath_Name}
    ...    ${Product_Name}
    ...    ${xpath_Quantity}
    ...    ${Quantity_Expected}
    ...    ${xpath_Price}
    ...    ${Price_Expected}
    Element Should Contain
    ...    ${xpath_Name}    ${Product_Name}

    Element Attribute Value Should Be
    ...    ${xpath_Quantity}    value    ${Quantity_Expected}

    Element Text Should Be
    ...    ${xpath_Price}    ${Price_Expected}

Check Total Price
    [Arguments]
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}
    Element Text Should Be
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}

Proceed to Payment
    Execute JavaScript    document.querySelector("a.btn-proceed").click();
    Wait Until Page Contains    สามารถเข้าใช้งานด้วยบัญชีเดียวกับ 7 App    10s

    # Login with the existing account to proceed payment
    Login
    Wait Until Page Contains    รายละเอียดการจัดส่งสินค้า    10s

    # continue payment
    Execute JavaScript    document.querySelector("button#continue-payment-btn").click();
    Wait Until Page Contains    วิธีการชำระเงิน

Enter Store Code
    [Arguments]    ${store_id}
    Wait Until Element Is Visible    ${LOCATOR_STORE_FINDER}    10s
    # Click Element    ${LOCATOR_STORE_FINDER}
    Execute JavaScript    document.querySelector('button[data-target="#store-number-tab"]').click()

    # store id
    Wait Until Element Is Visible    ${LOCATOR_STORE_NUMBER_INPUT}
    Input Text    ${LOCATOR_STORE_NUMBER_INPUT}    ${store_id}
    Click Element    ${LOCATOR_BTN_CHK_STORE_NUMBER}

    # store detail
    Wait Until Element Is Visible    ${LOCATOR_STORE_DETAIL}    10s

Fill Shipping Address
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

    # Select Delivery to Address
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

    Execute JavaScript    document.querySelector('div[class*="alert-cookie"]').style.display = 'none';
    Wait Until Element Is Not Visible    xpath=//div[contains(@class, 'alert-cookie-gdpr-allonline__content')]

    Click Element    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT}
    Wait Until Element Is Visible    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT_RESULTS}
    Click Element    css=[id$='-${sub_district}']

    # selected-location
    Wait Until Element Is Visible    ${LOCATOR_BTN_SELECT_LOCATION}    10s
    Scroll Element Into View    ${LOCATOR_BTN_SELECT_LOCATION}
    Click Element    ${LOCATOR_BTN_SELECT_LOCATION}

    # wait id='conf-dif-addr' visible
    Wait Until Element Is Visible    ${LOCATOR_BTN_SELECT_ADDR}    10s
    Scroll Element Into View    ${LOCATOR_BTN_SELECT_ADDR}
    Click Element    ${LOCATOR_BTN_SELECT_ADDR}

    # wait button continue payment visible and enabled
    Wait Until Element Is Visible    ${LOCATOR_BTN_CONTINUE_PAYMENT}    10s
    Wait Until Element Is Enabled    ${LOCATOR_BTN_CONTINUE_PAYMENT}    10s

    # click continue payment
    Execute JavaScript    document.getElementById("continue-payment-btn").click()

Pay with Cash at 7-Eleven
    Wait Until Page Contains    วิธีการชำระเงิน
    Wait Until Element Is Visible    ${LOCATOR_PAYMENT_OPTION_TAB}    10s
    Click Element    ${LOCATOR_PAYMENT_OPTION_TAB}
    Wait Until Element Is Visible    ${LOCATOR_PAYMENT_CASE_INFO}

    Product Details

    # Click Element    ${LOCATOR_BTN_ORDER}
    Execute Javascript    document.querySelector(".alert-cookie-gdpr-allonline").style.display = "none";
    Sleep    2s
    Click Element    ${LOCATOR_BTN_ORDER}

    Log To Console    message=Navigate to order details page...
    Order Summary

Product Details
    Order Detail    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_CHK_PRODUCT_NAME_ITEM_1}
    ...    ${PRODUCT_ITEM_1}
    ...    ${LOCATOR_CHK_PRODUCT_QTY_ITEM_1}
    ...    ${PRODUCT_QTY}
    ...    ${LOCATOR_CHK_PRODUCT_PRICE_ITEM_1}
    ...    ${PRODUCT_PRICE_ITEM_1}
    Order Detail
    ...    ${LOCATOR_CHK_PRODUCT_NAME_ITEM_2}
    ...    ${PRODUCT_ITEM_2}
    ...    ${LOCATOR_CHK_PRODUCT_QTY_ITEM_2}
    ...    ${PRODUCT_QTY}
    ...    ${LOCATOR_CHK_PRODUCT_PRICE_ITEM_2}
    ...    ${PRODUCT_PRICE_ITEM_2}
    Order Detail
    ...    ${LOCATOR_CHK_PRODUCT_NAME_ITEM_3}
    ...    ${PRODUCT_ITEM_3}
    ...    ${LOCATOR_CHK_PRODUCT_QTY_ITEM_3}
    ...    ${PRODUCT_QTY}
    ...    ${LOCATOR_CHK_PRODUCT_PRICE_ITEM_3}
    ...    ${PRODUCT_PRICE_ITEM_3}
    Total Price
    ...    ${LOCATOR_CHK_TOTAL_PRICE}
    ...    ${TOTAL_PRICE}
    Shipping Fee
    ...    ${LOCATOR_CHK_SHIPPING_FEE}
    ...    ${SHIPPING_FEE}
    Net Total
    ...    ${LOCATOR_CHK_NET_TOTAL}
    ...    ${NET_TOTAL}
    Earn All Member Points
    ...    ${LOCATOR_CHK_ALL_MEMBER_POINTS}
    ...    ${ALL_MEMBER_POINTS}

Order Detail
    [Arguments]
    ...    ${xpath_Name}
    ...    ${Product_Name}
    ...    ${xpath_Quantity}
    ...    ${Quantity_Expected}
    ...    ${xpath_Price}
    ...    ${Price_Expected}
    Element Text Should Be    ${xpath_Name}    ${Product_Name}
    Element Text Should Be    ${xpath_Quantity}    ${Quantity_Expected}
    Element Text Should Be    ${xpath_Price}    ${Price_Expected}

Total Price
    [Arguments]
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}
    Element Text Should Be
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}

Shipping Fee
    [Arguments]
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}
    Element Text Should Be
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}

Net Total
    [Arguments]
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}
    Element Text Should Be
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}

Earn All Member Points
    [Arguments]
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}
    Element Text Should Be
    ...    ${xpath_TotalPrice}
    ...    ${Expected_TotalPrice}

Order Summary
    # order billing page
    # get order number from billing pop up
    Wait Until Element Is Visible    ${LOCATOR_MODAL_BILLING}    10s
    Wait Until Element Is Visible    ${LOCATOR_CONTENT_BARCODE}    10s
    Wait Until Page Contains    เลขที่ใบแจ้งสินค้า
    Wait Until Element Is Visible    ${LOCATOR_GET_ORDER_NUMBER}    10s
    Sleep    2s
    ${order_number}    Get Text    ${LOCATOR_GET_ORDER_NUMBER}
    Log    message=Order Number: ${order_number}

    # order date
    ${order_date}    Get Text    ${LOCATOR_GET_ORDER_DATE}
    Log    message=Order Date: ${order_date}

    Execute Javascript
    ...    window.scrollTo(0, document.evaluate('//*[@class="csCloseModal"]//i[@class="icon-times-circle"]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.getBoundingClientRect().top - 100);
    Wait Until Element Is Visible    ${LOCATOR_BTN_CLOSE_BILLING_POPUP}    10s
    Click Element    ${LOCATOR_BTN_CLOSE_BILLING_POPUP}

    Wait Until Page Contains    การสั่งซื้อสำเร็จ! ขอบคุณที่ไว้วางใจในสินค้าและบริการจากเรา

    # go to order history
    Wait Until Element Is Visible    ${LOCATOR_ORDER_HISTORY}
    # Click Element    ${LOCATOR_ORDER_HISTORY}
    Execute Javascript    document.querySelector('a.e-Tax-detail-url').click();
    Wait Until Page Contains    ประวัติการสั่งซื้อ

    # checking the current page contains order number
    Page Should Contain    ${order_number}
    Log    message=Order Number: ${order_number}

    # check order number
    Element Text Should Be    ${LOCATOR_ORDER_NUMBER}    ${order_number}

    # click order detail
    Wait Until Element Is Visible    ${LOCATOR_ORDER_NUMBER}    10s
    Click Element    ${LOCATOR_ORDER_NUMBER}

    Wait Until Page Contains    รายละเอียดการสั่งซื้อ

    Element Text Should Be
    ...    ${LOCATOR_CHK_ORDER_NUMBER}
    ...    หมายเลขสั่งซื้อ #${order_number}

    # check order date
    ${order_date_list}    Split String    ${order_date}    ${SPACE}
    ${order_date_only}    Get From List    ${order_date_list}    0
    ${day}    ${month}    ${year}    Split String    ${order_date_only}    /
    ${year_th}    Evaluate    ${year} + 543
    ${order_date_th}    Set Variable    ${day}/${month}/${year_th}
    Element Text Should Be
    ...    ${LOCATOR_CHK_ORDER_DATE}
    ...    วันที่สั่งซื้อ ${order_date_th}

    # check payment method
    Element Text Should Be
    ...    ${LOCATOR_PAYMENT_TYPE}
    ...    ชำระเงินสด ที่ร้านเซเว่นอีเลฟเว่น (7-11)

    # check delivery address
    Wait Until Element Is Visible    ${LOCATOR_DELIVERY_ADDR}
    ${address_text}    Get Text    ${LOCATOR_DELIVERY_ADDR}
    Log    ${address_text}
    ${cleaned_address_text}    Replace String    ${address_text}    \n    ${SPACE}

    # ckeck delivery address
    Should Contain
    ...    ${cleaned_address_text}
    ...    ชญานิศา วงศ์ภักดี เบอร์โทรติดต่อ : 0895678912 45/89 พระโขนง, คลองเตย คลองเตย กรุงเทพมหานคร 10110

    # check product details
    Element Text Should Be
    ...    ${XPATH_TOTAL_PRICE}
    ...    ${TOTAL_PRICE}
    Element Text Should Be
    ...    ${XPATH_SHIPPING_FEE}
    ...    ${SHIPPING_FEE}

    Element Text Should Be
    ...    ${XPATH_NET_TOTAL}
    ...    ${NET_TOTAL}
    Element Text Should Be
    ...    ${XPATH_ALL_MEMBER_POINTS}
    ...    ${ALL_MEMBER_POINTS}

    # check order details
    Element Text Should Be
    ...    ${XPATH_PRODUCT_ITEM_1}
    ...    ${PRODUCT_ITEM_1}
    Element Text Should Be
    ...    ${XPATH_PRODUCT_QTY_1}
    ...    ${PRODUCT_QTY}
    Element Text Should Be
    ...    ${XPATH_PRODUCT_PRICE_1}
    ...    ${PRODUCT_PRICE_ITEM_1}

    Element Text Should Be
    ...    ${XPATH_PRODUCT_ITEM_2}
    ...    ${PRODUCT_ITEM_2}
    Element Text Should Be
    ...    ${XPATH_PRODUCT_QTY_2}
    ...    ${PRODUCT_QTY}
    Element Text Should Be
    ...    ${XPATH_PRODUCT_PRICE_2}
    ...    ${PRODUCT_PRICE_ITEM_2}

    Element Text Should Be
    ...    ${XPATH_PRODUCT_ITEM_3}
    ...    ${PRODUCT_ITEM_3}
    Element Text Should Be
    ...    ${XPATH_PRODUCT_QTY_3}
    ...    ${PRODUCT_QTY}
    Element Text Should Be
    ...    ${XPATH_PRODUCT_PRICE_3}
    ...    ${PRODUCT_PRICE_ITEM_3}

Login
    ${u}    Get Env Variable    username
    ${p}    Get Env Variable    password
    Wait Until Element Is Visible    name=email    10s
    Input Text    name=email    ${u}
    Input Password    name=password    ${p}
    Click Element    ${LOCATOR_BTN_LOGIN}
