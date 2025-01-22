*** Settings ***
Library     SeleniumLibrary
Library     env_keywords.py
Library     String


*** Variables ***
${URL}                                                  https://www.allonline.7eleven.co.th/
${BROWSER}                                              chrome
${LOCATOR_SEARCH}                                       name=q
${LOCATOR_PRODUCT_ITEM}                                 xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[1]/div/img
${LOCATOR_BTN_ADD_TO_CART}                              xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
${LOCATOR_PHONE_NUMBER_INPUT}                           id=second-phone-shipping
${LOCATOR_STORE_FINDER}                                 xpath=//*[@id="storefinder-selector-group"]/div[2]/div
${LOCATOR_STORE_NUMBER_INPUT}                           id=user-storenumber-input
${LOCATOR_BTN_CHK_STORE_NUMBER}                         id=btn-check-storenumber
${LOCATOR_STORE_DETAIL}                                 xpath=//*[@id="store"]/div[2]/div/div[4]/div[3]/div/div/div[2]/span/span
${LOCATOR_INPUT_LOCATION_FIELD}                         xpath=/html/body/span/span/span[1]/input
${LOCATOR_BTN_CONTINUE_PAYMENT}                         id=continue-payment-btn
${LOCATOR_PAYMENT_OPTION_TAB}                           xpath=//*[@id="payment-options"]/div[3]/button

${LOCATOR_PRODUCT_NAME_ITEM_1}                          xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[2]/a
${LOCATOR_PRODUCT_NAME_ITEM_2}                          xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[2]/a
${LOCATOR_PRODUCT_NAME_ITEM_3}                          xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[2]/a

${LOCATOR_PRODUCT_QTY_ITEM_1}                           xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[5]/div/div/input
${LOCATOR_PRODUCT_QTY_ITEM_2}                           xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[5]/div/div/input
${LOCATOR_PRODUCT_QTY_ITEM_3}                           xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[5]/div/div/input

${LOCATOR_PRODUCT_PRICE_ITEM_1}                         xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[4]/span[2]
${LOCATOR_PRODUCT_PRICE_ITEM_2}                         xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[4]/span[2]
${LOCATOR_PRODUCT_PRICE_ITEM_3}                         xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[4]/span[2]

${LOCATOR_TOTAL_PRICE}                                  xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[9]/div/div[2]/span[1]

# Shipping Address Locators
${LOCATOR_NEW_ADDRESS}                                  xpath=//*[@id="address"]/div[1]/div[2]
${LOCATOR_CUSTOMER_NAME}                                id=new-address-name
${LOCATOR_CUSTOMER_LASTNAME}                            id=new-address-lastname
${LOCATOR_CUSTOMER_PHONE_NUMBER}                        id=new-address-mobile
${LOCATOR_CUSTOMER_ADDRESS_NUMBER}                      id=new-address-addrno
${LOCATOR_CUSTOMER_ADDRESS_SOI}                         id=new-address-soi
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_PROVINCE}           id=select2-new-address-province-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT}           id=select2-new-address-district-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT}       id=select2-new-address-sub-district-container
${LOCATOR_CUSTOMER_ADDRESS_POSTAL_CODE}                 id=new-address-postal-code

${LOCATOR_CUSTOMER_PROVINCE}                            id=new-address-province
${LOCATOR_CUSTOMER_DISTRICT}                            id=new-address-district
${LOCATOR_CUSTOMER_SUB_DISTRICT}                        id=new-address-sub-district


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
    Double Click Element    id=mini-basket
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

    ################## temp logic ##################
    Wait Until Page Contains    สามารถเข้าใช้งานด้วยบัญชีเดียวกับ 7 App    10s
    Login
    ################## end temp ##################

    Wait Until Page Contains    รายละเอียดการจัดส่งสินค้า
    Wait Until Element Is Visible    ${LOCATOR_PHONE_NUMBER_INPUT}
    Input Text    ${LOCATOR_PHONE_NUMBER_INPUT}    0895678912

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

# Shipping Address
#    [Arguments]
#    # Locator Text Fields    -->    Data Test
#    ...    ${locator_fname}    ${customer_fname}
#    ...    ${locator_lname}    ${customer_lname}
#    ...    ${locator_phone}    ${customer_phone}
#    ...    ${locator_address_no}    ${customer_address_no}
#    ...    ${locator_address_soi}    ${customer_address_soi}
#    ...    ${locator_province}    ${customer_province}
#    ...    ${locator_district}    ${customer_district}
#    ...    ${locator_sub_district}    ${customer_sub_district}
#    ...    ${customer_postal_code}

#    Enter Shipping Address
#    # Locator Text Fields    -->    Data Test
#    ...    ${locator_fname}    ${customer_fname}
#    ...    ${locator_lname}    ${customer_lname}
#    ...    ${locator_phone}    ${customer_phone}
#    ...    ${locator_address_no}    ${customer_address_no}
#    ...    ${locator_address_soi}    ${customer_address_soi}
#    ...    ${locator_province}    ${customer_province}
#    ...    ${locator_district}    ${customer_district}
#    ...    ${locator_sub_district}    ${customer_sub_district}
#    ...    ${customer_postal_code}

# Enter Shipping Address
#    [Arguments]
#    # Locator Text Fields    -->    Data Test
#    ...    ${locator_fname}    ${customer_fname}
#    ...    ${locator_lname}    ${customer_lname}
#    ...    ${locator_phone}    ${customer_phone}
#    ...    ${locator_address_no}    ${customer_address_no}
#    ...    ${locator_address_soi}    ${customer_address_soi}
#    ...    ${locator_province}    ${customer_province}
#    ...    ${locator_district}    ${customer_district}
#    ...    ${locator_sub_district}    ${customer_sub_district}
#    ...    ${customer_postal_code}

