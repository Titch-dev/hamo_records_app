CREATE DATABASE hamo_records_db;

USE hamo_records_db;

CREATE TABLE IF NOT EXISTS hamo_wash_cycle2(
    id INTEGER NOT NULL AUTO_INCREMENT,
    date_added TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    hamo_machine_id VARCHAR(12) NOT NULL default "",
    hamo_stage_one_status_id INTEGER(11) default NULL,
    hamo_stage_two_status_id INTEGER(11) default NULL,
    calibration_expiry_date DATE default NULL,
    daily_test_confirmation ENUM('Yes','No') default NULL,
    wash_type ENUM('Full Wash','Rinse Wash') default NULL,
    load_type_id INTEGER(11) default NULL,
    full_wash_chemical_list VARCHAR(255) default NULL,
    rinse_wash_tubing_list VARCHAR(255) default NULL,
    pre_wash_passed ENUM('Yes','No') default NULL,
    caustic_wash_passed ENUM('Yes','No') default NULL,
    acid_wash_passed ENUM('Yes','No') default NULL,
    final_rinse_passed ENUM('Yes','No') default NULL,
    drying_stage_passed ENUM('Yes','No') default NULL,
    wash_expiration_date TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    comments VARCHAR(500) NOT NULL default "",
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS hamo_stage_one_status(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status ENUM('Pending','Passed','Failed') NOT NULL default 'Pending',
    failure_message VARCHAR(255) NOT NULL default "",
    datetime_processed TIMESTAMP NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hamo_stage_two_status(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status ENUM('Pending','Passed','Failed') NOT NULL default 'Pending',
    failure_message VARCHAR(255) NOT NULL default "",
    datetime_added TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    datetime_checked TIMESTAMP NOT NULL default CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS hamo_stage_three_status(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status ENUM('Pending','Passed','Failed') NOT NULL default 'Pending',
    failure_message VARCHAR(255) NOT NULL default ""
);

CREATE TABLE IF NOT EXISTS load_type(
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    load_id VARCHAR(255) NOT NULL default "",
    vessel_id VARCHAR(255) NOT NULL default "",
    manifold_id VARCHAR(255) NOT NULL default ""
);


ALTER TABLE hamo_wash_cycle ADD is_hidden INTEGER(11) default 0;

ALTER TABLE hamo_wash_cycle DROP load_type_id;

ALTER TABLE hamo_wash_cycle ADD load_type VARCHAR(255) NOT NULL default "";

ALTER TABLE hamo_wash_cycle ADD cycle_result ENUM('Pass','Fail','Pending') NOT NULL default 'Pending';

ALTER TABLE hamo_wash_cycle DROP comments;

ALTER TABLE hamo_wash_cycle ADD comments VARCHAR(500) NOT NULL default "N/A";

ALTER TABLE hamo_wash_cycle change `pre_wash_passed` `pre_wash_passed` ENUM('Yes','No','N/A') default 'N/A';

ALTER TABLE hamo_wash_cycle change `caustic_wash_passed` `caustic_wash_passed` ENUM('Yes','No','N/A') default 'N/A';

ALTER TABLE hamo_wash_cycle change `acid_wash_passed` `acid_wash_passed` ENUM('Yes','No','N/A') default 'N/A';