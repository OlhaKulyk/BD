select * from medicine;
select * from pharmaceutical_company;

-- тригер, який встановлює країну-виробника "Німеччина" по замовчуваню
create trigger company_delete before delete
on pharmaceutical_company for each row 
update medicine set produce_company = 1;

delete from pharmaceutical_company where pharmaceutical_company_id = 1;

