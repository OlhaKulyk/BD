
insert into disease (disaese_name, hospital_period, symptoms) values ("бронхіт", 14, "кашель, часто підвищена температура, відчуття саднення за грудиною, погіршенням загального самопочуття"),
("екзема",null, "набряклість та почервоніння шкіри у області ураження, поява дрібних пухирців"),
("остеоартроз",null, "болі в уражених суглобах;
скутість в ураженому суглобі після спокою, не перевищує 30 хв;
різний ступінь порушення рухливості суглоба при виконанні окремих рухів");

alter table insurance drop end_action_time;
alter table insurance change column begin_action_time action_time int(2) unsigned not null;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/insurance.txt' into table insurance FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/patient.txt' into table patient FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/doctor.txt' into table doctor FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/appointment.txt' into table appointment FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/hospital.txt' into table hospital FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/phar.txt' into table pharmaceutical_company FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pharmacy.txt' into table pharmacy FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/medicine.txt' into table medicine FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/recipe.txt' into table recipe FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';