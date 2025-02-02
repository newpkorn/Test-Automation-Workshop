*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Settings ***
Resource            ../resources/common/browser.resource
Resource            ../resources/homepage/homepage_keywords.resource
Resource            ../resources/shipping/shipping_keywords.resource
Resource            ../resources/payment/payment_keywords.resource

Suite Setup         Open Web Browser
Suite Teardown      Close All Browsers


*** Test Cases ***
Successful Product Purchase
    Close Cookie Braner
    Search and Select Products    AMARIT คอลลาเจน 30 แคปซูล
    Search and Select Products    แอคเน่-เอด ลิควิด 100 มล.
    Search and Select Products    มาลี น้ำส้มแมนดาริน 100% 1,000 มล.
    Open Shopping Cart
    Check All Product Details
    Perform Shipping Address
    Pay with Cash at 7-Eleven
