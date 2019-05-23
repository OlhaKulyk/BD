
-- группування (препаради на яких кількість рецептів >= 1 та не є зовнішнього способу застосування)
select count(recipe.medicine_id) as med_quality, medicine.medicine_name from medicine natural join recipe
where medicine.way_to_use <> "зовнішньо" group by recipe.medicine_id having med_quality >=1;

-- запит із роллапом
select count(produce_company), medicine_name, sum(price) from medicine group by medicine_name with rollup;