#    Input Text    ${locator_fname}    ${customer_fname}
#    Input Text    ${locator_lname}    ${customer_lname}
#    Input Text    ${locator_phone}    ${customer_phone}
#    Input Text    ${locator_address_no}    ${customer_address_no}
#    Input Text    ${locator_address_soi}    ${customer_address_soi}

#    Select From List By Label    ${locator_province}    ${customer_province}
#    Select From List By Label    ${locator_district}    ${customer_district}
#    Select From List By Label    ${locator_sub_district}    ${customer_sub_district}

#    # Check postal code
#    ${postal_code}    Get Text    ${LOCATOR_CUSTOMER_ADDRESS_POSTAL_CODE}
#    Should Be Equal As Strings    ${postal_code}    ${customer_postal_code}

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

    # กดจัดส่งตามที่อยู่
    Click Element    xpath=//*[@id="address-tabs"]/ul/li[2]/a
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
    Scroll Element Into View    id=selected-location
    Wait Until Element Is Visible    id=selected-location    timeout=10s
    Click Element    id=selected-location

    # wait id='conf-dif-addr' visible
    Wait Until Element Is Visible    id=conf-dif-addr    timeout=10s
    Wait Until Element Is Enabled    id=conf-dif-addr    timeout=10s
    Click Element    id=conf-dif-addr

    # wait button continue payment visible and enabled
    Wait Until Element Is Visible    ${LOCATOR_BTN_CONTINUE_PAYMENT}    timeout=10s
    Wait Until Element Is Enabled    ${LOCATOR_BTN_CONTINUE_PAYMENT}    timeout=10s

    # click continue payment
    # Click Element    ${LOCATOR_BTN_CONTINUE_PAYMENT}
    Execute JavaScript    document.getElementById("continue-payment-btn").click()

Pay with Cash at 7-Eleven
    Wait Until Page Contains    วิธีการชำระเงิน
    Wait Until Element Is Visible    ${LOCATOR_PAYMENT_OPTION_TAB}    10s
    Click Element    ${LOCATOR_PAYMENT_OPTION_TAB}
    Product Details
    # รายละเอียดการจัดส่ง
    Sleep    20s
    # Order Details

Product Details
    Order Summary
    ...    AMARIT คอลลาเจน 30 แคปซูล
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]
    ...    1
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[4]
    ...    ฿ 149
    Order Summary
    ...    แอคเน่-เอด ลิควิด 100 มล.
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[2]
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[3]
    ...    1
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[4]
    ...    ฿ 169
    Order Summary
    ...    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[2]
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[3]
    ...    1
    ...    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[4]
    ...    ฿ 149
    Total Price
    ...    xpath=//*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b
    ...    ฿ 467
    Shipping Fee
    ...    xpath=//*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b
    ...    ฿ 50
    Net Total
    ...    id=totalAmount
    ...    ฿ 517
    Earn All Member Points
    ...    xpath=//*[@id="js-invoice-details-tbody"]/tr[17]/td[2]/b
    ...    138

Order Summary
    [Arguments]
    ...    ${Product_Name}
    ...    ${xpath_Name}
    ...    ${xpath_Quantity}
    ...    ${Quantity_Expected}
    ...    ${xpath_Price}
    ...    ${Price_Expected}
    Element Text Should Be    ${xpath_Name}    ${Product_Name}
    Element Text Should Be    ${xpath_Quantity}    ${Quantity_Expected}
    Element Text Should Be    ${xpath_Price}    ${Price_Expected}

Total Price
    [Arguments]    ${xpath_TotalPrice}    ${Expected_TotalPrice}
    Element Text Should Be    ${xpath_TotalPrice}    ${Expected_TotalPrice}

Shipping Fee
    [Arguments]    ${xpath_TotalPrice}    ${Expected_TotalPrice}
    Element Text Should Be    ${xpath_TotalPrice}    ${Expected_TotalPrice}

Net Total
    [Arguments]    ${xpath_TotalPrice}    ${Expected_TotalPrice}
    Element Text Should Be    ${xpath_TotalPrice}    ${Expected_TotalPrice}

Earn All Member Points
    [Arguments]    ${xpath_TotalPrice}    ${Expected_TotalPrice}
    Element Text Should Be    ${xpath_TotalPrice}    ${Expected_TotalPrice}

# รายละเอียดการจัดส่ง
    # Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/div    ภากร สร้อยคำ

    # แก้ตรงนี้
    # address
    # Element Should Contain    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[1]/td    เบอร์โทรศัพท์ผู้รับสินค้า: 0895678912 เซเว่นอีเลฟเว่น #18527 สาขา PTTOR พระราม 4-พระโขนง เลขที่ ถ.พระรามที่4, 3767/1, แขวงพระโขนง เขตคลองเตย กรุงเทพฯ 10110
    # ${actual_text}    Get Text    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[1]/td

    # # ลบการขึ้นบรรทัดใหม่และช่องว่างส่วนเกิน
    # ${actual_text}    Replace String    ${actual_text}    \n    "    # ลบการขึ้นบรรทัดใหม่
    # ${actual_text}    Replace String    ${actual_text}    "    "    # ลบช่องว่างส่วนเกิน

    # # ตรวจสอบว่า actual_text มีข้อความที่คาดหวัง
    # Should Contain    ${actual_text}    เบอร์โทรศัพท์ผู้รับสินค้า: 0895678912 เซเว่นอีเลฟเว่น #18527 สาขา PTTOR พระราม 4-พระโขนง เลขที่ ถ.พระรามที่4, 3767/1, แขวงพระโขนง เขตคลองเตย กรุงเทพฯ 10110

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
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
