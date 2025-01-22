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
    Enter Store Code    18527

Cash Payment at 7-Eleven Completed
    Pay with Cash at 7-Eleven

<div class="modal-dialog modal-dialog-centered" role="document">
    <div class="title">
    <div>ระบุที่อยู่จัดส่ง</div>
    <button type="button" class="btn-close">x</button>
    </div>
    <div id="pac-container">
    <div class="pac-search">
    <span class="glyphicon glyphicon-icon-search"></span>
    <input id="pac-input" type="text" autocomplete="off" placeholder="ค้นหาที่อยู่จัดส่ง">
    </div>
    <ul id="map-prediction"></ul>
    </div>
    <div id="popup">
    <div id="formatted-location">168 ประชาร่วมใจ 57 แขวงทรายกองดินใต้ เขตคลองสามวา กรุงเทพมหานคร 10510 ประเทศไทย</div>
    <div id="nearby-position">กรุณาเลือกตำแหน่งที่ใกล้เคียงที่สุด</div>
    <div id="selected-location" class="selected-locate" style="pointer-events: auto;">เลือกที่อยู่</div>
    </div>
    .....
    <div id="map-footer">
    <div></div>
    </div>
    </div>

    <div class="cf-def-locate">
    <div class="title">
    ข้อมูลที่อยู่ไม่ตรงกัน</div>
    <div class="content">
    <img loading="lazy" src="/assets/base/images/map/chart.svg">
    <p class="hightlight">ตำแหน่งที่คุณเลือกจากแผนที่</p>
    <p class="hightlight">ไม่ตรงกับที่อยู่ที่กรอกไว้</p>
    <p>กรุณาระบุตำแหน่งที่อยู่อีกครั้ง</p>
    <div class="def-btn">
    <div id="conf-dif-addr" class="def-btn-sty conf-addr"> ยืนยันตามที่อยู่ที่กรอกไว้</div>
    <div id="conf-def-re" class="def-btn-sty re-select">ระบุตำแหน่งใหม่</div>
    </div>
    </div>
    </div>
