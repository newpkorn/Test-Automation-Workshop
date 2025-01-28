*** Comments ***
# Deverlop By: Pakorn Soikham
# Date: 25-01-2025


*** Settings ***
Resource    keywords.resource


*** Variables ***
${URL}                                                          https://www.allonline.7eleven.co.th/
${BROWSER}                                                      chrome
${LOCATOR_COOKIE_POPUP}                                         css=div.alert-cookie-gdpr-allonline
#####################################################################################

# Product Details Variables
${PRODUCT_ITEM_1}                                               AMARIT คอลลาเจน 30 แคปซูล
${PRODUCT_ITEM_2}                                               แอคเน่-เอด ลิควิด 100 มล.
${PRODUCT_ITEM_3}                                               มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

${PRODUCT_PRICE_ITEM_1}                                         ฿ 119
${PRODUCT_PRICE_ITEM_2}                                         ฿ 225
${PRODUCT_PRICE_ITEM_3}                                         ฿ 149

${PRODUCT_QTY}                                                  1

${TOTAL_PRICE}                                                  ฿ 493
${SHIPPING_FEE}                                                 ฿ 50
${NET_TOTAL}                                                    ฿ 543

${ALL_MEMBER_POINTS}                                            147
#####################################################################################

# Element Locators
${LOCATOR_SEARCH}                                               name=q

${LOCATOR_BTN_ADD_TO_CART}                                      css=button.btn-addtocart
${LOCATOR_MINI_BASKET}                                          id=mini-basket

${LOCATOR_STORE_FINDER}                                         css=.storefinder-selector
${LOCATOR_STORE_NUMBER_INPUT}                                   id=user-storenumber-input
${LOCATOR_BTN_CHK_STORE_NUMBER}                                 id=btn-check-storenumber
${LOCATOR_STORE_DETAIL}                                         css=span.address-7_11_store-detail-header
${LOCATOR_ADDRESS_TAB}                                          css=a.tab-address

${LOCATOR_INPUT_LOCATION_FIELD}                                 css=css=#user-storenumber-input
${LOCATOR_BTN_SELECT_LOCATION}                                  id=selected-location
${LOCATOR_BTN_SELECT_ADDR}                                      id=conf-dif-addr
${LOCATOR_BTN_CONTINUE_PAYMENT}                                 id=continue-payment-btn
${LOCATOR_PAYMENT_OPTION_TAB}                                   xpath=//*[@id="payment-options"]/div[3]/button
${LOCATOR_PAYMENT_CASE_INFO}                                    xpath=//*[@id="COUNTERSERVICE_CASH-tab"]/div/div

${LOCATOR_BTN_LOGIN}                                            css=a.btn.btn-small

${LOCATOR_PRODUCT_NAME_ITEM_1}                                  xpath=//a[contains(text(), '${PRODUCT_ITEM_1}')]
${LOCATOR_PRODUCT_NAME_ITEM_2}                                  xpath=//a[contains(text(), '${PRODUCT_ITEM_2}')]
${LOCATOR_PRODUCT_NAME_ITEM_3}                                  xpath=//a[contains(text(), '${PRODUCT_ITEM_3}')]

${LOCATOR_PRODUCT_QTY_ITEM_1}                                   css=input[value='${PRODUCT_QTY}']
${LOCATOR_PRODUCT_QTY_ITEM_2}                                   css=input[value='${PRODUCT_QTY}']
${LOCATOR_PRODUCT_QTY_ITEM_3}                                   css=input[value='${PRODUCT_QTY}']

${LOCATOR_PRODUCT_PRICE_ITEM_1}                                 xpath=//span[@class='highlight' and contains(text(), '${PRODUCT_PRICE_ITEM_1}')]
${LOCATOR_PRODUCT_PRICE_ITEM_2}                                 xpath=//span[@class='highlight' and contains(text(), '${PRODUCT_PRICE_ITEM_2}')]
${LOCATOR_PRODUCT_PRICE_ITEM_3}                                 xpath=//span[@class='highlight' and contains(text(), '${PRODUCT_PRICE_ITEM_3}')]

${LOCATOR_TOTAL_PRICE}                                          xpath=//span[@class='Ao' and contains(text(), '${TOTAL_PRICE}')]

${LOCATOR_BTN_ORDER}                                            css=button.btn-proceed

${LOCATOR_BTN_CLOSE_BILLING_POPUP}                              xpath=//*[@class="csCloseModal"]//i[@class="icon-times-circle"]
${LOCATOR_MODAL_BILLING}                                        xpath=//*[@id="csModalContent"]/div[4]
${LOCATOR_CONTENT_BARCODE}                                      id=contentBarcode
${LOCATOR_GET_ORDER_NUMBER}                                     id=csInvBar
${LOCATOR_GET_ORDER_DATE}                                       id=csTransDateBar

${LOCATOR_ORDER_HISTORY}                                        css=a.e-Tax-detail-url

${LOCATOR_ORDER_NUMBER}                                         css=span.order-number

${LOCATOR_CHK_ORDER_NUMBER}                                     css=div[class*="info-bar-orderNo"] b

${LOCATOR_CHK_ORDER_DATE}                                       css=div.info-bar-orderDate b

${LOCATOR_PAYMENT_TYPE}                                         css=div.payment-type

