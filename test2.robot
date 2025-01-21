*** Settings ***
Resource            keywords.resource

Suite Setup         Open Web Browser
Suite Teardown      Close All Browsers


*** Test Cases ***
Select Products
    [Template]    Search and Select Products
    AMARIT คอลลาเจน 30 แคปซูล    AMARIT คอลลาเจน 30 แคปซูล
    แอคเน่-เอด ลิควิด 100 มล.    แอคเน่-เอด ลิควิด 100 มล.
    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

Review Cart and Proceed to Checkout
    Open Shopping Cart
    Review and Checkout
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_1}    AMARIT คอลลาเจน 30 แคปซูล
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_1}    1
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_1}    ฿ 149

    Review and Checkout
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_2}    แอคเน่-เอด ลิควิด 100 มล.
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_2}    1
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_2}    ฿ 169
    Review and Checkout
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_3}    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_3}    1
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_3}    ฿ 149

    Check Total Price
    ...    xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[9]/div/div[2]/span[1]
    ...    ฿ 467
    Proceed to Payment

Select Delivery Method
    Select Delivery Method by Entering Store Code    18527

Cash Payment at 7-Eleven Completed
    Pay with Cash at 7-Eleven
