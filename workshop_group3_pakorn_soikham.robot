*** Settings ***
Resource            keywords.resource

Suite Setup         Open Web Browser
Suite Teardown      Close All Browsers


*** Test Cases ***
Select Products
    [Template]    Search and Select Products
    # Product Name    -->    Expected Product Name
    AMARIT คอลลาเจน 30 แคปซูล    AMARIT คอลลาเจน 30 แคปซูล
    แอคเน่-เอด ลิควิด 100 มล.    แอคเน่-เอด ลิควิด 100 มล.
    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

Review Cart and Proceed to Checkout
    Open Shopping Cart
    Review and Checkout    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_1}    AMARIT คอลลาเจน 30 แคปซูล
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_1}    1
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_1}    ฿ 149

    Review and Checkout    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_2}    แอคเน่-เอด ลิควิด 100 มล.
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_2}    1
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_2}    ฿ 169
    Review and Checkout    # Locator    -->    Expected Product (Name, Quantity, Price)
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_3}    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_3}    1
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_3}    ฿ 149

    Check Total Price    # Locator    -->    Expected Total Price
    ...    ${LOCATOR_TOTAL_PRICE}    ฿ 467

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
