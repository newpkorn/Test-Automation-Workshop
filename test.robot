*** Settings ***
Library             SeleniumLibrary

Suite Setup         เปิดเว็บเบราว์เซอร์
Suite Teardown      Close All Browsers
# Test Setup          เข้าเว็บ All Online
Test Template       ค้นหาและเลือกซื้อสินค้า


*** Variables ***
${URL}            https://www.allonline.7eleven.co.th/
${BROWSER}        chrome
${ช่องค้นหา}        name=q
${ปุ่มเพิ่มสินค้า}      xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button


*** Test Cases ***                          คำค้นหา                            ผลการค้นหา
สั่งซื้อสินค้า AMARIT คอลลาเจน 30 แคปซูล           AMARIT คอลลาเจน 30 แคปซูล          AMARIT คอลลาเจน 30 แคปซูล
สั่งซื้อสินค้า แอคเน่-เอด ลิควิด 100 มล.             แอคเน่-เอด ลิควิด 100 มล.            แอคเน่-เอด ลิควิด 100 มล.
สั่งซื้อสินค้า มาลี น้ำส้มแมนดาริน 100% 1,000 มล.     มาลี น้ำส้มแมนดาริน 100% 1,000 มล.    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.


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
    # ตรวจสอบรายการสินค้าในตะกร้า

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
    Click Element    xpath=//div[contains(@class, 'alert-cookie-gdpr-allonline')]//button
