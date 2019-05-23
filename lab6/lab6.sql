use prescription_catalog;
select * from pharmacy;

-- проекція
create view pharmacy_time as select pharmacy_id, begin_working_time, end_working_time from pharmacy;
select * from pharmacy_time;

-- селекція
select medicine_name, count(produce_company) from medicine where medicine_name like "%е%" group by(produce_company);

-- натуральне з'єднання
select doctor.last_name, appointment.appointment_data from doctor, appointment where appointment.doctor_id = doctor.doctor_id;

-- умовне з'єднання
select doctor.last_name, appointment.appointment_data from doctor, appointment where appointment.doctor_id = doctor.doctor_id
and appointment.appointment_data >= "2019-06-01";