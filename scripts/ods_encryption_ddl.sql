
/**   ODS Encryption project MySQL table requirements

https://bioiqjira.atlassian.net/browse/REPORTS-436

 https://github.com/BioIQ/ods_core_etl_helper


*/


drop table decrypt_job_logs;

CREATE TABLE `decrypt_job_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) DEFAULT NULL,
  `job_successful` tinyint(1) DEFAULT NULL,
  `failure_reason` text,
  `job_start` datetime DEFAULT NULL,
  `job_end` datetime DEFAULT NULL,
  `records_decrypted` int(11) DEFAULT NULL,
  `records_skipped` int(11) DEFAULT NULL,
  `records_error` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


drop table decrypt_error_logs;


CREATE TABLE `decrypt_error_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `decrypt_job_log_id` int(11) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `record_key` int(11) DEFAULT NULL,
  `error_reason` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



drop table stage_dim_user;

CREATE TABLE `stage_dim_user` (
  `user_key` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_program` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `bill_phone` varchar(16) DEFAULT NULL,
  `ship_phone` varchar(16) DEFAULT NULL,
  `created_on_date_key` int(11) DEFAULT NULL,
  `created_on_time_key` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `confirmed_on_date_key` int(11) DEFAULT NULL,
  `confirmed_on_time_key` int(11) DEFAULT NULL,
  `confirmed_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `note` text,
  `born_on` date DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `last_login_at_date_key` int(11) DEFAULT NULL,
  `last_login_at_time_key` int(11) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(16) DEFAULT NULL,
  `prospect_id` int(11) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `activation_token` varchar(255) DEFAULT NULL,
  `encrypted_first_name` varchar(255) DEFAULT NULL,
  `core_encrypted_first_name` text,
  `encrypted_last_name` varchar(255) DEFAULT NULL,
  `core_encrypted_last_name` text,
  `encrypted_external_pin` varchar(255) DEFAULT NULL,
  `core_encrypted_external_pin` text,
  `encrypted_ssn` varchar(255) DEFAULT NULL,
  `core_encrypted_ssn` text,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `access` datetime DEFAULT NULL,
  `bill_addr1` varchar(512) DEFAULT NULL,
  `core_bill_addr1` varchar(512) DEFAULT NULL,
  `bill_addr2` varchar(512) DEFAULT NULL,
  `core_bill_addr2` varchar(512) DEFAULT NULL,
  `bill_city` varchar(255) DEFAULT NULL,
  `bill_state` varchar(255) DEFAULT NULL,
  `bill_zip` varchar(255) DEFAULT NULL,
  `bill_country` varchar(255) DEFAULT NULL,
  `bill_first_name` varchar(255) DEFAULT NULL,
  `core_bill_first_name` varchar(255) DEFAULT NULL,
  `bill_last_name` varchar(255) DEFAULT NULL,
  `core_bill_last_name` varchar(255) DEFAULT NULL,
  `cc_type` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `newsletter` tinyint(4) DEFAULT NULL,
  `ship_addr1` varchar(512) DEFAULT NULL,
  `core_ship_addr1` text,
  `ship_addr2` varchar(512) DEFAULT NULL,
  `core_ship_addr2` text,
  `ship_city` varchar(255) DEFAULT NULL,
  `ship_state` varchar(255) DEFAULT NULL,
  `ship_zip` varchar(255) DEFAULT NULL,
  `ship_country` varchar(255) DEFAULT NULL,
  `signup_key` varchar(255) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `middle_initial` char(1) DEFAULT NULL,
  `work_location` varchar(100) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `labor_group_code` varchar(10) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `effective_at` datetime DEFAULT NULL,
  `term_at` datetime DEFAULT NULL,
  `is_current` tinyint(4) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `current_encrypted_first_name` varchar(512) DEFAULT NULL,
  `core_current_encrypted_first_name` varchar(512) DEFAULT NULL,
  `current_encrypted_last_name` varchar(512) DEFAULT NULL,
  `core_current_encrypted_last_name` varchar(512) DEFAULT NULL,
  `physician_id` int(11) DEFAULT NULL,
  `restore_updated` varchar(1) DEFAULT NULL,
  `restore_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_key`),
  KEY `dim_user_entity_id_Idx` (`entity_id`),
  KEY `dim_user_scd2_Idx` (`user_id`,`effective_at`,`term_at`,`user_key`),
  KEY `dim_user_user_id_Idx` (`user_id`),
  KEY `dim_user_username_Idx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


drop table stage_dim_event;


CREATE TABLE `stage_dim_event` (
  `event_key` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `schedulable_type` varchar(255) DEFAULT NULL,
  `schedulable_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `starts_at_date_key` int(11) DEFAULT NULL,
  `starts_at_time_key` int(11) DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `ends_at_date_key` int(11) DEFAULT NULL,
  `ends_at_time_key` int(11) DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `max_attendees` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `location_address_id` int(11) DEFAULT NULL,
  `address_owner_type` varchar(128) DEFAULT NULL,
  `address_owner_id` int(11) DEFAULT NULL,
  `address_kind` varchar(16) DEFAULT NULL,
  `address_firm` varchar(38) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip5` varchar(5) DEFAULT NULL,
  `zip4` varchar(4) DEFAULT NULL,
  `primary` tinyint(4) DEFAULT NULL,
  `encrypted_street` varchar(512) DEFAULT NULL,
  `core_encrypted_street` varchar(512) DEFAULT NULL,
  `encrypted_suite` varchar(512) DEFAULT NULL,
  `core_encrypted_suite` varchar(512) DEFAULT NULL,
  `street` varchar(512) DEFAULT NULL,
  `core_street` varchar(512) DEFAULT NULL,
  `suite` varchar(512) DEFAULT NULL,
  `core_suite` varchar(512) DEFAULT NULL,
  `lat` decimal(15,10) DEFAULT NULL,
  `long` decimal(15,10) DEFAULT NULL,
  `location_code` varchar(255) DEFAULT NULL,
  `event_created_at` datetime DEFAULT NULL,
  `event_updated_at` datetime DEFAULT NULL,
  `optional` tinyint(4) DEFAULT NULL,
  `fasting_required` tinyint(4) DEFAULT NULL,
  `registration_closes_at_date_key` int(11) DEFAULT NULL,
  `registration_closes_at_time_key` int(11) DEFAULT NULL,
  `registration_closes_at` datetime DEFAULT NULL,
  `alert_pct` int(11) DEFAULT NULL,
  `nurses` int(11) DEFAULT NULL,
  `walk_in` tinyint(4) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `requires_consent_form` tinyint(4) DEFAULT NULL,
  `billing_only` tinyint(4) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `registration_closure_offset` int(11) DEFAULT NULL,
  `secondary_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_key`),
  KEY `dim_event_event_id_Idx` (`event_id`),
  KEY `dim_event_code_Idx` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=30323512 DEFAULT CHARSET=latin1;



drop table stage_dim_program
;

CREATE TABLE `stage_dim_program` (
  `program_key` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `program_name` varchar(255) DEFAULT NULL,
  `program_code` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `is_fulfilled` tinyint(4) DEFAULT NULL,
  `enrollment_policy` int(11) DEFAULT NULL,
  `max_enrollments` int(11) DEFAULT NULL,
  `program_description` varchar(1000) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `health_coaching` tinyint(4) DEFAULT NULL,
  `allows_phone_enrollment` tinyint(4) DEFAULT NULL,
  `created_at_date_key` int(11) DEFAULT NULL,
  `created_at_time_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `closes_at_date_key` int(11) DEFAULT NULL,
  `closes_at_time_key` int(11) DEFAULT NULL,
  `closes_at` datetime DEFAULT NULL,
  `auto_export` tinyint(4) DEFAULT NULL,
  `opens_at_date_key` int(11) DEFAULT NULL,
  `opens_at_time_key` int(11) DEFAULT NULL,
  `opens_at` datetime DEFAULT NULL,
  `opened_at_date_key` int(11) DEFAULT NULL,
  `opened_at_time_key` int(11) DEFAULT NULL,
  `opened_at` datetime DEFAULT NULL,
  `closed_at_date_key` int(11) DEFAULT NULL,
  `closed_at_time_key` int(11) DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `program_status` varchar(255) DEFAULT NULL,
  `closed_message` varchar(255) DEFAULT NULL,
  `spouse_auto_enroll` tinyint(4) DEFAULT NULL,
  `spouse_email` tinyint(3) unsigned DEFAULT NULL,
  `alternate_inventory_id` int(10) unsigned DEFAULT NULL,
  `dependent_eligibility` tinyint(4) DEFAULT NULL,
  `requires_unique_demographics` tinyint(4) DEFAULT NULL,
  `default_alert_pct` int(11) DEFAULT NULL,
  `total_eligible` int(11) DEFAULT NULL,
  `staff_notes` text,
  `updated_at` datetime DEFAULT NULL,
  `closed_for_reorders` tinyint(4) DEFAULT NULL,
  `external_client_name` varchar(255) DEFAULT NULL,
  `report_at_date_key` int(11) DEFAULT NULL,
  `report_at_time_key` int(11) DEFAULT NULL,
  `report_at` datetime DEFAULT NULL,
  `spouses` int(11) DEFAULT NULL,
  `data_integration` tinyint(4) DEFAULT NULL,
  `di_company` varchar(255) DEFAULT NULL,
  `di_baa` varchar(255) DEFAULT NULL,
  `di_file_format_sent` tinyint(4) DEFAULT NULL,
  `white_list_date` datetime DEFAULT NULL,
  `signup_steps` int(11) DEFAULT NULL,
  `hr_contact_numbers` varchar(255) DEFAULT NULL,
  `account_assignment_strategy_id` int(11) DEFAULT NULL,
  `mobile_enabled` tinyint(4) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_address_firm` varchar(38) DEFAULT NULL,
  `shipping_address_city` varchar(45) DEFAULT NULL,
  `shipping_address_state` varchar(2) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_zip5` varchar(7) DEFAULT NULL,
  `shipping_address_zip4` varchar(4) DEFAULT NULL,
  `shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `core_shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `core_shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `shipping_address_lat` decimal(15,10) DEFAULT NULL,
  `shipping_address_lng` decimal(15,10) DEFAULT NULL,
  `line_of_business` int(11) DEFAULT NULL,
  PRIMARY KEY (`program_key`),
  KEY `dim_program_program_code_Idx` (`program_code`),
  KEY `dim_program_program_id_Idx` (`program_id`),
  KEY `dim_program_program_name_Idx` (`program_name`)
) ENGINE=InnoDB AUTO_INCREMENT=82682 DEFAULT CHARSET=latin1;



drop table stage_two_physician_addresses
;

CREATE TABLE `stage_two_physician_addresses` (
  `id` int(11) NOT NULL,
  `owner_type` varchar(128) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `kind` varchar(16) DEFAULT NULL,
  `firm` varchar(38) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip5` varchar(5) DEFAULT NULL,
  `zip4` varchar(4) DEFAULT NULL,
  `primary` tinyint(4) DEFAULT '1',
  `encrypted_street` varchar(512) DEFAULT NULL,
  `core_encrypted_street` varchar(512) DEFAULT NULL,
  `encrypted_suite` varchar(512) DEFAULT NULL,
  `core_encrypted_suite` varchar(512) DEFAULT NULL,
  `lat` decimal(15,10) DEFAULT NULL,
  `lng` decimal(15,10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addresses_on_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


drop table stage_dim_insurance_policy
;

CREATE TABLE `stage_dim_insurance_policy` (
  `insurance_policy_key` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_policy_id` int(11) NOT NULL,
  `insurance_policy_number` varchar(255) DEFAULT NULL,
  `group_number` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `insurance_company_id` int(11) DEFAULT NULL,
  `insurance_enrollment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_address_firm` varchar(38) DEFAULT NULL,
  `shipping_address_city` varchar(45) DEFAULT NULL,
  `shipping_address_state` varchar(2) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_zip5` varchar(7) DEFAULT NULL,
  `shipping_address_zip4` varchar(4) DEFAULT NULL,
  `shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `core_shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `core_shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `shipping_address_lat` decimal(15,10) DEFAULT NULL,
  `shipping_address_lng` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`insurance_policy_key`),
  KEY `dim_insurance_policy_group_number_Idx` (`group_number`),
  KEY `dim_insurance_policy_insurance_company_id_Idx` (`insurance_company_id`),
  KEY `dim_insurance_policy_insurance_policy_id_Idx` (`insurance_policy_id`),
  KEY `dim_insurance_policy_insurance_policy_number_Idx` (`insurance_policy_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2403472 DEFAULT CHARSET=latin1;


drop table stage_dim_entity;

CREATE TABLE `stage_dim_entity` (
  `entity_key` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `partner_name` varchar(255) DEFAULT NULL,
  `allows_public_signup` tinyint(4) DEFAULT NULL,
  `store_access` tinyint(4) DEFAULT NULL,
  `mobile_enabled` tinyint(4) DEFAULT NULL,
  `flu_only` tinyint(4) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_address_firm` varchar(38) DEFAULT NULL,
  `shipping_address_city` varchar(45) DEFAULT NULL,
  `shipping_address_state` varchar(2) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_zip5` varchar(7) DEFAULT NULL,
  `shipping_address_zip4` varchar(4) DEFAULT NULL,
  `shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `core_shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `core_shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `shipping_address_lat` decimal(15,10) DEFAULT NULL,
  `shipping_address_lng` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`entity_key`),
  KEY `dim_entity_entity_id_idx` (`entity_id`),
  KEY `dim_entity_entity_name_idx` (`entity_name`),
  KEY `dim_entity_entity_partner_name_idx` (`partner_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1362 DEFAULT CHARSET=latin1;



drop table stage_dim_lab;
 
desc stage_dim_lab;

CREATE TABLE `stage_dim_lab` (
  `lab_key` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `lab_name` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `lab_code_name` varchar(24) DEFAULT NULL,
  `clia_id` varchar(255) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `lab_phone` varchar(100) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `national_provider_identifier` int(11) DEFAULT NULL,
  `tax_id` varchar(255) DEFAULT NULL,
  `allow_test_notes` tinyint(4) DEFAULT NULL,
  `requires_participant_signature` tinyint(4) DEFAULT NULL,
  `allows_participant_registration` tinyint(4) DEFAULT NULL,
  `allows_scheduling` tinyint(4) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `billing_address_firm` varchar(38) DEFAULT NULL,
  `billing_address_city` varchar(45) DEFAULT NULL,
  `billing_address_state` varchar(2) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `billing_address_zip5` varchar(7) DEFAULT NULL,
  `billing_address_zip4` varchar(4) DEFAULT NULL,
  `billing_address_encrypted_street` varchar(512) DEFAULT NULL,
    `core_billing_address_encrypted_street` varchar(512) DEFAULT NULL,
  `billing_address_encrypted_suite` varchar(512) DEFAULT NULL,
    `core_billing_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `billing_address_lat` decimal(15,10) DEFAULT NULL,
  `billing_address_lng` decimal(15,10) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_address_firm` varchar(38) DEFAULT NULL,
  `shipping_address_city` varchar(45) DEFAULT NULL,
  `shipping_address_state` varchar(2) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_zip5` varchar(7) DEFAULT NULL,
  `shipping_address_zip4` varchar(4) DEFAULT NULL,
  `shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
    `core_shipping_address_encrypted_street` varchar(512) DEFAULT NULL,
  `shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
    `core_shipping_address_encrypted_suite` varchar(512) DEFAULT NULL,
  `shipping_address_lat` decimal(15,10) DEFAULT NULL,
  `shipping_address_lng` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`lab_key`),
  KEY `dim_lab_lab_code_name_Idx` (`lab_code_name`),
  KEY `dim_lab_lab_id_Idx` (`lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;


drop table stage_dim_patient_service_center;
 

CREATE TABLE `stage_dim_patient_service_center` (
  `patient_service_center_key` int(11) NOT NULL AUTO_INCREMENT,
  `patient_service_center_id` int(11) NOT NULL,
  `psc_name` varchar(255) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `psc_phone` varchar(255) DEFAULT NULL,
  `psc_fax` varchar(255) DEFAULT NULL,
  `lab_key` int(11) NOT NULL,
  `psc_address_id` int(11) DEFAULT NULL,
  `address_firm` varchar(38) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip5` varchar(7) DEFAULT NULL,
  `zip4` varchar(4) DEFAULT NULL,
  `encrypted_street` varchar(512) DEFAULT NULL,
  `core_encrypted_street` varchar(512) DEFAULT NULL,
  `encrypted_suite` varchar(512) DEFAULT NULL,
  `core_encrypted_suite` varchar(512) DEFAULT NULL,
  `lat` decimal(15,10) DEFAULT NULL,
  `lng` decimal(15,10) DEFAULT NULL,
  `address_created_at` datetime DEFAULT NULL,
  `address_updated_at` datetime DEFAULT NULL,
  `collects_vitals` tinyint(4) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `national_provider_identifier` varchar(10) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `location_code` varchar(255) DEFAULT NULL,
  `location_created_at` datetime DEFAULT NULL,
  `location_updated_at` datetime DEFAULT NULL,
  `location_firm` varchar(38) DEFAULT NULL,
  `location_city` varchar(45) DEFAULT NULL,
  `location_state` varchar(2) DEFAULT NULL,
  `location_country` varchar(255) DEFAULT NULL,
  `location_zip5` varchar(7) DEFAULT NULL,
  `location_zip4` varchar(4) DEFAULT NULL,
  `location_encrypted_street` varchar(512) DEFAULT NULL,
  `core_location_encrypted_street` varchar(512) DEFAULT NULL,
  `location_encrypted_suite` varchar(512) DEFAULT NULL,
  `core_location_encrypted_suite` varchar(512) DEFAULT NULL,
  `location_lat` decimal(15,10) DEFAULT NULL,
  `location_lng` decimal(15,10) DEFAULT NULL,
  `location_address_created_at` datetime DEFAULT NULL,
  `location_address_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_service_center_key`)
) ENGINE=InnoDB AUTO_INCREMENT=60132 DEFAULT CHARSET=latin1;



drop table stage_dim_event_reservation;

CREATE TABLE `stage_dim_event_reservation` (
  `event_reservation_key` int(11) NOT NULL AUTO_INCREMENT,
  `event_reservation_id` int(11) DEFAULT NULL,
  `event_key` int(11) DEFAULT NULL,
  `user_key` int(11) DEFAULT NULL,
  `program_key` int(11) DEFAULT NULL,
  `signature_user_id` int(11) DEFAULT NULL,
  `signature_date` datetime DEFAULT NULL,
  `core_signature_text` varchar(255) DEFAULT NULL,
  `signature_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_reservation_key`),
  KEY `dim_event_reservation_event_reservation_id_Idx` (`event_reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18809542 DEFAULT CHARSET=latin1;

