use prescription_catalog;

-- середня ціна на препарати внутрішнього застосування
select avg(price) from medicine where way_to_use = "внутрішньо";

-- мінімальна ціна кожного препарата
select min(price), medicine_name from medicine group by price;
