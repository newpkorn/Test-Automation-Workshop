*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ./homepage_variables.resource
Resource    ../resources/authen/login_keywords.resource


*** Keywords ***
Search and Select Products
    [Arguments]    ${product_name}

    Search Product    ${product_name}
    Press Enter
    Review Search Results    ${product_name}
    Select Product    ${product_name}

Search Product
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    ${LOCATOR_SEARCH}
    Input Text    ${LOCATOR_SEARCH}    ${product_name}

Press Enter
    Press Keys    None    RETURN

Review Search Results
    [Arguments]    ${product_name}
    Wait Until Page Contains    ${product_name}    10s

Select Product
    [Arguments]    ${product_name}
    ${DYNAMIC_LOCATOR} =    Set Variable    css=a[title*='${product_name}']

    Scroll Element Into View    ${DYNAMIC_LOCATOR}
    Sleep    1s
    Click Element    ${DYNAMIC_LOCATOR}

    # check if the product is selected.
    Wait Until Page Contains    ${product_name}    timeout=5s
    Click Button    ${LOCATOR_BTN_ADD_TO_CART}

Close Cookie Braner
    Wait Until Element Is Visible    ${LOCATOR_COOKIE_POPUP}    timeout=10s
    Click Element    ${LOCATOR_COOKIE_POPUP}

    Wait Until Element Is Visible    ${LOCATOR_COOKIE_GDPR_BUTTON}    timeout=10s
    Click Element    ${LOCATOR_COOKIE_GDPR_BUTTON}

Open Shopping Cart
    Double Click Element    ${LOCATOR_MINI_BASKET}
    Wait Until Page Contains    ตะกร้าของฉัน    10s

Check All Product Details
    @{products} =    Create List
    ...    ${PRODUCT_ITEM_1}
    ...    ${PRODUCT_ITEM_2}
    ...    ${PRODUCT_ITEM_3}
    @{locators} =    Create List
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_1}
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_2}
    ...    ${LOCATOR_PRODUCT_NAME_ITEM_3}
    @{qty_locators} =    Create List
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_1}
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_2}
    ...    ${LOCATOR_PRODUCT_QTY_ITEM_3}
    @{price_locators} =    Create List
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_1}
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_2}
    ...    ${LOCATOR_PRODUCT_PRICE_ITEM_3}
    @{expected_prices} =    Create List
    ...    ${PRODUCT_PRICE_ITEM_1}
    ...    ${PRODUCT_PRICE_ITEM_2}
    ...    ${PRODUCT_PRICE_ITEM_3}

    FOR    ${index}    IN RANGE    3
        ${product_name} =    Set Variable    ${products}[${index}]
        ${product_locator} =    Set Variable    ${locators}[${index}]
        ${qty_locator} =    Set Variable    ${qty_locators}[${index}]
        ${price_locator} =    Set Variable    ${price_locators}[${index}]
        ${expected_price} =    Set Variable    ${expected_prices}[${index}]

        Check Product Details
        ...    ${product_locator}
        ...    ${qty_locator}
        ...    ${price_locator}
        ...    ${product_name}
        ...    ${expected_price}
    END

    Check Total Price    ${TOTAL_PRICE}

Check Product Details
    [Arguments]
    ...    ${Product_Locator}
    ...    ${Quantity_Locator}
    ...    ${Price_Locator}
    ...    ${EXPECTED_PRODUCT_NAME}
    ...    ${EXPECTED_PRODUCT_PRICE}

    ${product_text} =    Get Text    ${Product_Locator}
    ${product_text} =    Strip String    ${product_text}
    Should Be Equal As Strings    ${product_text}    ${EXPECTED_PRODUCT_NAME}

    ${quantity_text} =    Get Element Attribute    ${Quantity_Locator}    value
    ${quantity_text} =    Strip String    ${quantity_text}
    Should Be Equal As Strings    ${quantity_text}    ${PRODUCT_QTY}

    ${price_text} =    Get Text    ${Price_Locator}
    ${price_text} =    Replace String    ${price_text}    '฿'    ''    # ลบสัญลักษณ์ '฿'
    ${price_text} =    Replace String    ${price_text}    ' '    ''    # ลบช่องว่างทั้งหมด
    Should Be Equal As Strings    ${price_text}    ${EXPECTED_PRODUCT_PRICE}

# Check Summary Details
#    Element Text Should Be    ${LOCATOR_TOTAL_PRICE}    ${TOTAL_PRICE}
#    Element Text Should Be    ${LOCATOR_SHIPPING_FEE}    ${SHIPPING_FEE}
#    Element Text Should Be    ${LOCATOR_NET_TOTAL}    ${NET_TOTAL}
#    Element Text Should Be    ${LOCATOR_ALL_MEMBER_POINTS}    ${ALL_MEMBER_POINTS}

Check Total Price
    [Arguments]    ${Expected_TotalPrice}
    Element Text Should Be    ${LOCATOR_TOTAL_PRICE}    ${Expected_TotalPrice}
