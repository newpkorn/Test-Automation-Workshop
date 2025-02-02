*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Variables ***
${LOCATOR_SEARCH}                   name=q
${LOCATOR_COOKIE_POPUP}             css=div.alert-cookie-gdpr-allonline
${LOCATOR_COOKIE_GDPR_BUTTON}       css=.alert-cookie-gdpr-allonline__button
${LOCATOR_BTN_ADD_TO_CART}          css=button.btn-addtocart

${PRODUCT_ITEM_1}                   AMARIT คอลลาเจน 30 แคปซูล
${PRODUCT_ITEM_2}                   แอคเน่-เอด ลิควิด 100 มล.
${PRODUCT_ITEM_3}                   มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

${PRODUCT_PRICE_ITEM_1}             ฿ 119
${PRODUCT_PRICE_ITEM_2}             ฿ 225
${PRODUCT_PRICE_ITEM_3}             ฿ 149

${PRODUCT_QTY}                      1

${TOTAL_PRICE}                      ฿ 493
${SHIPPING_FEE}                     ฿ 50
${NET_TOTAL}                        ฿ 543

${ALL_MEMBER_POINTS}                147

${LOCATOR_MINI_BASKET}              id=mini-basket

${LOCATOR_PRODUCT_NAME_ITEM_1}      xpath=//a[contains(text(), '${PRODUCT_ITEM_1}')]
${LOCATOR_PRODUCT_NAME_ITEM_2}      xpath=//a[contains(text(), '${PRODUCT_ITEM_2}')]
${LOCATOR_PRODUCT_NAME_ITEM_3}      xpath=//a[contains(text(), '${PRODUCT_ITEM_3}')]

${LOCATOR_PRODUCT_QTY_ITEM_1}       css=input[value='${PRODUCT_QTY}']
${LOCATOR_PRODUCT_QTY_ITEM_2}       css=input[value='${PRODUCT_QTY}']
${LOCATOR_PRODUCT_QTY_ITEM_3}       css=input[value='${PRODUCT_QTY}']

${LOCATOR_PRODUCT_PRICE_ITEM_1}     xpath=//span[@class='highlight' and contains(text(), '${PRODUCT_PRICE_ITEM_1}')]
${LOCATOR_PRODUCT_PRICE_ITEM_2}     xpath=//span[@class='highlight' and contains(text(), '${PRODUCT_PRICE_ITEM_2}')]
${LOCATOR_PRODUCT_PRICE_ITEM_3}     xpath=//span[@class='highlight' and contains(text(), '${PRODUCT_PRICE_ITEM_3}')]

${LOCATOR_TOTAL_PRICE}              xpath=//span[@class='Ao' and contains(text(), '${TOTAL_PRICE}')]