${LOCATOR_DELIVERY_ADDR}                                        css=span.address.ellipsis-full
#####################################################################################

# Order Summary Locators
${LOCATOR_CHK_PRODUCT_NAME_ITEM_1}                              xpath=//*[@id="stepModel"]//table//tr[3]//td[2]
${LOCATOR_CHK_PRODUCT_NAME_ITEM_2}                              xpath=//*[@id="stepModel"]//table//tr[6]//td[2]
${LOCATOR_CHK_PRODUCT_NAME_ITEM_3}                              xpath=//*[@id="stepModel"]//table//tr[9]//td[2]

${LOCATOR_CHK_PRODUCT_QTY_ITEM_1}                               xpath=//*[@id="stepModel"]//table//tr[3]//td[3]
${LOCATOR_CHK_PRODUCT_QTY_ITEM_2}                               xpath=//*[@id="stepModel"]//table//tr[6]//td[3]
${LOCATOR_CHK_PRODUCT_QTY_ITEM_3}                               xpath=//*[@id="stepModel"]//table//tr[9]//td[3]

${LOCATOR_CHK_PRODUCT_PRICE_ITEM_1}                             xpath=//*[@id="stepModel"]//table//tr[3]//td[4]
${LOCATOR_CHK_PRODUCT_PRICE_ITEM_2}                             xpath=//*[@id="stepModel"]//table//tr[6]//td[4]
${LOCATOR_CHK_PRODUCT_PRICE_ITEM_3}                             xpath=//*[@id="stepModel"]//table//tr[9]//td[4]

${LOCATOR_CHK_TOTAL_PRICE}                                      xpath=(//td[@class='currency']/b)[1]

${LOCATOR_CHK_SHIPPING_FEE}                                     xpath=(//td[@class='currency']/b)[2]
${LOCATOR_CHK_NET_TOTAL}                                        id=totalAmount

${LOCATOR_CHK_ALL_MEMBER_POINTS}                                css=td.currency.allmembers b
#####################################################################################

# Shipping Address Locators
${LOCATOR_NEW_ADDRESS}                                          css=.new-address
${LOCATOR_CUSTOMER_NAME}                                        id=new-address-name
${LOCATOR_CUSTOMER_LASTNAME}                                    id=new-address-lastname
${LOCATOR_CUSTOMER_PHONE_NUMBER}                                id=new-address-mobile
${LOCATOR_CUSTOMER_ADDRESS_NUMBER}                              id=new-address-addrno
${LOCATOR_CUSTOMER_ADDRESS_SOI}                                 id=new-address-soi
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_PROVINCE}                   id=select2-new-address-province-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_PROVINCE_RESULTS}           id=select2-new-address-province-results
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT}                   id=select2-new-address-district-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT_RESULTS}           id=select2-new-address-district-results
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT}               id=select2-new-address-sub-district-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT_RESULTS}       id=select2-new-address-sub-district-results
${LOCATOR_CUSTOMER_ADDRESS_POSTAL_CODE}                         id=new-address-postal-code

${LOCATOR_CUSTOMER_PROVINCE}                                    id=new-address-province
${LOCATOR_CUSTOMER_DISTRICT}                                    id=new-address-district
${LOCATOR_CUSTOMER_SUB_DISTRICT}                                id=new-address-sub-district
#####################################################################################

# Check Product Details
${XPATH_TOTAL_PRICE}                                            xpath=//*[@id="page"]//div[contains(@class, 'entry')]//span[2]
${XPATH_SHIPPING_FEE}                                           xpath=//*[@id="page"]//div[contains(@class, 'entry')]//span[text()='ค่าจัดส่ง']/following-sibling::span[1]
${XPATH_NET_TOTAL}                                              xpath=//div[@class='grand-total']
${XPATH_ALL_MEMBER_POINTS}                                      xpath=//*[@class='entry allmember-point line-height-1']//span[@class='font-normal']
#####################################################################################

# Check Order Details
${XPATH_PRODUCT_ITEM_1}                                         xpath=(//div[@class='desc'])[1]
${XPATH_PRODUCT_QTY_1}                                          xpath=//*[@id="page"]//div[contains(@class, 'qty')]//span[2]
${XPATH_PRODUCT_PRICE_1}                                        xpath=//*[@id="page"]//div[contains(@class, 'item')][1]//div[contains(@class, 'price')]//span[2]

${XPATH_PRODUCT_ITEM_2}                                         xpath=(//div[@class='desc'])[2]
${XPATH_PRODUCT_QTY_2}                                          xpath=//*[@id="page"]//div[contains(@class, 'qty')]//span[2]
${XPATH_PRODUCT_PRICE_2}                                        xpath=//*[@id="page"]//div[contains(@class, 'item')][2]//div[contains(@class, 'price')]//span[2]

${XPATH_PRODUCT_ITEM_3}                                         xpath=(//div[@class='desc'])[3]
${XPATH_PRODUCT_QTY_3}                                          xpath=//*[@id="page"]//div[contains(@class, 'qty')]//span[2]
${XPATH_PRODUCT_PRICE_3}                                        xpath=//*[@id="page"]//div[contains(@class, 'item')][3]//div[contains(@class, 'price')]//span[2]
