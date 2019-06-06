use prescription_catalog;
insert into medicine values (7, "внутрішньо", "Дефлю", 1, 1, 100);
select min(price), medicine_name from medicine group by medicine_name;
select * from medicine;
describe medicine;

DELIMITER $$
create function min_price(preparat text) 
returns int deterministic
begin
declare min_pr int;
select min(price) into min_pr from medicine where medicine_name = preparat;
return min_pr;
end $$
DELIMITER ;

select min_price("Дефлю") from medicine limit 1;
select * from doctor;
select * from appointment;
select appointment_data from appointment inner join doctor on appointment.doctor_id =
doctor.doctor_id where doctor.last_name = "Глинка";
describe doctor;

delimiter $$
create procedure searchbyname(in doc_last_name varchar(20))
begin
select appointment_data from appointment inner join doctor on appointment.doctor_id =
doctor.doctor_id where doctor.last_name = doc_last_name;
end$$ 
delimiter ;

call searchbyname("Глинка");


