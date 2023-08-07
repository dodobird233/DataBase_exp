-- 19) 以日历表格式列出2022年2月每周每日基金购买总金额，输出格式如下：
-- week_of_trading Monday Tuesday Wednesday Thursday Friday
--               1
--               2    
--               3
--               4
--   请用一条SQL语句实现该查询：
select week_day-5 as week_of_trading,Mon.num as Monday,Tue.num as Tuesday,Wed.num as Wednesday,Thu.num as Thursday,Fri.num as Friday
from(
    select sum(pro_quantity*f_amount)as num,week(pro_purchase_time) as week_day
    from property join fund on pro_pif_id = f_id
    where pro_type = 3 and weekday(pro_purchase_time)=0 and pro_purchase_time between '2022-02-07' and '2022-02-28'
    group by pro_purchase_time
) as Mon
left join(
    select sum(pro_quantity*f_amount)as num,week(pro_purchase_time) as week_day
    from property join fund on pro_pif_id = f_id
    where pro_type = 3 and weekday(pro_purchase_time)=1 and pro_purchase_time between '2022-02-07' and '2022-02-28'
    group by pro_purchase_time
) as Tue using(week_day)
left join(
    select sum(pro_quantity*f_amount)as num,week(pro_purchase_time) as week_day
    from property join fund on pro_pif_id = f_id
    where pro_type = 3 and weekday(pro_purchase_time)=2 and pro_purchase_time between '2022-02-07' and '2022-02-28'
    group by pro_purchase_time
) as Wed using(week_day)
left join(
    select sum(pro_quantity*f_amount)as num,week(pro_purchase_time) as week_day
    from property join fund on pro_pif_id = f_id
    where pro_type = 3 and weekday(pro_purchase_time)=3 and pro_purchase_time between '2022-02-07' and '2022-02-28'
    group by pro_purchase_time
) as Thu using(week_day)
left join(
    select sum(pro_quantity*f_amount)as num,week(pro_purchase_time) as week_day
    from property join fund on pro_pif_id = f_id
    where pro_type = 3 and weekday(pro_purchase_time)=4 and pro_purchase_time between '2022-02-07' and '2022-02-28'
    group by pro_purchase_time
) as Fri using(week_day)




/*  end  of  your code  */