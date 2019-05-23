use prescription_catalog;

-- видалемо поле city у таблиці distributor
alter table pharmaceutical_company drop city;

-- видалемо поле working_area у таблиці distributor
alter table distributor drop working_area;

-- поставимо значення not null у атрибутах таблиці medicine
alter table medicine modify way_to_use varchar(25) not null;
alter table medicine modify components text not null;
alter table medicine modify produce_company int(4) unsigned not null;
alter table medicine modify pharmacy_id int(4) unsigned not null;
alter table medicine modify pharmacy_id int(4) unsigned not null;
alter table medicine modify price int(10) unsigned not null;

-- модифікація таблиці hospital
alter table hospital drop FOREIGN KEY hospital_doctor_fk;
alter table hospital drop doctor_id;







