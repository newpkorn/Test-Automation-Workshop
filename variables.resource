*** Variables ***
${URL}                                                  https://www.allonline.7eleven.co.th/
${BROWSER}                                              chrome
#####################################################################################

# Product Details Variables
${PRODUCT_ITEM_1}                                       AMARIT คอลลาเจน 30 แคปซูล
${PRODUCT_ITEM_2}                                       แอคเน่-เอด ลิควิด 100 มล.
${PRODUCT_ITEM_3}                                       มาลี น้ำส้มแมนดาริน 100% 1,000 มล.

${PRODUCT_PRICE_ITEM_1}                                 ฿ 149
${PRODUCT_PRICE_ITEM_2}                                 ฿ 169
${PRODUCT_PRICE_ITEM_3}                                 ฿ 149

${PRODUCT_QTY}                                          1

${TOTAL_PRICE}                                          ฿ 467
${SHIPPING_FEE}                                         ฿ 50
${NET_TOTAL}                                            ฿ 517

${ALL_MEMBER_POINTS}                                    138
#####################################################################################

# Element Locators
${LOCATOR_SEARCH}                                       name=q
${LOCATOR_PRODUCT_ITEM}                                 xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]/div/a[1]/div/img
${LOCATOR_BTN_ADD_TO_CART}                              xpath=//*[@id="article-form"]/div[2]/div[2]/div[4]/div[1]/button
${LOCATOR_MINI_BASKET}                                  id=mini-basket
${LOCATOR_STORE_FINDER}                                 xpath=//*[@id="storefinder-selector-group"]/div[2]/div
${LOCATOR_STORE_NUMBER_INPUT}                           id=user-storenumber-input
${LOCATOR_BTN_CHK_STORE_NUMBER}                         id=btn-check-storenumber
${LOCATOR_STORE_DETAIL}                                 xpath=//*[@id="store"]/div[2]/div/div[4]/div[3]/div/div/div[2]/span/span
${LOCATOR_ADDRESS_TAB}                                  xpath=//*[@id="address-tabs"]/ul/li[2]/a
${LOCATOR_INPUT_LOCATION_FIELD}                         xpath=/html/body/span/span/span[1]/input
${LOCATOR_BTN_SELECT_LOCATION}                          id=selected-location
${LOCATOR_BTN_SELECT_ADDR}                              id=conf-dif-addr
${LOCATOR_BTN_CONTINUE_PAYMENT}                         id=continue-payment-btn
${LOCATOR_PAYMENT_OPTION_TAB}                           xpath=//*[@id="payment-options"]/div[3]/button
${LOCATOR_BTN_LOGIN}                                    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]

${LOCATOR_PRODUCT_NAME_ITEM_1}                          xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[2]/a
${LOCATOR_PRODUCT_NAME_ITEM_2}                          xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[2]/a
${LOCATOR_PRODUCT_NAME_ITEM_3}                          xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[2]/a

${LOCATOR_PRODUCT_QTY_ITEM_1}                           xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[5]/div/div/input
${LOCATOR_PRODUCT_QTY_ITEM_2}                           xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[5]/div/div/input
${LOCATOR_PRODUCT_QTY_ITEM_3}                           xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[5]/div/div/input

${LOCATOR_PRODUCT_PRICE_ITEM_1}                         xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[1]/div[4]/span[2]
${LOCATOR_PRODUCT_PRICE_ITEM_2}                         xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[1]/div[4]/span[2]
${LOCATOR_PRODUCT_PRICE_ITEM_3}                         xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[1]/div[4]/span[2]

${LOCATOR_TOTAL_PRICE}                                  xpath=//*[@id="page"]/div[2]/div[2]/div[2]/div/div[3]/div[7]/div[7]/div[9]/div/div[2]/span[1]
#####################################################################################

# Locator Order Summary
${LOCATOR_CHK_PRODUCT_NAME_ITEM_1}                      xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[2]
${LOCATOR_CHK_PRODUCT_NAME_ITEM_2}                      xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[2]
${LOCATOR_CHK_PRODUCT_NAME_ITEM_3}                      xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[2]

${LOCATOR_CHK_PRODUCT_QTY_ITEM_1}                       xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[3]
${LOCATOR_CHK_PRODUCT_QTY_ITEM_2}                       xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[3]
${LOCATOR_CHK_PRODUCT_QTY_ITEM_3}                       xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[3]

${LOCATOR_CHK_PRODUCT_PRICE_ITEM_1}                     xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[3]/td[4]
${LOCATOR_CHK_PRODUCT_PRICE_ITEM_2}                     xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[6]/td[4]
${LOCATOR_CHK_PRODUCT_PRICE_ITEM_3}                     xpath=//*[@id="stepModel"]/div[1]/div[2]/div[2]/table/tbody[1]/tr[9]/td[4]

${LOCATOR_CHK_TOTAL_PRICE}                              xpath=//*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b
${LOCATOR_CHK_SHIPPING_FEE}                             xpath=//*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b
${LOCATOR_CHK_NET_TOTAL}                                id=totalAmount
${LOCATOR_CHK_ALL_MEMBER_POINTS}                        xpath=//*[@id="js-invoice-details-tbody"]/tr[17]/td[2]/b
#####################################################################################

# Shipping Address Locators
${LOCATOR_NEW_ADDRESS}                                  xpath=//*[@id="address"]/div[1]/div[2]
${LOCATOR_CUSTOMER_NAME}                                id=new-address-name
${LOCATOR_CUSTOMER_LASTNAME}                            id=new-address-lastname
${LOCATOR_CUSTOMER_PHONE_NUMBER}                        id=new-address-mobile
${LOCATOR_CUSTOMER_ADDRESS_NUMBER}                      id=new-address-addrno
${LOCATOR_CUSTOMER_ADDRESS_SOI}                         id=new-address-soi
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_PROVINCE}           id=select2-new-address-province-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_DISTRICT}           id=select2-new-address-district-container
${LOCATOR_DROPDOWN_CUSTOMER_ADDRESS_SUB_DISTRICT}       id=select2-new-address-sub-district-container
${LOCATOR_CUSTOMER_ADDRESS_POSTAL_CODE}                 id=new-address-postal-code

${LOCATOR_CUSTOMER_PROVINCE}                            id=new-address-province
${LOCATOR_CUSTOMER_DISTRICT}                            id=new-address-district
${LOCATOR_CUSTOMER_SUB_DISTRICT}                        id=new-address-sub-district
