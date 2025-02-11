*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ./payment_variables.resource
Resource    ../homepage/homepage_keywords.resource


*** Keywords ***
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

    # order billing page
    # get order number from billing pop up
    Wait Until Page Contains    กำลังชำระเงิน ชำระเงินสด ที่ร้านเซเว่นอีเลฟเว่น (7-11)

    Wait Until Element Is Visible    ${LOCATOR_CONTENT_BARCODE}    10s
    Wait Until Element Is Visible    ${LOCATOR_GET_ORDER_NUMBER}    10s

    Sleep    2s
    ${order_number}    Get Text    ${LOCATOR_GET_ORDER_NUMBER}
    Log    message=Order Number: ${order_number}

    # order date
    ${order_date}    Get Text    ${LOCATOR_GET_ORDER_DATE}
    Log    message=Order Date: ${order_date}

    Sleep    2s
    Wait Until Element Is Visible    ${LOCATOR_BTN_CLOSE_BILLING_POPUP}    10s
    Click Element    ${LOCATOR_BTN_CLOSE_BILLING_POPUP}

    Order Summary    ${order_number}    ${order_date}

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
    [Arguments]    ${order_number}    ${order_date}
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
    Wait Until Element Is Enabled    ${LOCATOR_ORDER_NUMBER}    10s
    # Execute Javascript    document.querySelector('span.order-number').click();
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
