<!-- Comment
Deverlop By: Pakorn Soikham
Date: 25-01-2025
-->

# 🛒 **Automated Test Script**

This script is used to test ordering products on the website **[AllOnline 7Eleven](https://www.allonline.7eleven.co.th/)**.

---

### 📋 **Test Data**

#### 🛍️ **Selected Products**

1. **AMARIT คอลลาเจน 30 แคปซูล** (1 ชิ้น)
2. **แอคเน่-เอด ลิควิด 100 มล.** (1 ชิ้น)
3. **มาลี น้ำส้มแมนดาริน 100% 1,000 มล.** (1 ชิ้น)

> **Note:**  
> Product pricing may change. Please check the information on the website prior to the test.

#### 🚚 **Shipping Address**

- **จัดส่งตามที่ออยู่**: 45/89 ซ.พระโขนง ต.คลองเตย อ.คลองเตย กรุงเทพฯ 10110

#### 💳 **Payment Method**

- **Payment**: ชำระด้วยเงินสด ที่ร้านเซเว่นอีเลฟเว่น #18527 สาขา PTTOR พระราม 4-พระโขนง
- **Address**: เลขที่ 4 ถ.พระรามที่, 3767/1, แขวงพระโขนง เขตคลองเตย กรุงเทพฯ 10110

---

### 📝 **Steps to Execute**

1. เลือกซื้อสินค้า
2. เลือกวิธีการจัดส่ง
3. เลือกวิธีการชำระเงิน

---

### 🎯 **Expected Results**

- สั่งซื้อสินค้าสำเร็จ

---

### 📅 **Expected Data**

#### **Order Details:**

- **หมายเลขสั่งซื้อ:**: #A437365905
- **วันที่สั่งซื้อ**: 15/01/2568
- **วิธีการชำระเงิน**: ชำระด้วยเงินสด ที่ร้านเซเว่นอีเลฟเว่นCash at 7-Eleven

#### **Shipping Address:**

- **ชื่อ**: ชญานิศา วงศ์ภักดี
- **เบอร์โทร**: 089-567-8912
- **ที่อยู่ในการจัดส่ง**: 45/89 ซ.พระโขนง ต.คลองเตย อ.คลองเตย กรุงเทพฯ 10110

#### **Product Details:**

1. **ชื่อสินค้า#1**: AMARIT คอลลาเจน 30 แคปซูล
   - **จำนวน**: 1 ชิ้น
   - **Price**: 119.00
2. **Product Name**: Acne Aid Liquid 100ml
   - **จำนวน**: 1 ชิ้น
   - **Price**: 149.00
3. **Product Name**: Mali Mandarine Orange Juice 100% 1,000ml
   - **จำนวน**: 1 ชิ้น
   - **Price**: 149.00

#### **ราคารวม**: 417.00

#### **ค่าจัดส่ง**: 50.00

#### **ยอดสุทธิ**: 467.00

#### **รับ All member Point**: 123

---

### ⚙️ **Environment Configuration**

🤖 Install the necessary packages as follows:

```env
pip install robotframework
pip install robotframework-seleniumlibrary
pip install python-dotenv
```

Create a `.env` file and add your **AllOnline account credentials** in the following format:

```env
username=your_account@email.com
password=your_password
```

Save the file after adding your email and password.

> **Note:**  
> Please use your **Existing AllOnline account credentials**. If you don't have an account, then register first.

### 🚀 **Run Test Script**

You can run the test script using the following command:

**For Chrome**:

```env
make test_with_chrome
```

**For Headless Chrome (Not currently working due to 403 error)**:

```env
make test_with_headlesschrome
```

> **Note:**  
> Please ensure that the version of ChromeDriver installed on your machine matches the version of the Chrome browser.
