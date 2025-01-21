*** Settings ***
Library             SeleniumLibrary

Suite Setup         เปิดเว็บเบราว์เซอร์
Suite Teardown      Close All Browsers
# Test Setup          เข้าเว็บ All Online
# Test Template       ค้นหาและเลือกซื้อสินค้า


*** Variables ***
${URL}            https://www.allonline.7eleven.co.th/
${BROWSER}        chrome
${ช่องค้นหา}        name=q
${ปุ่มเพิ่มสินค้า}      xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button


*** Test Cases ***
เลือกซื้อสินค้า
    [Template]    ค้นหาและเลือกซื้อสินค้า
    AMARIT คอลลาเจน 30 แคปซูล          AMARIT คอลลาเจน 30 แคปซูล
    แอคเน่-เอด ลิควิด 100 มล.            แอคเน่-เอด ลิควิด 100 มล.
    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

ตรวจสอบสินค้าในตะกร้าและดำเนินการชำระเงิน
    ตรวจสอบรายการสินค้าในตะกร้า
    ดำเนินการชำระเงิน

เลือกวิธีจัดส่ง
    ใส่ข้อมูลที่อยู่ในการจัดส่ง

ชำระด้วยเงินสดที่ร้านเซเว่นอีเลฟเว่นสำเร็จ
    ชำระเงินสดที่ร้านเซเว่นอีเลฟเว่น


*** Keywords ***
เปิดเว็บเบราว์เซอร์
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window

เข้าเว็บ All Online
    Go To    url=${URL}

ค้นหาและเลือกซื้อสินค้า
    [Arguments]    ${คำค้น}    ${ผลการค้นหา}
    ค้นหาสินค้า    ${คำค้น}
    กดปุ่ม Enter
    ตรวจสอบผลการค้นหา    ${ผลการค้นหา}
    เลือกสินค้า    ${คำค้น}

ค้นหาสินค้า
    [Arguments]    ${คำค้น}
    Wait Until Element Is Visible    ${ช่องค้นหา}
    Input Text    ${ช่องค้นหา}    ${คำค้น}

กดปุ่ม Enter
    Press Keys    None    RETURN

ตรวจสอบผลการค้นหา
    [Arguments]    ${expected_keyword}
    Wait Until Page Contains    ${expected_keyword}    10s

เลือกสินค้า
    [Arguments]    ${สินค้า}
    Click Element
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[1]/div/img
    Wait Until Page Contains    ${สินค้า}
    Click Button    ${ปุ่มเพิ่มสินค้า}

ตรวจสอบรายการสินค้าในตะกร้า
    Double Click Element    id=mini-basket
    Wait Until Page Contains    ตะกร้าของฉัน    10s
    ตรวจสอบรายละเอียดสินค้า
    ...    AMARIT คอลลาเจน 30 แคปซูล
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[2]/a
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[5]/div/div/input
    ...    1
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[4]/span[2]
    ...    ฿ 149
    ตรวจสอบรายละเอียดสินค้า
    ...    แอคเน่-เอด ลิควิด 100 มล.
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[2]/a 
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[5]/div/div/input
    ...    1
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[4]/span[2]
    ...    ฿ 169
    ตรวจสอบรายละเอียดสินค้า
    ...    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[2]/a
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[5]/div/div/input
    ...    1
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[4]/span[2]
    ...    ฿ 149
    ตรวจสอบราคารวม
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[9]/div/div[2]/span[1]
    ...    ฿ 467

ตรวจสอบรายละเอียดสินค้า
    [Arguments]
    ...    ${ชื่อสินค้า}
    ...    ${xpath_ชื่อ}
    ...    ${xpath_จำนวน}
    ...    ${จำนวนที่คาดหวัง}
    ...    ${xpath_ราคา}
    ...    ${ราคาที่คาดหวัง}
    Element Should Contain    ${xpath_ชื่อ}    ${ชื่อสินค้า}
    Element Attribute Value Should Be    ${xpath_จำนวน}    value    ${จำนวนที่คาดหวัง}
    Element Text Should Be    ${xpath_ราคา}    ${ราคาที่คาดหวัง}

ตรวจสอบราคารวม
    [Arguments]    ${xpath_ราคารวม}    ${ราคารวมที่คาดหวัง}
    Element Text Should Be    ${xpath_ราคารวม}    ${ราคารวมที่คาดหวัง}

