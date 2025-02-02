*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Variables ***
${LOCATOR_PAYMENT_OPTION_TAB}           xpath=//*[@id="payment-options"]/div[3]/button
${LOCATOR_PAYMENT_CASE_INFO}            xpath=//*[@id="COUNTERSERVICE_CASH-tab"]/div/div
${LOCATOR_BTN_ORDER}                    css=button.btn-proceed

${LOCATOR_BTN_CLOSE_BILLING_POPUP}      xpath=//*[@class="csCloseModal"]//i[@class="icon-times-circle"]
${LOCATOR_MODAL_BILLING}                xpath=//*[@id="csModalContent"]/div[4]
${LOCATOR_CONTENT_BARCODE}              id=contentBarcode
${LOCATOR_GET_ORDER_NUMBER}             id=csInvBar
${LOCATOR_GET_ORDER_DATE}               id=csTransDateBar

${LOCATOR_ORDER_HISTORY}                css=a.e-Tax-detail-url

${LOCATOR_ORDER_NUMBER}                 css=span.order-number

${LOCATOR_CHK_ORDER_NUMBER}             css=div[class*="info-bar-orderNo"] b

${LOCATOR_CHK_ORDER_DATE}               css=div.info-bar-orderDate b

${LOCATOR_PAYMENT_TYPE}                 css=div.payment-type

${LOCATOR_DELIVERY_ADDR}                css=span.address.ellipsis-full

# Order Summary Locators
${LOCATOR_CHK_PRODUCT_NAME_ITEM_1}      xpath=//*[@id="stepModel"]//table//tr[3]//td[2]
${LOCATOR_CHK_PRODUCT_NAME_ITEM_2}      xpath=//*[@id="stepModel"]//table//tr[6]//td[2]
${LOCATOR_CHK_PRODUCT_NAME_ITEM_3}      xpath=//*[@id="stepModel"]//table//tr[9]//td[2]

${LOCATOR_CHK_PRODUCT_QTY_ITEM_1}       xpath=//*[@id="stepModel"]//table//tr[3]//td[3]
${LOCATOR_CHK_PRODUCT_QTY_ITEM_2}       xpath=//*[@id="stepModel"]//table//tr[6]//td[3]
${LOCATOR_CHK_PRODUCT_QTY_ITEM_3}       xpath=//*[@id="stepModel"]//table//tr[9]//td[3]

${LOCATOR_CHK_PRODUCT_PRICE_ITEM_1}     xpath=//*[@id="stepModel"]//table//tr[3]//td[4]
${LOCATOR_CHK_PRODUCT_PRICE_ITEM_2}     xpath=//*[@id="stepModel"]//table//tr[6]//td[4]
${LOCATOR_CHK_PRODUCT_PRICE_ITEM_3}     xpath=//*[@id="stepModel"]//table//tr[9]//td[4]

${LOCATOR_CHK_TOTAL_PRICE}              xpath=(//td[@class='currency']/b)[1]

${LOCATOR_CHK_SHIPPING_FEE}             xpath=(//td[@class='currency']/b)[2]
${LOCATOR_CHK_NET_TOTAL}                id=totalAmount

${LOCATOR_CHK_ALL_MEMBER_POINTS}        css=td.currency.allmembers b

# Check Product Details
${XPATH_TOTAL_PRICE}                    xpath=//*[@id="page"]//div[contains(@class, 'entry')]//span[2]
${XPATH_SHIPPING_FEE}                   xpath=//*[@id="page"]//div[contains(@class, 'entry')]//span[text()='ค่าจัดส่ง']/following-sibling::span[1]
${XPATH_NET_TOTAL}                      xpath=//div[@class='grand-total']
${XPATH_ALL_MEMBER_POINTS}              xpath=//*[@class='entry allmember-point line-height-1']//span[@class='font-normal']

# Check Order Details
${XPATH_PRODUCT_ITEM_1}                 xpath=(//div[@class='desc'])[1]
${XPATH_PRODUCT_QTY_1}                  xpath=//*[@id="page"]//div[contains(@class, 'qty')]//span[2]
${XPATH_PRODUCT_PRICE_1}                xpath=//*[@id="page"]//div[contains(@class, 'item')][1]//div[contains(@class, 'price')]//span[2]

${XPATH_PRODUCT_ITEM_2}                 xpath=(//div[@class='desc'])[2]
${XPATH_PRODUCT_QTY_2}                  xpath=//*[@id="page"]//div[contains(@class, 'qty')]//span[2]
${XPATH_PRODUCT_PRICE_2}                xpath=//*[@id="page"]//div[contains(@class, 'item')][2]//div[contains(@class, 'price')]//span[2]

${XPATH_PRODUCT_ITEM_3}                 xpath=(//div[@class='desc'])[3]
${XPATH_PRODUCT_QTY_3}                  xpath=//*[@id="page"]//div[contains(@class, 'qty')]//span[2]
${XPATH_PRODUCT_PRICE_3}                xpath=//*[@id="page"]//div[contains(@class, 'item')][3]//div[contains(@class, 'price')]//span[2]
