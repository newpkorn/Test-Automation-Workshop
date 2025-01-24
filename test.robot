*** Settings ***
Library     SeleniumLibrary
Resource    variables.resource
Library     env_keywords.py
Library     String
Library     Collections


*** Test Cases ***
Test-Order Completed
    Open Web Browser
    Login
    Order Details


*** Keywords ***
Open Web Browser
    Open Browser
    ...    https://login-customer.cpall-allmember.net/login?F96A9A46A1CA731A235221E3BA8A83BDBD1E78FE6E186992F9364F9EB917D6CB41FBAB885E92815BA8A07D3BCBFC6CEA20400F0086E771174FB9BB5F9051E7FFB85FE3B59C5F493F3F54FE0FF9A44F33CD79628092F91179E3997C053CA421293C24556D6D021D12163A23C61AF0A666FF203AEAE39366E879A2082D197A9BE0484B7E488EF72C233F79398D79F22000396BCD42DAD0D4D8274E7F666B8DA3AB2A7743784F22607AB5D9ED1C48C229F72A803C33C23CE0B94FA26BBF4C4598C8DD299EB5269961C442A4EDF5246052DB8825F4279F0AEA95BC2F0360F2A379AD7AA249B1216D31C0BC008F871E29EC2DED614B75197A8FBEB1EC381B99A6360668A35D796EDB1B1D609D8C33A9C9E9666801048DE9AA8E987EFF152B53F3691B825D49D0D9373794482BF144B574690EA67A44590A1B66E85081883505074F5C0C8E39FC5D018CAF736A63A78E532E3FB17048A7CBA5091C48497217986C0B1C116DA5B9B75E37778E5220DEB846F9FE776F9AC073844AC174E62F15CD6E040221471B00F1867C057E27ADD51242D484EF13C39CCC80CD65037B12BF404B963508515AD4C923F62B9A16BDDB84419B90
    ...    ${BROWSER}
    # Maximize Browser Window

Login
    ${u} =    Get Env Variable    username
    ${p} =    Get Env Variable    password
    Wait Until Element Is Visible    name=email    10s
    Input Text    name=email    ${u}
    Input Password    name=password    ${p}
    Click Element    ${LOCATOR_BTN_LOGIN}

Order Details
    Sleep    5s
    Go To
    ...    https://www.allonline.7eleven.co.th/account/order-history/order-details/?orderId=55301380&checkSum=a8ee1b9dcd5765f8a3ef77b95b4a736b
    Wait Until Page Contains    รายละเอียดการสั่งซื้อ    20s

    ${get_order_number} =    Get Text    ${LOCATOR_CHK_ORDER_NUMBER}

    # Should Contain
    # ...    ${get_order_number}
    # ...    หมายเลขสั่งซื้อ #${order_number_test}

    # check order date
    ${order_date_list} =    Split String    ${order_date_test}    ${SPACE}
    ${order_date_only} =    Get From List    ${order_date_list}    0
    ${day}    ${month}    ${year} =    Split String    ${order_date_only}    /
    ${year_th} =    Evaluate    ${year} + 543
    ${order_date_th} =    Set Variable    ${day}/${month}/${year_th}
    Element Text Should Be
    ...    ${LOCATOR_CHK_ORDER_DATE}
    ...    วันที่สั่งซื้อ ${order_date_th}

    # check payment method
    Element Text Should Be
    ...    ${LOCATOR_PAYMENT_TYPE}
    ...    ชำระเงินสด ที่ร้านเซเว่นอีเลฟเว่น (7-11)

    # check delivery address
    Wait Until Element Is Visible    ${LOCATOR_DELIVERY_ADDR}

    # ดึงข้อมูลที่อยู่
    ${address_text} =    Get Text    ${LOCATOR_DELIVERY_ADDR}

    # remove \n and space
    ${cleaned_address_text} =    String.Replace String    ${address_text}    \n    ${SPACE}

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

    # Order Details
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
