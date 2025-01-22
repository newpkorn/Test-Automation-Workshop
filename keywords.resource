*** Settings ***
Library     SeleniumLibrary
Library     env_keywords.py
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
    [Arguments]    ${Product}
    Click Element    ${LOCATOR_PRODUCT_ITEM}
    Wait Until Page Contains    ${Product}
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
    # Click Element    ${LOCATOR_BTN_CONTINUE_PAYMENT}
    Execute JavaScript    document.querySelector("a.btn-proceed").click();
    Wait Until Page Contains    สามารถเข้าใช้งานด้วยบัญชีเดียวกับ 7 App    10s

    # Login with the existing account to proceed payment
    Login
    Wait Until Page Contains    รายละเอียดการจัดส่งสินค้า    10s

    # continue payment
    # Wait Until Element Is Enabled    ${LOCATOR_BTN_CONTINUE_PAYMENT}
    Execute JavaScript    document.querySelector("button#continue-payment-btn").click();
    Wait Until Page Contains    วิธีการชำระเงิน

Enter Store Code
    [Arguments]    ${store_id}
    Click Element    ${LOCATOR_STORE_FINDER}
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
    # Select From List By Label    ${LOCATOR_CUSTOMER_PROVINCE}    ${province}
    Input Text    ${LOCATOR_INPUT_LOCATION_FIELD}    ${province}
    Press Enter

    Click Element    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT}
    # Select From List By Label    ${LOCATOR_CUSTOMER_DISTRICT}    ${district}
    Input Text    ${LOCATOR_INPUT_LOCATION_FIELD}    ${district}
    Press Enter

    Click Element    ${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT}
    # Select From List By Label    ${LOCATOR_CUSTOMER_SUB_DISTRICT}    ${sub_district}
    Input Text    ${LOCATOR_INPUT_LOCATION_FIELD}    ${sub_district}
    Press Enter

    # selected-location
    Scroll Element Into View    ${LOCATOR_BTN_SELECT_LOCATION}
    Wait Until Element Is Visible    ${LOCATOR_BTN_SELECT_LOCATION}    10s
    Click Element    ${LOCATOR_BTN_SELECT_LOCATION}

    # wait id='conf-dif-addr' visible
    # Scroll Element Into View    ${LOCATOR_BTN_SELECT_ADDR}
    Wait Until Element Is Visible    ${LOCATOR_BTN_SELECT_ADDR}    10s
    Click Element    ${LOCATOR_BTN_SELECT_ADDR}

    # wait button continue payment visible and enabled
    Wait Until Element Is Visible    ${LOCATOR_BTN_CONTINUE_PAYMENT}    10s
    Wait Until Element Is Enabled    ${LOCATOR_BTN_CONTINUE_PAYMENT}    10s

    # click continue payment
    # Click Element    ${LOCATOR_BTN_CONTINUE_PAYMENT}
    Execute JavaScript    document.getElementById("continue-payment-btn").click()

Pay with Cash at 7-Eleven
    Wait Until Page Contains    วิธีการชำระเงิน
    Wait Until Element Is Visible    ${LOCATOR_PAYMENT_OPTION_TAB}    10s
    Click Element    ${LOCATOR_PAYMENT_OPTION_TAB}
    Product Details
    # Click Element    ${LOCATOR_BTN_ORDER}
    # Order Details

Product Details
    Order Summary    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_CHK_PRODUCT_NAME_ITEM_1}
    ...    ${PRODUCT_ITEM_1}
    ...    ${LOCATOR_CHK_PRODUCT_QTY_ITEM_1}
    ...    ${PRODUCT_QTY}
    ...    ${LOCATOR_CHK_PRODUCT_PRICE_ITEM_1}
    ...    ${PRODUCT_PRICE_ITEM_1}
    Order Summary
    ...    ${LOCATOR_CHK_PRODUCT_NAME_ITEM_2}
    ...    ${PRODUCT_ITEM_2}
    ...    ${LOCATOR_CHK_PRODUCT_QTY_ITEM_2}
    ...    ${PRODUCT_QTY}
    ...    ${LOCATOR_CHK_PRODUCT_PRICE_ITEM_2}
    ...    ${PRODUCT_PRICE_ITEM_2}
    Order Summary
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

Order Summary
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

Order Details
    # หน้าบิลหลังกดสั่งซื้อ
    Wait Until Page Contains    ชำระด้วยบาร์โค้ดผ่าน
    # ปุ่มปิด
    Click Element    xpath=////*[@id="csModalContent"]/div[3]/div[3]/span
    # Element Text Should Be    xpath=//*[@id="csModalContent"]/div[3]/div[2]/div[2]/div/div/span[2]    A437365905
    # Element Should Contain    id=csTransDateBar    15/01/2568
    Wait Until Page Contains    การสั่งซื้อสำเร็จ! ขอบคุณที่ไว้วางใจในสินค้าและบริการจากเรา

    # <a class="e-Tax-detail-url" href="/account/order-history/">ประวัติการสั่งซื้อ</a>
    Click Element    xpath=//*[@id="page"]/div[2]/div[2]/div[4]/div[4]/a
    Wait Until Page Contains    ประวัติการสั่งซื้อ
    Page Should Contain    A437365905

    # <a href="/account/order-history/order-details/?orderId=55230878&amp;checkSum=f7ff7ebb8a14641ab36eae4c31c9fb49">รายละเอียดการสั่งซื้อ</a>
    # คลิกที่เลขออเดอร์
    Click Element    xpath=//*[@id="my-orders-accordion"]/div[1]/a/div/div[1]
    Wait Until Page Contains    รายละเอียดการสั่งซื้อ

    # <span class="address ellipsis-full "> ชญานิศา วงศ์ภักดี    เบอร์โทรติดต่อ : 0895678912    <br> 45/89    พระโขนง, คลองตัน คลองเตย กรุงเทพมหานคร 10110<br> </span>
    Element Should Contain
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div[3]/div[1]/div[1]/div/span
    ...    ชญานิศา วงศ์ภักดี เบอร์โทรติดต่อ : 0895678912 45/89 พระโขนง, คลองตัน คลองเตย กรุงเทพมหานคร 10110

Login
    ${u}    Get Env Variable    username
    ${p}    Get Env Variable    password
    Wait Until Element Is Visible    name=email    10s
    Input Text    name=email    ${u}
    Input Password    name=password    ${p}
    Click Element    ${LOCATOR_BTN_LOGIN}
