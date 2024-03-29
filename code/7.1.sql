use fib;

-- 创建存储过程`sp_fibonacci(in m int)`，向表fibonacci插入斐波拉契数列的前m项，及其对应的斐波拉契数。fibonacci表初始值为一张空表。请保证你的存储过程可以多次运行而不出错。

drop procedure if exists sp_fibonacci;
delimiter $$
create procedure sp_fibonacci(in m int)
begin
######## 请补充代码完成存储过程体 ########
    declare i int;
    declare a int;
    declare b int;
    declare c int;
    set i=1;
    set a=0;
    set b=1;
    set c=1;
    insert into fibonacci values(0,0);
    while i<m do
        insert into fibonacci values(i,c);
        set c=a+b;
        set a=b;
        set b=c;
        set i=i+1;
    end while;
end $$

delimiter ;

 
