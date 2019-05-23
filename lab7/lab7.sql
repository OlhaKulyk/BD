use prescription_catalog;


-- натуральне з'єднання(доктор та дата та час його прийомів)
select doctor.last_name, appointment.appointment_data from doctor inner join
appointment on doctor.doctor_id = appointment.doctor_id;

-- умовне з'єднання(пацієнти з певим захворванням, що підуть до лікаря Глинка)
select disease.disaese_name, patient.first_name, doctor.last_name from appointment
inner join disease on disease.disease_id = appointment.disease_id inner join patient on 
patient.patient_id = appointment.patient_id inner join doctor on doctor.doctor_id = appointment.doctor_id
where doctor.last_name = "Глинка";

-- умовне з'єднання з підзапитом(які препарати наявні в аптека, що працюють з 9 та раніше)
select medicine.medicine_name, pharmacy.pharmacy_id from pharmacy inner join medicine
on medicine.produce_company = pharmacy.pharmacy_id where medicine.produce_company in (select pharmacy.pharmacy_id from pharmacy where begin_working_time <= "09:00:00");

insert into doctor values (4, "Ростислав", "Ростиславович", "Василик","педіатр", "лікар 2 категорії", 10);

-- доктори, що не мають прийомів
select doctor.last_name from doctor left join appointment on appointment.doctor_id = doctor.doctor_id where appointment.doctor_id is null; 

