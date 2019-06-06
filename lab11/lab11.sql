-- початок транзакції
start transaction;

-- невдала транзакція
insert into disease values (6, "грип", 14, "температура,кашель");
insert into disease values (2, "кір", 30, "температура, сип");
rollback;

-- початок транзакції
start transaction;

-- вдала транзакція
insert into disease values (6, "грип", 14, "температура,кашель");
insert into disease values (5, "кір", 30, "температура, сип");
rollback;

select * from disease;

delete from disease where disease_id > 3;