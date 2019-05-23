use prescription_catalog;

-- переіменювання поля
alter table medicine change column components medicine_name text;

-- создамо 2 допоміжні таблиці для демонстрації операції
create table medicine1 select * from medicine where way_to_use = "внутрішньо";
select * from medicine1;
create table medicine2 select * from medicine where way_to_use = "зовнішньо";
select * from medicine2;

-- об'єднання
select * from medicine1 union select * from medicine2;

-- перетин
select * from medicine1 where way_to_use in (select way_to_use from medicine2);

-- різниця
select * from medicine1 where way_to_use not in (select way_to_use from medicine2);

-- декартів добуток
select * from medicine1, medicine2;

drop table medicine1, medicine2;