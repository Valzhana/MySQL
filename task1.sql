-- 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней и часов.
--    Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
create function formatting(seconds INT)
returns text
deterministic
begin
	declare days int default 0;
    declare hours int default 0;
    declare minutes int default 0;
    declare str text default ' ';
    
    while seconds >= 60 do
		set days = seconds / 3600 / 24;
        set hours = (seconds / 3600) % 24;
        set minutes = (seconds / 60) % 60;
        set seconds = seconds % 60;
		set str = concat(str, days, hours, minutes, seconds);
    end while;
    return str;
    
end $$
DELIMITER ;
SELECT formatting(123456)