use prescription_catalog;

explain select disease.disaese_name, patient.first_name, doctor.last_name from appointment
inner join disease on disease.disease_id = appointment.disease_id inner join patient on 
patient.patient_id = appointment.patient_id inner join doctor on doctor.doctor_id = appointment.doctor_id
where doctor.last_name = "Глинка";

explain select straight_join medicine.medicine_name, pharmacy.pharmacy_id from pharmacy inner join medicine
on medicine.produce_company = pharmacy.pharmacy_id where medicine.produce_company 
in (select pharmacy.pharmacy_id from pharmacy where begin_working_time <= "09:00:00");