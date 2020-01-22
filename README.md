# hamo_records
Hamo record and audit trail app


## Model definitions

### hamo_wash_cycle:
id primary key autoincrement not null,
date_added datetime not null default now(),
hamo_machine_id varchar(12) not null default "", 
hamo_stage_one_status_id = int(11) default null,
hamo_stage_two_status_id = int(11) default null,
hamo_stage_three_status_id = int(11) default null,
calibration_expiry_date date default null,
daily_test_confirmation enum('yes'/'no') default null,
wash_type enum('full wash','rinse wash') default null,
load_type_id int(11) default null,
full_wash_chemical_list = text() default null,
rinse_wash_tubing_list = text() default null,
prewash_passed enum('yes','no') default null,
caustic_wash_passed enum('yes','no') default null,
acid_wash_passed enum('yes','no') default null,
final_rinse_passed enum('yes','no') default null,
drying_stage_passed enum('yes','no') default null,
wash_expiration_date datetime not null default now()+10days
comments text() not null default "",


### hamo_stage_one_status (hamo selection)
id primary key autoincrement not null,
status enum('pending','passed','failed') not null default 'pending'
failure_message varchar(255) not null default "",
datetime_processed datetime not null default now(),
-- # user 

### hamo_stage_two_status (cycle selection)
id primary key autoincrement not null,
status enum('pending','passed','failed') not null default 'pending',
failure_message varchar(255) not null default "",
datetime_added datetime not null default now(),
datetime_checked datetime not null default now(),
-- # user_added 
-- # user_checked 

### load_type:
id primary key autoincrement not null
name varchar(255) not null default "",
vessel_list = text() not null default "",
manifold_list = text() not null default "",

insert into load_type('name,'vessel_list','manifold_list')
values 
('SS100','SS6,SS7,SS8','MAN1,MAN2,MAN3'),
('SS200','SS6,SS7,SS8,SS9','MAN4,MAN5,MAN6');


### hamo_stage_three_status (post-wash checks)
id primary key autoincrement not null,
datetime_added datetime not null default now(),
-- # user_added 
status enum('pending','passed','failed') not null default 'pending',
failure_message varchar(255) not null default "", 


### For vessel and manifold - load type many to many relationship

vessels
id
name

load_type_vessel_map
id
load_type_id
vessel_id

manifolds
id
name

load_type_manifold_map
id
load_type_id
manifold_id

