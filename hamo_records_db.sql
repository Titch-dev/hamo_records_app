CREATE DATABASE hamo_records_db;

USE hamo_records_db;

CREATE TABLE IF NOT EXISTS hamo_wash_cycle(
  id INTEGER NOT NULL AUTO_INCREMENT,
  date_added TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
  hamo_machine_id VARCHAR(12) NOT NULL default "",
  calibration_expiry_date DATE default NULL,
  daily_test_confirmation ENUM('Yes', 'No') default NULL,
  wash_type ENUM('Full Wash', 'Rinse Wash') default NULL,
  load_type VARCHAR(255) NOT NULL default "",
  full_wash_chemical_list VARCHAR(255) default "N/A",
  rinse_wash_tubing_list VARCHAR(255) default "N/A",
  pre_wash_passed ENUM('Yes', 'No', 'N/A') default 'N/A',
  caustic_wash_passed ENUM('Yes', 'No', 'N/A') default 'N/A',
  acid_wash_passed ENUM('Yes', 'No', 'N/A') default 'N/A',
  final_rinse_passed ENUM('Yes', 'No') default NULL,
  drying_stage_passed ENUM('Yes', 'No') default NULL,
  comments VARCHAR(500) NOT NULL default "N/A",
  cycle_result ENUM('Pass', 'Fail', 'Pending') NOT NULL default 'Pending',
  wash_expiration_date TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
  hamo_stage_one_status_id INTEGER(11) default NULL,
  hamo_stage_two_status_id INTEGER(11) default NULL,
  hamo_stage_three_status_id INTEGER(11) default NULL,
  is_hidden INTEGER(11) default 0,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
