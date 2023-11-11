-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 01:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sewa-tenant`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_types`
--

CREATE TABLE `tbl_account_types` (
  `account_type_id` int(2) NOT NULL,
  `account_type` varchar(20) NOT NULL,
  `account_type_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_account_types`
--

INSERT INTO `tbl_account_types` (`account_type_id`, `account_type`, `account_type_order`) VALUES
(1, 'Administrator', 1),
(2, 'Leasing', 2),
(5, 'Customer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admins`
--

CREATE TABLE `tbl_admins` (
  `admin_id` int(3) NOT NULL,
  `admin_employee_no` varchar(25) NOT NULL,
  `admin_fullname` varchar(50) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(75) NOT NULL,
  `admin_photo` varchar(255) NOT NULL,
  `admin_type_id` int(2) NOT NULL,
  `active_status` int(2) NOT NULL,
  `created_by` int(3) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(3) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admins`
--

INSERT INTO `tbl_admins` (`admin_id`, `admin_employee_no`, `admin_fullname`, `admin_email`, `admin_password`, `admin_photo`, `admin_type_id`, `active_status`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, '1', 'Rizalul Fahmi', 'rizal@gmail.com', 'ba0730af81f5d5b520778e49c650c700', '', 1, 1, 1, '2023-06-11 20:14:09', 1, '2023-06-11 20:14:09'),
(5, '19215034', 'Syahrul Iman', 'syahrul@gmail.com', 'bc2c4885c5668d245c4cd05da04b621d', '', 2, 1, 1, '2023-06-12 18:37:52', 1, '2023-06-12 18:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments`
--

CREATE TABLE `tbl_payments` (
  `payment_id` int(5) NOT NULL,
  `payment_nominal` int(11) NOT NULL,
  `payment_method_id` int(2) NOT NULL,
  `payment_status_id` int(2) NOT NULL,
  `payment_transaction_no` varchar(20) NOT NULL,
  `payment_paymentslip_file` varchar(100) NOT NULL,
  `payment_verif_id` int(2) NOT NULL,
  `payment_verif_by` int(5) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_payments`
--

INSERT INTO `tbl_payments` (`payment_id`, `payment_nominal`, `payment_method_id`, `payment_status_id`, `payment_transaction_no`, `payment_paymentslip_file`, `payment_verif_id`, `payment_verif_by`, `payment_type`, `payment_date`) VALUES
(1, 150000000, 1, 2, 'TRX-110623.001', 'Unggahan_Bukti-Pembayaran_TRX-110623-001.jpeg', 3, 1, 'new', '2023-06-12 14:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_methods`
--

CREATE TABLE `tbl_payment_methods` (
  `method_id` int(2) NOT NULL,
  `method_bank_name` varchar(15) NOT NULL,
  `method_bank_account` varchar(25) NOT NULL,
  `method_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_payment_methods`
--

INSERT INTO `tbl_payment_methods` (`method_id`, `method_bank_name`, `method_bank_account`, `method_type`) VALUES
(1, 'BCA', '123456789', 'Bank Transfer'),
(2, 'Mandiri', '135792468', 'Bank Transfer'),
(3, 'BNI', '1122334455', 'Bank Transfer'),
(4, 'BCA', '123456789006', 'Akun Virtual'),
(5, 'Mandiri', '135792468006', 'Akun Virtual'),
(6, 'BNI', '1122334455006', 'Akun Virtual');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_renewal_transactions`
--

CREATE TABLE `tbl_renewal_transactions` (
  `renewal_id` int(5) NOT NULL,
  `renewal_no` varchar(20) NOT NULL,
  `renewal_tenant_id` int(3) NOT NULL,
  `renewal_rent_from` datetime NOT NULL,
  `renewal_rent_to` datetime NOT NULL,
  `renewal_rent_total_month` int(5) NOT NULL,
  `renewal_type_of_business` varchar(50) NOT NULL,
  `renewal_company_name` varchar(50) NOT NULL,
  `renewal_note` varchar(250) NOT NULL,
  `renewal_rent_type_id` int(2) NOT NULL,
  `renewal_active_status_id` int(2) NOT NULL,
  `renewal_contract_file` varchar(100) NOT NULL,
  `renewal_contract_verif_id` int(2) NOT NULL,
  `renewal_contract_verif_by` int(5) NOT NULL,
  `renewal_customer_id` int(5) NOT NULL,
  `renewal_date` datetime NOT NULL,
  `modified_by` int(5) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `status_id` int(2) NOT NULL,
  `status_code` int(2) NOT NULL,
  `status_name` varchar(30) NOT NULL,
  `status_category` varchar(25) NOT NULL,
  `status_category_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`status_id`, `status_code`, `status_name`, `status_category`, `status_category_code`) VALUES
(1, 1, 'Menunggu Pembayaran', 'Pembayaran', 'PAYMENT'),
(2, 2, 'Sudah Dibayar', 'Pembayaran', 'PAYMENT'),
(3, 3, 'Dibatalkan', 'Pembayaran', 'PAYMENT'),
(4, 1, 'Belum Aktif', 'Masa Aktif Sewa', 'ACTIVE_PERIOD'),
(5, 2, 'Aktif / Berjalan', 'Masa Aktif Sewa', 'ACTIVE_PERIOD'),
(6, 3, 'Non-aktif / Berakhir', 'Masa Aktif Sewa', 'ACTIVE_PERIOD'),
(7, 1, 'Baru', 'Jenis Sewa', 'RENT_TYPE'),
(8, 2, 'Perpanjangan', 'Jenis Sewa', 'RENT_TYPE'),
(9, 1, 'Tersedia', 'Ketersediaan', 'AVAILABILITY'),
(10, 2, 'Tidak Tersedia', 'Ketersediaan', 'AVAILABILITY'),
(11, 1, 'Aktif', 'Akun', 'ACCOUNT'),
(12, 2, 'Ditutup', 'Akun', 'ACCOUNT'),
(13, 1, 'Menunggu Verifikasi Pembayaran', 'Verifikasi Pembayaran', 'PAY_VERIFICATION'),
(14, 2, 'Proses Verifikasi Pembayaran', 'Verifikasi Pembayaran', 'PAY_VERIFICATION'),
(15, 3, 'Pembayaran Terverifikasi', 'Verifikasi Pembayaran', 'PAY_VERIFICATION'),
(16, 1, 'Menunggu Verifikasi Dokumen', 'Verifikasi Dokumen', 'DOC_VERIFICATION'),
(17, 2, 'Proses Verifikasi Dokumen', 'Verifikasi Dokumen', 'DOC_VERIFICATION'),
(18, 3, 'Dokumen Terverifikasi', 'Verifikasi Dokumen', 'DOC_VERIFICATION');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tenants`
--

CREATE TABLE `tbl_tenants` (
  `tenant_id` int(3) NOT NULL,
  `tenant_code` varchar(15) NOT NULL,
  `tenant_name` varchar(25) NOT NULL,
  `tenant_size` varchar(25) NOT NULL,
  `tenant_image` varchar(255) NOT NULL,
  `tenant_location` varchar(25) NOT NULL,
  `tenant_price` int(11) NOT NULL,
  `tenant_min_period` int(2) NOT NULL,
  `tenant_info` varchar(250) NOT NULL,
  `tenant_availability` int(2) NOT NULL,
  `created_by` int(3) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_by` int(3) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_tenants`
--

INSERT INTO `tbl_tenants` (`tenant_id`, `tenant_code`, `tenant_name`, `tenant_size`, `tenant_image`, `tenant_location`, `tenant_price`, `tenant_min_period`, `tenant_info`, `tenant_availability`, `created_by`, `created_date`, `modified_by`, `modified_date`) VALUES
(1, '', 'Tenant Utama', '15 x 20 m', 'xps-7zwvnvsaafy-unsplash.jpg', 'Lantai 2', 25000000, 3, 'Tidak termasuk biaya listrik', 2, 1, '2023-06-11 20:14:10', 1, '2023-06-11 21:11:24'),
(2, '', 'Tenant 001', '15 X 20 m', 'tenant-01.jpeg', 'Lantai 2', 3000000, 3, 'Tidak termasuk biaya listrik', 1, 1, '2023-06-11 20:41:32', 1, '2023-06-11 20:58:21'),
(3, '', 'Tenant 002', '18 X 20 m', 'tenant-02.jpeg', 'Lantai 1', 3500000, 3, 'Tidak termasuk biaya listrik', 1, 1, '2023-06-11 21:07:39', 1, '2023-06-11 21:07:39'),
(4, '', 'Tenant 003', '20 X 20 m', 'tenant-03.jpeg', 'Lantai 2', 4000000, 3, 'Tidak termasuk biaya listrik', 1, 1, '2023-06-11 21:08:26', 1, '2023-06-11 21:08:26'),
(5, '', 'Tenant 005', '25 X 20 m', 'tenant-05.jpeg', 'Lantai 3', 3500000, 3, 'Tidak termasuk biaya listrik', 1, 1, '2023-06-11 21:09:24', 1, '2023-06-11 21:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `transaction_id` int(5) NOT NULL,
  `transaction_no` varchar(20) NOT NULL,
  `transaction_tenant_id` int(3) NOT NULL,
  `transaction_rent_from` datetime NOT NULL,
  `transaction_rent_to` datetime NOT NULL,
  `transaction_rent_total_month` int(5) NOT NULL,
  `transaction_type_of_business` varchar(50) NOT NULL,
  `transaction_company_name` varchar(50) NOT NULL,
  `transaction_note` varchar(250) NOT NULL,
  `transaction_rent_type_id` int(2) NOT NULL,
  `transaction_active_status_id` int(2) NOT NULL,
  `transaction_contract_file` varchar(100) NOT NULL,
  `transaction_contract_verif_id` int(2) NOT NULL,
  `transaction_contract_verif_by` int(5) NOT NULL,
  `transaction_customer_id` int(5) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `renewal_capability` varchar(5) NOT NULL,
  `modified_by` int(5) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transactions`
--

INSERT INTO `tbl_transactions` (`transaction_id`, `transaction_no`, `transaction_tenant_id`, `transaction_rent_from`, `transaction_rent_to`, `transaction_rent_total_month`, `transaction_type_of_business`, `transaction_company_name`, `transaction_note`, `transaction_rent_type_id`, `transaction_active_status_id`, `transaction_contract_file`, `transaction_contract_verif_id`, `transaction_contract_verif_by`, `transaction_customer_id`, `transaction_date`, `renewal_capability`, `modified_by`, `modified_date`) VALUES
(1, 'TRX-110623.001', 1, '2023-06-11 00:00:00', '2023-12-25 00:00:00', 6, 'Makanan dan Minuman', 'Enak Enak', 'Turunkan harga sewa', 1, 1, '', 1, 0, 2, '2023-06-11 22:32:54', 'Yes', 2, '2023-06-11 22:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(5) NOT NULL,
  `user_identity_no` varchar(25) NOT NULL,
  `user_taxpayer_id_no` varchar(25) NOT NULL,
  `user_business_license_no` varchar(25) NOT NULL,
  `user_fullname` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone_no` varchar(15) NOT NULL,
  `user_password` varchar(75) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_photo` varchar(255) NOT NULL,
  `user_type_id` int(2) NOT NULL,
  `user_registration_date` datetime NOT NULL,
  `active_status` int(2) NOT NULL,
  `modified_by` int(3) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_identity_no`, `user_taxpayer_id_no`, `user_business_license_no`, `user_fullname`, `user_email`, `user_phone_no`, `user_password`, `user_address`, `user_photo`, `user_type_id`, `user_registration_date`, `active_status`, `modified_by`, `modified_date`) VALUES
(2, '19215276', '3222111444', '', 'Ardiansyah', 'ardiansyah@gmail.com', '0813 6776 8554', 'b623a7cebe5be1abc1409e528f6b4451', 'Jl. Cengkareng Kec. Cengkareng', '', 5, '2023-06-11 15:33:48', 1, 1, '2023-06-11 15:33:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account_types`
--
ALTER TABLE `tbl_account_types`
  ADD PRIMARY KEY (`account_type_id`);

--
-- Indexes for table `tbl_admins`
--
ALTER TABLE `tbl_admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_employee_no` (`admin_employee_no`);

--
-- Indexes for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  ADD PRIMARY KEY (`method_id`);

--
-- Indexes for table `tbl_renewal_transactions`
--
ALTER TABLE `tbl_renewal_transactions`
  ADD PRIMARY KEY (`renewal_id`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `tbl_tenants`
--
ALTER TABLE `tbl_tenants`
  ADD PRIMARY KEY (`tenant_id`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_identity_no` (`user_identity_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account_types`
--
ALTER TABLE `tbl_account_types`
  MODIFY `account_type_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_admins`
--
ALTER TABLE `tbl_admins`
  MODIFY `admin_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  MODIFY `payment_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  MODIFY `method_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_renewal_transactions`
--
ALTER TABLE `tbl_renewal_transactions`
  MODIFY `renewal_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `status_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_tenants`
--
ALTER TABLE `tbl_tenants`
  MODIFY `tenant_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `transaction_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