ดำเนินการชำระเงิน
    Execute JavaScript    document.querySelector("a.btn-proceed").click();

    ################## temp logic ##################
    Wait Until Page Contains    สามารถเข้าใช้งานด้วยบัญชีเดียวกับ 7 App    10s 
    Login
    ################## end temp ##################

    Wait Until Page Contains    รายละเอียดการจัดส่งสินค้า
    Click Element    xpath=//*[@id="address-tabs"]/ul/li[2]/a

ใส่ข้อมูลที่อยู่ในการจัดส่ง
    Wait Until Element Is Visible    id=new-address-name
    Input Text    id=new-address-name    ชญานิศา
    Input Text    id=new-address-lastname    วงศ์ภักดี
    Input Text    id=new-address-mobile    0895678912
    Input Text    id=new-address-addrno    45/89
    Input Text    id=new-address-soi    พระโขนง
    Select From List By Label    id=select2-new-address-province-container    กรุงเทพมหานคร
    Select From List By Label    id=select2-new-address-district-container    คลองเตย
    Select From List By Label    id=select2-new-address-sub-district-container   คลองเตย
    Wait Until Element Is Visible    id=selected-location
    Click Element    id=selected-location
    Wait Until Element Is Visible    id=conf-dif-addr
    Click Element    id=conf-dif-addr
    ${ZIPCODE}=    Get Text    id=new-address-postal-code
    Should Be Equal As Strings    ${ZIPCODE}    10110
    Click Element    id=continue-payment-btn

ชำระเงินสดที่ร้านเซเว่นอีเลฟเว่น
    Wait Until Page Contains    วิธีการชำระเงิน
    Click Element    id=COUNTERSERVICE_CASH
    รายละเอียดสินค้า
    รายละเอียดการสั่งซื้อ

รายละเอียดสินค้า
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]    AMARIT คอลลาเจน 30 แคปซูล
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]    1
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[4]    ฿ 149

    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[2]    แอคเน่-เอด ลิควิด 100 มล.
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[3]    1
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[4]    ฿ 169

    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[2]    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[3]    1
    Element Text Should Be    xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[4]    ฿ 149

    Element Text Should Be    xpath=//*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b   ฿ 467
    Element Text Should Be    xpath=//*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    ฿ 50
    Element Text Should Be    id=totalAmount    ฿ 517

    Element Text Should Be    xpath=//*[@id="js-invoice-details-tbody"]/tr[17]/td[2]/b    ฿ 138

    # Click Button    xpath=//*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button

รายละเอียดการสั่งซื้อ
    Wait Until Page Contains    ชำระด้วยบาร์โค้ดผ่าน
    Element Text Should Be    xpath=//*[@id="csModalContent"]/div[3]/div[2]/div[2]/div/div/span[2]    A437365905
    Element Should Contain    id=csTransDateBar    15/01/2568
    Wait Until Page Contains    การสั่งซื้อสำเร็จ! ขอบคุณที่ไว้วางใจในสินค้าและบริการจากเรา

    # <a class="e-Tax-detail-url" href="/account/order-history/">ประวัติการสั่งซื้อ</a>
    Click Element    xpath=//*[@id="page"]/div[2]/div[2]/div[4]/div[4]/a
    Wait Until Page Contains    ประวัติการสั่งซื้อ

    # <a href="/account/order-history/order-details/?orderId=55230878&amp;checkSum=f7ff7ebb8a14641ab36eae4c31c9fb49">รายละเอียดการสั่งซื้อ</a>
    Click Element    xpath=//*[@id="my-orders-accordion"]/div[1]/a/div/div[2]/a
    Wait Until Page Contains    รายละเอียดการสั่งซื้อ

    # <span class="address ellipsis-full "> ชญานิศา วงศ์ภักดี    เบอร์โทรติดต่อ : 0895678912   <br> 45/89  พระโขนง, คลองตัน คลองเตย กรุงเทพมหานคร 10110<br> </span>
    Element Should Contain    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div[3]/div[1]/div[1]/div/span    ชญานิศา วงศ์ภักดี เบอร์โทรติดต่อ : 0895678912 45/89 พระโขนง, คลองตัน คลองเตย กรุงเทพมหานคร 10110



################## by pass ################
Login
    Wait Until Element Is Visible    name=email    10s
    Input Text    name=email    vrnew@hotmail.com
    Input Password    name=password    New@190388S
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]