drop database prescription_catalog;
create database prescription_catalog;
use prescription_catalog;


-- страхуваня
create table insurance(
insurance_id int(4) unsigned auto_increment,
begin_action_time date not null, 
end_action_time date not null,
insurance_company_name varchar(20) not null,
conditions text(100),
constraint insurance_pk primary key(insurance_id),
constraint action_time_ck check (begin_action_time < end_action_time)
)engine = InnoDB;

-- пацієнт
create table patient(
patient_id int(4) unsigned auto_increment,
first_name varchar(15) not null,
middle_name varchar(20),
last_name varchar(20) not null,
date_of_birth date,
insurance_policy_id int(4) unsigned not null,
constraint patient_pk primary key(patient_id),
constraint patient_policy_fk foreign key(insurance_policy_id) references insurance(insurance_id) on delete cascade on update cascade
)engine = InnoDB;

-- аптека
create table pharmacy(
pharmacy_id int(4) unsigned auto_increment,
pharmacy_address varchar(30) not null,
begin_working_time time not null,
end_working_time time not null,
constraint pharmacy_pk primary key(pharmacy_id)
)engine = InnoDB;

-- хвороба
create table disease(
disease_id int(4) unsigned auto_increment,
disaese_name varchar(20) not null,
hospital_period int(2) unsigned,
symptoms text not null,
constraint disease_pk primary key(disease_id)
)engine = InnoDB;

-- лікар 
create table doctor(
doctor_id int(4) unsigned auto_increment,
first_name varchar(15) not null,
middle_name varchar(20),
last_name varchar(20) not null,
specialization varchar(20) not null,
doctor_position varchar(20),
experience int(2) unsigned,
constraint doctor_pk primary key(doctor_id)
)engine = InnoDB;

-- фармацептична компанія
create table pharmaceutical_company(
pharmaceutical_company_id int(4) unsigned auto_increment,
country varchar(20) not null, 
city varchar(20) not null,
constraint pharmaceutical_company_pk primary key(pharmaceutical_company_id) 
)engine = InnoDB;

-- прийом
create table appointment(
appointment_id int(4) unsigned auto_increment,
doctor_id int(4) unsigned not null,
patient_id int(4) unsigned not null,
disease_id int(4) unsigned not null,
appointment_data datetime not null,
constraint appointment_pk primary key(appointment_id),
constraint doctor_fk foreign key(doctor_id) references doctor(doctor_id) on delete cascade on update cascade,
constraint patient_fk foreign key(patient_id) references patient(patient_id) on delete cascade on update cascade,
constraint disease_fk foreign key(disease_id) references disease(disease_id) on delete cascade on update cascade
)engine = InnoDB;

-- лікарня
create table hospital(
hospital_id int(4) unsigned auto_increment,
doctor_id int(4) unsigned,
appointment_id int(4) unsigned not null,
hopital_address varchar(30) not null,
hospital_awards text,
constraint hospital_pk primary key(hospital_id), 
constraint hospital_doctor_fk foreign key(doctor_id) references doctor(doctor_id) on delete cascade on update cascade,
constraint appointment_fk foreign key(appointment_id) references appointment(appointment_id) on delete cascade on update cascade
)engine = InnoDB;

-- дистриб'ютор
create table distributor(
distributor_id int(4) unsigned auto_increment,
pharmaceutical_company_id int(4) unsigned not null,
hospital_id int(4) unsigned,
earning int(12) unsigned,
working_area varchar(10), -- ?????
constraint distributor_pk primary key(distributor_id),
constraint phcompfk foreign key(pharmaceutical_company_id) references pharmaceutical_company(pharmaceutical_company_id) on delete cascade on update cascade,
constraint hospital_fk foreign key(hospital_id) references hospital(hospital_id) on delete cascade on update cascade
)engine = InnoDB;

-- ліки 
create table medicine(
medicine_id int(4) unsigned auto_increment,
way_to_use varchar(25),
components text,
produce_company int(4) unsigned,
pharmacy_id int(4) unsigned,
price int(10) unsigned,
constraint pharmacy_fk foreign key(pharmacy_id) references pharmacy(pharmacy_id) on delete cascade on update cascade,
constraint produce_company_fk foreign key(produce_company) references  pharmaceutical_company(pharmaceutical_company_id) on delete cascade on update cascade,
constraint medicine_pk primary key(medicine_id)
)engine = InnoDB;

-- рецепт
create table recipe(
recipe_id int(4) unsigned auto_increment,
appointment_id int(4) unsigned,
medicine_id int(4) unsigned,
constraint appointment_recipe_fk foreign key(appointment_id) references appointment(appointment_id) on delete cascade on update cascade,
constraint medicine_fk foreign key(medicine_id) references medicine(medicine_id) on delete cascade on update cascade,
constraint recipe_pk primary key(recipe_id)
)engine = InnoDB;