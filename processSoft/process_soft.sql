/*
Navicat MySQL Data Transfer

Source Server         : embel
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : process_soft

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2021-01-12 13:15:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access_control_details
-- ----------------------------
DROP TABLE IF EXISTS `access_control_details`;
CREATE TABLE `access_control_details` (
  `pk_access_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for barcode_details
-- ----------------------------
DROP TABLE IF EXISTS `barcode_details`;
CREATE TABLE `barcode_details` (
  `pk_barcode_details_id` bigint(20) NOT NULL,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `barcode_number` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_barcode_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bill_details
-- ----------------------------
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details` (
  `pk_customer_id` bigint(20) NOT NULL,
  `product_Name` varchar(255) NOT NULL,
  `okquantity` double DEFAULT NULL,
  `gst` bigint(20) DEFAULT NULL,
  `tax_amount` bigint(20) DEFAULT NULL,
  `buy_Price` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `creditcustomer` varchar(255) DEFAULT NULL,
  `custname` varchar(255) DEFAULT NULL,
  `contact_No` bigint(20) DEFAULT NULL,
  `gst_No` varchar(255) DEFAULT NULL,
  `initial_Payment` bigint(20) DEFAULT NULL,
  `gstFor_Expense` double DEFAULT NULL,
  `totalWith_Expense` double DEFAULT NULL,
  `payment_Mode` varchar(255) DEFAULT NULL,
  `outwardchallan_no` varchar(255) DEFAULT NULL,
  `sale_Date` date DEFAULT NULL,
  `custgstno` bigint(20) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_Amount` double DEFAULT NULL,
  `hamali_Expence` double DEFAULT NULL,
  `hamaliExpence` double DEFAULT NULL,
  `gross_Total` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  `bill_no` varchar(255) DEFAULT NULL,
  `hsn` varchar(45) DEFAULT NULL,
  `Operation` varchar(255) DEFAULT NULL,
  `InwardChallanNo` varchar(45) DEFAULT NULL,
  `vehicle` varchar(255) DEFAULT NULL,
  `Igst` bigint(20) DEFAULT NULL,
  `grid_Total` double(20,2) DEFAULT NULL,
  `bill_no1` varchar(255) DEFAULT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cashbankbooktable
-- ----------------------------
DROP TABLE IF EXISTS `cashbankbooktable`;
CREATE TABLE `cashbankbooktable` (
  `pkLastCashId` bigint(20) NOT NULL,
  `onDate` date DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  PRIMARY KEY (`pkLastCashId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `pk_cat_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(128) NOT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_cat_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for container_purchase
-- ----------------------------
DROP TABLE IF EXISTS `container_purchase`;
CREATE TABLE `container_purchase` (
  `Pk_Container_Pur_Id` bigint(20) NOT NULL,
  `Container_Name` varchar(45) DEFAULT NULL,
  `Capacity` bigint(20) DEFAULT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `Bill_No` varchar(45) DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Sale_Price` decimal(20,3) DEFAULT NULL,
  `Quantity` bigint(20) DEFAULT NULL,
  `Gst_Percentage` bigint(20) DEFAULT NULL,
  `IGst_Percentage` bigint(20) DEFAULT NULL,
  `Gross_Total` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`Pk_Container_Pur_Id`),
  KEY `fk_supplier_id_idx` (`fk_supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for container_stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `container_stock_detail`;
CREATE TABLE `container_stock_detail` (
  `pk_container_stock_id` bigint(20) NOT NULL,
  `container_name` varchar(45) DEFAULT NULL,
  `capacity` bigint(20) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_container_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for credit_customer_payment
-- ----------------------------
DROP TABLE IF EXISTS `credit_customer_payment`;
CREATE TABLE `credit_customer_payment` (
  `pk_credit_customer_id` bigint(10) NOT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `balance` decimal(20,2) DEFAULT NULL,
  `paymentType` varchar(128) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL,
  `cheque_num` varchar(128) DEFAULT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `acc_num` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `person_name` varchar(128) DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_details
-- ----------------------------
DROP TABLE IF EXISTS `customer_details`;
CREATE TABLE `customer_details` (
  `pk_customer_id` bigint(10) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `middle_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `email_id` varchar(128) DEFAULT NULL,
  `address` varchar(128) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `pin_code` bigint(20) NOT NULL,
  `gst_No` varchar(45) DEFAULT NULL,
  `Id_No` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer_order
-- ----------------------------
DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE `customer_order` (
  `pk_customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(128) DEFAULT NULL,
  `mobile_number` bigint(12) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `fk_item_id` bigint(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_customer_id`),
  KEY `fk_item_id` (`fk_item_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`fk_item_id`) REFERENCES `item_details` (`pk_item_id`),
  CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `customer_order_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee_details
-- ----------------------------
DROP TABLE IF EXISTS `employee_details`;
CREATE TABLE `employee_details` (
  `pk_empoyee_id` bigint(20) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `middle_name` varchar(128) NOT NULL,
  `joining_date` date NOT NULL,
  `email_id` varchar(128) DEFAULT NULL,
  `salary` decimal(10,0) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `address` varchar(128) NOT NULL,
  `pin_code` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_empoyee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee_payment
-- ----------------------------
DROP TABLE IF EXISTS `employee_payment`;
CREATE TABLE `employee_payment` (
  `pk_employee_payment_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `fk_employee_id` bigint(20) DEFAULT NULL,
  `person_name` varchar(128) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `paymentType` varchar(128) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `cheque_num` varchar(128) DEFAULT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `acc_num` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_employee_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for expenditure_details
-- ----------------------------
DROP TABLE IF EXISTS `expenditure_details`;
CREATE TABLE `expenditure_details` (
  `pk_expense_details_id` bigint(20) NOT NULL,
  `expense_name` varchar(128) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_expense_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for expenditure_payment
-- ----------------------------
DROP TABLE IF EXISTS `expenditure_payment`;
CREATE TABLE `expenditure_payment` (
  `pk_expenditure_payment_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `fk_expense_detail_id` bigint(20) DEFAULT NULL,
  `service_provide` varchar(128) DEFAULT NULL,
  `accountant_name` varchar(128) DEFAULT NULL,
  `total_amount` double(20,2) DEFAULT NULL,
  `credit` double(20,2) DEFAULT NULL,
  `debit` double(20,2) DEFAULT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_expenditure_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for expense_details_for_billing_and_goods_receive
-- ----------------------------
DROP TABLE IF EXISTS `expense_details_for_billing_and_goods_receive`;
CREATE TABLE `expense_details_for_billing_and_goods_receive` (
  `pk_expense_for_billing` bigint(20) NOT NULL,
  `expense_name` varchar(128) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  PRIMARY KEY (`pk_expense_for_billing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fertilizer_bill
-- ----------------------------
DROP TABLE IF EXISTS `fertilizer_bill`;
CREATE TABLE `fertilizer_bill` (
  `pk_fertilizer_bill_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `customer_name` varchar(128) DEFAULT NULL,
  `village` varchar(128) DEFAULT NULL,
  `contact_no` bigint(20) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `buy_price` decimal(20,2) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `expenses` decimal(20,2) DEFAULT NULL,
  `gross_total` decimal(20,2) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `batch_no` varchar(255) DEFAULT NULL,
  `customerBill` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(128) DEFAULT NULL,
  `check_number` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `card_number` bigint(128) DEFAULT NULL,
  `account_number` bigint(128) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `fk_credit_customer_id` bigint(10) DEFAULT NULL,
  `credit_customer_hidden_name` varchar(128) DEFAULT NULL,
  `tax_percentage` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(20,3) DEFAULT NULL,
  `aadhar_no` bigint(20) DEFAULT NULL,
  `fk_expense_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_fertilizer_bill_id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fk_credit_customer_id` (`fk_credit_customer_id`),
  KEY `fk_expense_id` (`fk_expense_id`),
  CONSTRAINT `fertilizer_bill_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product_details` (`pk_product_id`),
  CONSTRAINT `fertilizer_bill_ibfk_2` FOREIGN KEY (`fk_credit_customer_id`) REFERENCES `customer_details` (`pk_customer_id`),
  CONSTRAINT `fertilizer_bill_ibfk_3` FOREIGN KEY (`fk_expense_id`) REFERENCES `expense_details_for_billing_and_goods_receive` (`pk_expense_for_billing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fertilizer_billing
-- ----------------------------
DROP TABLE IF EXISTS `fertilizer_billing`;
CREATE TABLE `fertilizer_billing` (
  `pk_fertilizer_bill_id` bigint(20) NOT NULL,
  `fk_goods_receive_id` bigint(20) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `customer_name` varchar(128) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `total_per_product` decimal(20,2) DEFAULT NULL,
  `total_all_product` decimal(20,2) DEFAULT NULL,
  `transportation_expense` decimal(20,2) DEFAULT NULL,
  `hamali_expense` decimal(20,2) DEFAULT NULL,
  `gross_total` decimal(20,2) DEFAULT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  `tax_percentage` decimal(20,2) DEFAULT NULL,
  `village` varchar(128) DEFAULT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `aadhar` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `check_number` varchar(128) DEFAULT NULL,
  `account_number` varchar(128) DEFAULT NULL,
  `card_number` bigint(20) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL,
  `credit_customer_name` varchar(128) DEFAULT NULL,
  `total_after_sale_return` decimal(20,2) DEFAULT NULL,
  `return_amount` decimal(20,2) DEFAULT NULL,
  `return_quantity` bigint(20) DEFAULT NULL,
  `quantity_after_return` bigint(20) DEFAULT NULL,
  `hsn` varchar(128) DEFAULT NULL,
  `igstPercentage` decimal(20,2) DEFAULT NULL,
  `fk_shop_id` bigint(20) DEFAULT NULL,
  `saleDate` date DEFAULT NULL,
  `GST_No` varchar(45) DEFAULT NULL,
  `Discount_perc` bigint(20) DEFAULT NULL,
  `Discount_amount` decimal(20,3) DEFAULT NULL,
  `Tax_amount` decimal(20,3) DEFAULT NULL,
  `Without_Tax_Rate` decimal(20,3) DEFAULT NULL,
  `initial_Payment` decimal(20,3) DEFAULT NULL,
  `bal_After_initial_Payment` decimal(20,3) DEFAULT NULL,
  `Pay_Status` varchar(45) DEFAULT NULL,
  `bundel` decimal(20,2) DEFAULT NULL,
  `length` decimal(20,2) DEFAULT NULL,
  `cgst` double(10,1) DEFAULT NULL,
  `sgst` double(10,1) DEFAULT NULL,
  `igst` double(20,0) DEFAULT NULL,
  `CustomerGstNo` varchar(255) DEFAULT NULL,
  `InwardChallanNo` varchar(255) DEFAULT NULL,
  `OutwardChallanNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_fertilizer_bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for godownentry
-- ----------------------------
DROP TABLE IF EXISTS `godownentry`;
CREATE TABLE `godownentry` (
  `pkGodownId` bigint(20) NOT NULL AUTO_INCREMENT,
  `godownName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkGodownId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_receive
-- ----------------------------
DROP TABLE IF EXISTS `goods_receive`;
CREATE TABLE `goods_receive` (
  `pk_goods_receive_id` bigint(20) NOT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `BillNo` bigint(20) DEFAULT NULL,
  `dc_number` bigint(20) DEFAULT NULL,
  `type_of_function` varchar(150) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `micron` bigint(50) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `buy_price` decimal(20,2) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `quantity` double(20,0) DEFAULT NULL,
  `quantity_bundle` double(20,0) DEFAULT NULL,
  `length` double(20,0) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `batch_no` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `expenses` decimal(20,2) DEFAULT NULL,
  `gross_total` decimal(20,2) DEFAULT NULL,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `insertDate` date DEFAULT NULL,
  `fkCategoryId` bigint(20) DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `billType` varchar(255) DEFAULT NULL,
  `fkgodownid` bigint(20) DEFAULT NULL,
  `discount_percentage` decimal(64,2) DEFAULT NULL,
  `discount_amount` decimal(64,2) DEFAULT NULL,
  `bill_number` varchar(128) DEFAULT NULL,
  `fk_expense_id` bigint(20) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `tax_percentage` decimal(20,0) DEFAULT NULL,
  `barcodeNo` bigint(20) DEFAULT NULL,
  `company_Name` varchar(255) DEFAULT NULL,
  `dupQuantity` double(255,2) DEFAULT NULL,
  `return_amount` decimal(20,2) DEFAULT NULL,
  `total_after_return` decimal(20,2) DEFAULT NULL,
  `iGstPercentage` decimal(20,2) DEFAULT NULL,
  `fk_subCat_id` bigint(20) DEFAULT NULL,
  `weight_aft_short_minus` decimal(10,0) DEFAULT NULL,
  `fk_shop_id` bigint(20) DEFAULT NULL,
  `Per_Product_Total` decimal(20,3) DEFAULT NULL,
  `bill_payment_pending` decimal(20,3) DEFAULT NULL,
  `Tax_amount` decimal(20,3) DEFAULT NULL,
  `vehicleNo` varchar(255) DEFAULT NULL,
  `NoOfPackage` bigint(20) DEFAULT NULL,
  `PODate` varchar(45) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_goods_receive_id`),
  KEY `fk_supplier_id` (`fk_supplier_id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fkCategoryId` (`fkCategoryId`),
  KEY `fkgodownid` (`fkgodownid`),
  KEY `fk_expense_id` (`fk_expense_id`),
  KEY `goods_receive_ibfk_4_idx` (`fk_subCat_id`),
  CONSTRAINT `fkCategoryId` FOREIGN KEY (`fkCategoryId`) REFERENCES `categories` (`pk_cat_id`),
  CONSTRAINT `fkgodownid` FOREIGN KEY (`fkgodownid`) REFERENCES `godownentry` (`pkGodownId`),
  CONSTRAINT `goods_receive_ibfk_1` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier_details` (`pk_supplier_id`),
  CONSTRAINT `goods_receive_ibfk_2` FOREIGN KEY (`fk_product_id`) REFERENCES `product_details` (`pk_product_id`),
  CONSTRAINT `goods_receive_ibfk_3` FOREIGN KEY (`fk_expense_id`) REFERENCES `expense_details_for_billing_and_goods_receive` (`pk_expense_for_billing`),
  CONSTRAINT `goods_receive_ibfk_4` FOREIGN KEY (`fk_subCat_id`) REFERENCES `sub_categories` (`pk_subcat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for good_receive_stock
-- ----------------------------
DROP TABLE IF EXISTS `good_receive_stock`;
CREATE TABLE `good_receive_stock` (
  `pk_good_receive_stock_id` bigint(20) NOT NULL,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `shopId` bigint(20) DEFAULT NULL,
  `shopName` varchar(255) DEFAULT NULL,
  `lastUpdateDate` date DEFAULT NULL,
  PRIMARY KEY (`pk_good_receive_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for gr_details
-- ----------------------------
DROP TABLE IF EXISTS `gr_details`;
CREATE TABLE `gr_details` (
  `pk_gr_id` bigint(20) NOT NULL,
  `idno` varchar(255) DEFAULT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `contactno` bigint(20) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gstno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `quantity` double(20,2) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `grosstotal` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `gst` double DEFAULT NULL,
  `Shop` varchar(45) DEFAULT NULL,
  `billno` double(20,0) DEFAULT NULL,
  `GridTotal` double(20,0) DEFAULT NULL,
  `TaxAmount` varchar(255) DEFAULT NULL,
  `igst` double(20,0) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_gr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inwand_details
-- ----------------------------
DROP TABLE IF EXISTS `inwand_details`;
CREATE TABLE `inwand_details` (
  `pk_inward_id` bigint(20) DEFAULT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `challan_No` varchar(255) DEFAULT NULL,
  `pono` varchar(255) DEFAULT NULL,
  `inwardDate` date DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `quantity` double(20,2) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `alltotal` double DEFAULT NULL,
  `grosstotal` double DEFAULT NULL,
  `PODate` varchar(45) DEFAULT NULL,
  `dup_quantity` double(20,2) DEFAULT NULL,
  `hsn` varchar(45) DEFAULT NULL,
  `GridTotal` double(20,0) DEFAULT NULL,
  `fk_operation_details_id` bigint(20) DEFAULT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inward_process1
-- ----------------------------
DROP TABLE IF EXISTS `inward_process1`;
CREATE TABLE `inward_process1` (
  `inward_process1_pk` bigint(20) NOT NULL,
  `purchase_order_no` varchar(255) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `fk_operation_details_id` bigint(20) DEFAULT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `send_to_operation_details_id_fk` bigint(20) DEFAULT NULL,
  `send_to_operation_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`inward_process1_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for inward_process2
-- ----------------------------
DROP TABLE IF EXISTS `inward_process2`;
CREATE TABLE `inward_process2` (
  `inward_process2_pk` bigint(20) NOT NULL,
  `purchase_order_no` varchar(255) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `fk_operation_details_id` bigint(20) DEFAULT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `send_to_operation_details_id_fk` bigint(20) DEFAULT NULL,
  `send_to_operation_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` varchar(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`inward_process2_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for inward_process3
-- ----------------------------
DROP TABLE IF EXISTS `inward_process3`;
CREATE TABLE `inward_process3` (
  `inward_process3_pk` bigint(20) NOT NULL,
  `purchase_order_no` varchar(255) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `fk_operation_details_id` bigint(20) DEFAULT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `send_to_operation_details_id_fk` bigint(20) DEFAULT NULL,
  `send_to_operation_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`inward_process3_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for inward_process4
-- ----------------------------
DROP TABLE IF EXISTS `inward_process4`;
CREATE TABLE `inward_process4` (
  `inward_process4_pk` bigint(20) NOT NULL,
  `purchase_order_no` varchar(255) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `fk_operation_details_id` bigint(20) DEFAULT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `send_to_operation_details_id_fk` bigint(20) DEFAULT NULL,
  `send_to_operation_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`inward_process4_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for inward_processing_info
-- ----------------------------
DROP TABLE IF EXISTS `inward_processing_info`;
CREATE TABLE `inward_processing_info` (
  `inward_processing_info_pk` bigint(20) NOT NULL,
  `purchase_order_no` varchar(255) DEFAULT NULL,
  `challan_no` varchar(255) DEFAULT NULL,
  `fk_operation_details_id` bigint(20) DEFAULT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  PRIMARY KEY (`inward_processing_info_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for item_details
-- ----------------------------
DROP TABLE IF EXISTS `item_details`;
CREATE TABLE `item_details` (
  `pk_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(128) NOT NULL,
  `fk_product_id` bigint(20) NOT NULL,
  `size_or_quantity` varchar(128) DEFAULT NULL,
  `buy_price` decimal(10,0) NOT NULL,
  `sale_price` decimal(10,0) NOT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_item_id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `item_details_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product_details` (`pk_product_id`),
  CONSTRAINT `item_details_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `item_details_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_stock
-- ----------------------------
DROP TABLE IF EXISTS `item_stock`;
CREATE TABLE `item_stock` (
  `pk_item_stock_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `stock` decimal(20,2) DEFAULT NULL,
  `fk_godown_id` bigint(20) DEFAULT NULL,
  `fk_cat_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_item_stock_id`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fk_godown_id` (`fk_godown_id`),
  KEY `fk_cat_id` (`fk_cat_id`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product_details` (`pk_product_id`),
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`fk_godown_id`) REFERENCES `godownentry` (`pkGodownId`),
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`fk_cat_id`) REFERENCES `categories` (`pk_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_stockforpestiandseed
-- ----------------------------
DROP TABLE IF EXISTS `item_stockforpestiandseed`;
CREATE TABLE `item_stockforpestiandseed` (
  `pk_item_stock_id_forseed` bigint(20) NOT NULL AUTO_INCREMENT,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `stock` decimal(20,2) DEFAULT NULL,
  `batchNo` varchar(255) DEFAULT NULL,
  `fk_godown_id` bigint(20) DEFAULT NULL,
  `fk_cat_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_item_stock_id_forseed`),
  KEY `fk_product_id` (`fk_product_id`),
  KEY `fk_godown_id` (`fk_godown_id`),
  KEY `fk_cat_id` (`fk_cat_id`),
  CONSTRAINT `item_stockforpestiandseed_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `product_details` (`pk_product_id`),
  CONSTRAINT `item_stockforpestiandseed_ibfk_2` FOREIGN KEY (`fk_godown_id`) REFERENCES `godownentry` (`pkGodownId`),
  CONSTRAINT `item_stockforpestiandseed_ibfk_3` FOREIGN KEY (`fk_cat_id`) REFERENCES `categories` (`pk_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for operation_details
-- ----------------------------
DROP TABLE IF EXISTS `operation_details`;
CREATE TABLE `operation_details` (
  `pk_operation_details_id` bigint(10) NOT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_operation_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for outward_details
-- ----------------------------
DROP TABLE IF EXISTS `outward_details`;
CREATE TABLE `outward_details` (
  `pk_outward_id` bigint(20) NOT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `hsn` varchar(255) DEFAULT NULL,
  `challan_No` varchar(255) DEFAULT NULL,
  `outwardchallan_no` varchar(255) DEFAULT NULL,
  `inwardDate` date DEFAULT NULL,
  `outward_date` date DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rejectedquantity` double(20,2) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `alltotal` varchar(255) DEFAULT NULL,
  `grosstotal` varchar(255) DEFAULT '',
  `unprocessquantity` double(20,2) DEFAULT NULL,
  `okquantity` double(20,2) DEFAULT NULL,
  `vechicleNo` varchar(45) DEFAULT NULL,
  `boxDescripation` varchar(45) DEFAULT NULL,
  `tinNo` varchar(45) DEFAULT NULL,
  `IdNo` varchar(45) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `GridTotal` double DEFAULT NULL,
  `dupQuantity` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_outward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for outward_return
-- ----------------------------
DROP TABLE IF EXISTS `outward_return`;
CREATE TABLE `outward_return` (
  `pkGRDetailsid` bigint(20) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `hsn` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Operaation` varchar(255) DEFAULT NULL,
  `ChallanNo` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `Rate` double DEFAULT NULL,
  `OkQuantity` double DEFAULT NULL,
  `UnprocesQty` double DEFAULT NULL,
  `RejQty` double DEFAULT NULL,
  `ReturnQty` double DEFAULT NULL,
  `SupplierName` varchar(255) DEFAULT NULL,
  `TotalValue` double DEFAULT NULL,
  `outwardChallanno` varchar(255) DEFAULT NULL,
  `idno` varchar(45) DEFAULT NULL,
  `vehicleName` varchar(255) DEFAULT NULL,
  `InwardDate` varchar(255) DEFAULT NULL,
  `OutwardDate` varchar(255) DEFAULT NULL,
  `boxDescription` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pkGRDetailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for packing
-- ----------------------------
DROP TABLE IF EXISTS `packing`;
CREATE TABLE `packing` (
  `pk_pack_id` bigint(20) NOT NULL,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `fk_type_id` bigint(20) DEFAULT NULL,
  `container` varchar(255) DEFAULT NULL,
  `Packing_Quantity` bigint(20) DEFAULT NULL,
  `product_Name` varchar(45) DEFAULT NULL,
  `fk_Cat_Id` bigint(20) DEFAULT NULL,
  `fk_SubCat_Id` bigint(20) DEFAULT NULL,
  `fk_Shop_Id` bigint(20) DEFAULT NULL,
  `bill_No` bigint(20) DEFAULT NULL,
  `supplier` bigint(20) DEFAULT NULL,
  `buy_Price` decimal(20,0) DEFAULT NULL,
  `quantity` decimal(20,0) DEFAULT NULL,
  `inward_Date` date DEFAULT NULL,
  `purchase_Date` date DEFAULT NULL,
  `bundel` varchar(45) DEFAULT NULL,
  `quantity_in_bundle` bigint(20) DEFAULT NULL,
  `length` bigint(20) DEFAULT NULL,
  `type_of_function` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `micron` decimal(20,0) DEFAULT NULL,
  `InwardChallanNo` varchar(255) DEFAULT NULL,
  `OutWardChallanNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_pack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for packing_type
-- ----------------------------
DROP TABLE IF EXISTS `packing_type`;
CREATE TABLE `packing_type` (
  `pk_type_id` bigint(30) NOT NULL,
  `Packing_Type` bigint(20) DEFAULT NULL,
  `fk_unit_Id` bigint(20) DEFAULT NULL,
  `Container_Name` varchar(45) DEFAULT NULL,
  `Extra_Packing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pesticide_billing
-- ----------------------------
DROP TABLE IF EXISTS `pesticide_billing`;
CREATE TABLE `pesticide_billing` (
  `pk_pesticide_bill_id` bigint(20) NOT NULL,
  `fk_goods_receive_id` bigint(20) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `customer_name` varchar(128) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `total_per_product` decimal(20,2) DEFAULT NULL,
  `total_all_product` decimal(20,2) DEFAULT NULL,
  `transportation_expense` decimal(20,2) DEFAULT NULL,
  `hamali_expense` decimal(20,2) DEFAULT NULL,
  `gross_total` decimal(20,2) DEFAULT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  `tax_percentage` decimal(20,2) DEFAULT NULL,
  `village` varchar(128) DEFAULT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `aadhar` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `check_number` varchar(128) DEFAULT NULL,
  `account_number` varchar(128) DEFAULT NULL,
  `card_number` bigint(20) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL,
  `credit_customer_name` varchar(128) DEFAULT NULL,
  `expiry_date` varchar(128) DEFAULT NULL,
  `batch_number` varchar(128) DEFAULT NULL,
  `total_after_sale_return` decimal(20,2) DEFAULT NULL,
  `return_amount` decimal(20,2) DEFAULT NULL,
  `return_quantity` bigint(20) DEFAULT NULL,
  `quantity_after_return` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_pesticide_bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for po_details
-- ----------------------------
DROP TABLE IF EXISTS `po_details`;
CREATE TABLE `po_details` (
  `pk_po_id` bigint(20) NOT NULL,
  `idno` varchar(255) DEFAULT NULL,
  `suppliername` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `contactno` bigint(20) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gstno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `grosstotal` double DEFAULT NULL,
  `Shop` varchar(45) DEFAULT NULL,
  `grid_total` double(55,0) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_details
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `pk_product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(128) DEFAULT NULL,
  `fk_cat_id` bigint(20) DEFAULT NULL,
  `fk_unit_id` bigint(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `manufacturing_company` varchar(128) DEFAULT NULL,
  `buy_price` decimal(10,2) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,3) DEFAULT NULL,
  `status` bigint(10) DEFAULT NULL,
  `credit_customer_sale_price` decimal(10,2) DEFAULT NULL,
  `fk_tax_id` bigint(20) DEFAULT NULL,
  `tax_percentage` decimal(10,2) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `hsn` varchar(128) DEFAULT NULL,
  `fk_subCat_id` bigint(20) DEFAULT NULL,
  `Id_No` varchar(45) DEFAULT NULL,
  `fk_shop_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_product_id`),
  KEY `fk_cat_id` (`fk_cat_id`),
  KEY `fk_unittype_id` (`fk_unit_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  KEY `product_details_ibfk_7_idx` (`fk_subCat_id`),
  KEY `product_details_ibfk_8_idx` (`fk_shop_id`),
  CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`fk_cat_id`) REFERENCES `categories` (`pk_cat_id`),
  CONSTRAINT `product_details_ibfk_3` FOREIGN KEY (`fk_unit_id`) REFERENCES `sold_units` (`pk_unit_id`),
  CONSTRAINT `product_details_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `product_details_ibfk_6` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `product_details_ibfk_7` FOREIGN KEY (`fk_subCat_id`) REFERENCES `sub_categories` (`pk_subcat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_details_ibfk_8` FOREIGN KEY (`fk_shop_id`) REFERENCES `shop_details` (`pk_shop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order` (
  `pk_purchase_order_id` bigint(20) NOT NULL,
  `fk_cat_id` bigint(20) DEFAULT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `fk_product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `buy_price` decimal(20,2) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `po_number` bigint(20) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `token_rate` decimal(20,2) DEFAULT NULL,
  `manufacturer` varchar(128) DEFAULT NULL,
  `gross_total` decimal(20,2) DEFAULT NULL,
  `unit_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pk_purchase_order_id`),
  KEY `fk_cat_id` (`fk_cat_id`),
  KEY `fk_supplier_id` (`fk_supplier_id`),
  KEY `fk_product_id` (`fk_product_id`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`fk_cat_id`) REFERENCES `categories` (`pk_cat_id`),
  CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier_details` (`pk_supplier_id`),
  CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`fk_product_id`) REFERENCES `product_details` (`pk_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for purchase_return
-- ----------------------------
DROP TABLE IF EXISTS `purchase_return`;
CREATE TABLE `purchase_return` (
  `pk_purchase_return_id` bigint(20) NOT NULL,
  `fk_gr_id` bigint(20) DEFAULT NULL,
  `bill_number` bigint(20) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `operation` varchar(128) DEFAULT NULL,
  `rate` decimal(20,2) DEFAULT NULL,
  `available_quantity` decimal(20,2) DEFAULT NULL,
  `return_quantity` decimal(20,2) DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL,
  `gst` decimal(20,2) DEFAULT NULL,
  `igst` double(20,2) DEFAULT NULL,
  `taxAmount` double(20,2) DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  `return_amount` decimal(20,2) DEFAULT NULL,
  `suppliername` varchar(128) DEFAULT NULL,
  `gross_total` double(20,2) DEFAULT NULL,
  `purchase_date` varchar(128) DEFAULT NULL,
  `fk_seed_bill_id` bigint(20) DEFAULT NULL,
  `fk_pesti_bill_id` bigint(20) DEFAULT NULL,
  `batch_number` varchar(128) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`pk_purchase_return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sale_return
-- ----------------------------
DROP TABLE IF EXISTS `sale_return`;
CREATE TABLE `sale_return` (
  `pk_sale_return_id` bigint(20) NOT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `fk_fertilizer_bill_id` bigint(20) DEFAULT NULL,
  `bill_number` bigint(20) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `availabe_quantity` decimal(20,0) DEFAULT NULL,
  `return_quantity` decimal(20,0) DEFAULT NULL,
  `tax_percenntage` decimal(20,2) DEFAULT NULL,
  `return_amount` decimal(20,2) DEFAULT NULL,
  `customer_name` varchar(128) DEFAULT NULL,
  `sale_date` varchar(128) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `aadhar` bigint(20) DEFAULT NULL,
  `fk_seed_bill_id` bigint(20) DEFAULT NULL,
  `fk_pesti_bill_id` bigint(20) DEFAULT NULL,
  `batch_number` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pk_sale_return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for save_daily_stock
-- ----------------------------
DROP TABLE IF EXISTS `save_daily_stock`;
CREATE TABLE `save_daily_stock` (
  `pk_daily_stock_id` bigint(20) NOT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `batch_number` varchar(128) DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `insert_date` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`pk_daily_stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seed_pesticide_billing
-- ----------------------------
DROP TABLE IF EXISTS `seed_pesticide_billing`;
CREATE TABLE `seed_pesticide_billing` (
  `pk_seed_pesticide_bill_id` bigint(20) NOT NULL,
  `fk_goods_receive_id` bigint(20) DEFAULT NULL,
  `cat_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `customer_name` varchar(128) DEFAULT NULL,
  `product_name` varchar(128) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `weight` decimal(20,3) DEFAULT NULL,
  `sale_price` decimal(20,2) DEFAULT NULL,
  `mrp` decimal(20,2) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `total_per_product` decimal(20,2) DEFAULT NULL,
  `total_all_product` decimal(20,2) DEFAULT NULL,
  `transportation_expense` decimal(20,2) DEFAULT NULL,
  `hamali_expense` decimal(20,2) DEFAULT NULL,
  `gross_total` decimal(20,2) DEFAULT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  `tax_percentage` decimal(20,2) DEFAULT NULL,
  `village` varchar(128) DEFAULT NULL,
  `contact_number` bigint(20) DEFAULT NULL,
  `aadhar` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `check_number` varchar(128) DEFAULT NULL,
  `account_number` varchar(128) DEFAULT NULL,
  `card_number` bigint(20) DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `fk_customer_id` bigint(20) DEFAULT NULL,
  `credit_customer_name` varchar(128) DEFAULT NULL,
  `expiry_date` varchar(128) DEFAULT NULL,
  `batch_number` varchar(128) DEFAULT NULL,
  `total_after_sale_return` decimal(20,2) DEFAULT NULL,
  `return_amount` decimal(20,2) DEFAULT NULL,
  `return_quantity` bigint(20) DEFAULT NULL,
  `quantity_after_return` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_seed_pesticide_bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_details
-- ----------------------------
DROP TABLE IF EXISTS `shop_details`;
CREATE TABLE `shop_details` (
  `pk_shop_id` bigint(20) NOT NULL,
  `Shop_id` bigint(255) DEFAULT NULL,
  `shop_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pk_shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sold_units
-- ----------------------------
DROP TABLE IF EXISTS `sold_units`;
CREATE TABLE `sold_units` (
  `pk_unit_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) NOT NULL,
  `is_desc` char(1) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `unit_description` varchar(128) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_unit_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `sold_units_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `sold_units_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `PKSTOCKID` bigint(20) NOT NULL,
  `PRODUCTNAME` varchar(255) DEFAULT NULL,
  `COMPANYNAME` varchar(255) DEFAULT NULL,
  `WEIGHT` double DEFAULT NULL,
  `QUANTITYINKG` double(200,0) DEFAULT NULL,
  `QUANTITYINBUNDLE` double(200,0) DEFAULT NULL,
  `UNPACKEDQUANTITY` double(200,0) DEFAULT NULL,
  `UPDATEDATE` date DEFAULT NULL,
  PRIMARY KEY (`PKSTOCKID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for stock_detail
-- ----------------------------
DROP TABLE IF EXISTS `stock_detail`;
CREATE TABLE `stock_detail` (
  `PkStockId` bigint(20) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `CompanyName` varchar(255) DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `Quantity` double(200,2) DEFAULT NULL,
  `UpdateDate` date DEFAULT NULL,
  `batch_number` varchar(128) DEFAULT NULL,
  `unpacked_Quantity` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PkStockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE `sub_categories` (
  `sub_cat_name` varchar(45) DEFAULT NULL,
  `fk_cat_id` bigint(20) DEFAULT NULL,
  `pk_subcat_id` bigint(20) NOT NULL,
  PRIMARY KEY (`pk_subcat_id`),
  KEY `fk_cat_id_idx` (`fk_cat_id`),
  CONSTRAINT `fk_cat_id` FOREIGN KEY (`fk_cat_id`) REFERENCES `categories` (`pk_cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_account_details
-- ----------------------------
DROP TABLE IF EXISTS `supplier_account_details`;
CREATE TABLE `supplier_account_details` (
  `pk_supplier_acc_details` bigint(20) NOT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_supplier_acc_details`),
  KEY `fk_supplier_id` (`fk_supplier_id`),
  CONSTRAINT `supplier_account_details_ibfk_1` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier_details` (`pk_supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_details
-- ----------------------------
DROP TABLE IF EXISTS `supplier_details`;
CREATE TABLE `supplier_details` (
  `pk_supplier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `alternate_no` bigint(20) DEFAULT NULL,
  `email_id` varchar(128) DEFAULT NULL,
  `contact_person_name` varchar(128) NOT NULL,
  `tin_no` varchar(128) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL,
  `address` varchar(128) NOT NULL,
  `supplier_detailscol` varchar(45) DEFAULT NULL,
  `suplier_price` decimal(20,0) DEFAULT NULL,
  `Id_No` varchar(45) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_supplier_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `supplier_details_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `supplier_details_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_payment
-- ----------------------------
DROP TABLE IF EXISTS `supplier_payment`;
CREATE TABLE `supplier_payment` (
  `pk_supplier_payment_id` bigint(20) NOT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `balance` decimal(20,2) DEFAULT NULL,
  `paymentType` varchar(180) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL,
  `cheque_num` varchar(20) DEFAULT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `acc_num` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `person_name` varchar(128) DEFAULT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `debit_Amount` double(20,0) DEFAULT NULL,
  `supplier` varchar(45) DEFAULT NULL,
  `tds_details` double(20,0) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_supplier_payment_id`),
  KEY `fk_supplier_id` (`fk_supplier_id`),
  CONSTRAINT `fk_supplier_id` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier_details` (`pk_supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tax_details
-- ----------------------------
DROP TABLE IF EXISTS `tax_details`;
CREATE TABLE `tax_details` (
  `pk_tax_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(128) NOT NULL,
  `percentage` double(10,2) NOT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(128) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_tax_id`),
  KEY `created_by` (`created_by`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `tax_details_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`pk_user_id`),
  CONSTRAINT `tax_details_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_details` (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_details
-- ----------------------------
DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `pk_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `mobile_no` bigint(12) NOT NULL,
  `address_line1` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `pan_no` varchar(128) NOT NULL,
  `is_active` char(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `user_name` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `re_password` varchar(128) DEFAULT NULL,
  `typeId` varchar(255) DEFAULT NULL,
  `Shop_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vendor_payment
-- ----------------------------
DROP TABLE IF EXISTS `vendor_payment`;
CREATE TABLE `vendor_payment` (
  `pk_vendor_payment_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `bill_no` bigint(20) DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `balance` decimal(20,2) DEFAULT NULL,
  `paymentType` varchar(180) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL,
  `cheque_num` varchar(20) DEFAULT NULL,
  `card_num` bigint(20) DEFAULT NULL,
  `acc_num` bigint(20) DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `person_name` varchar(128) DEFAULT NULL,
  `fk_supplier_id` bigint(20) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `bank_name` varchar(128) DEFAULT NULL,
  `name_on_check` varchar(128) DEFAULT NULL,
  `debit_Amount` varchar(255) DEFAULT NULL,
  `supplier` varchar(45) DEFAULT NULL,
  `tds_details` varchar(255) DEFAULT NULL,
  `balance_Amountv` double(20,0) DEFAULT NULL,
  `total_Amountv` double(20,0) DEFAULT NULL,
  `bill_no1` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pk_vendor_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
