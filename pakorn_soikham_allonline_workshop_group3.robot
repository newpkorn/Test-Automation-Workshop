*** Comments ***
Deverlop By: Pakorn Soikham
Date: 2021-09-26


*** Settings ***
Resource            keywords.resource

Suite Setup         Open Web Browser
Suite Teardown      Close All Browsers


*** Test Cases ***
Select Products
    [Template]    Search and Select Products
    # Product Name    -->    Expected Product Name
    ${PRODUCT_ITEM_1}    AMARIT คอลลาเจน 30 แคปซูล
    ${PRODUCT_ITEM_2}    แอคเน่-เอด ลิควิด 100 มล.
    ${PRODUCT_ITEM_3}    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

Review Cart and Proceed to Checkout
    Open Shopping Cart
    Review and Checkout    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_1}    ${PRODUCT_ITEM_1}
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_1}    ${PRODUCT_QTY}
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_1}    ${PRODUCT_PRICE_ITEM_1}

    Review and Checkout    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_2}    ${PRODUCT_ITEM_2}
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_2}    ${PRODUCT_QTY}
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_2}    ${PRODUCT_PRICE_ITEM_2}
    Review and Checkout    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_3}    ${PRODUCT_ITEM_3}
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_3}    ${PRODUCT_QTY}
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_3}    ${PRODUCT_PRICE_ITEM_3}

    Check Total Price    # Locator    -->    Expected Total Price
    ...    ${LOCATOR_TOTAL_PRICE}    ${TOTAL_PRICE}

    Proceed to Payment

Select Delivery Method
    # Store Code    -->    ที่ร้านเซเว่นอีเลฟเว่น #18527 สาขา PTTOR พระราม 4-พระโขนงเลขที่ ถ.พระรามที่4, 3767/1, แขวงพระโขนง เขตคลองเตย กรุงเทพฯ 10110
    Enter Store Code
    ...    18527

    Fill Shipping Address
    ...    ชญานิศา
    ...    วงศ์ภักดี
    ...    0895678912
    ...    45/89
    ...    พระโขนง
    ...    กรุงเทพมหานคร
    ...    คลองเตย
    ...    คลองเตย
    ...    10110

Cash Payment at 7-Eleven Completed
    Pay with Cash at 7-Eleven
