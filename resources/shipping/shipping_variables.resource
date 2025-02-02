*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Variables ***
${USERNAME}                                                     ${EMPTY}
${PASSWORD}                                                     ${EMPTY}

${LOCATOR_ADDRESS_TAB}                                          css=a.tab-address
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

${LOCATOR_GCP_MAP}                                              xpath=//*[@id="gcp-map"]/div
${LOCATOR_LOCATION_MAP_POPUP}                                   xpath=//*[@id="popup"]
${LOCATOR_SELECTED_LOCATION}                                    xpath=//*[@id="selected-location"]
${LOCATOR_LOCATION_MAP}                                         xpath=//*[@id="map-location"]

${LOCATOR_BTN_SELECT_LOCATION}                                  id=selected-location
${LOCATOR_BTN_SELECT_ADDR}                                      id=conf-dif-addr
${LOCATOR_BTN_CONTINUE_PAYMENT}                                 id=continue-payment-btn

${LOCATOR_COOKIE_POPUP}                                         css=div.alert-cookie-gdpr-allonline
${CLOSE_MAP_MODAL_BUTTON}                                       xpath=//div[@id='gcp-map']//button[@type='button'][normalize-space()='x']

${LOCATOR_BTN_PROCEED_TO_PAYMENT}                               css=a.btn-proceed
${LOCATOR_SHIPPING_FEE}                                         xpath=(//td[@class='currency']/b)[2]
${LOCATOR_NET_TOTAL}                                            id=totalAmount
${LOCATOR_ALL_MEMBER_POINTS}                                    css=td.currency.allmembers b
