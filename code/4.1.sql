 -- 1) 查询销售总额前三的理财产品
--   请用一条SQL语句实现该查询：
select A.year as pyear, A.rk as rk, A.p_id as p_id,A.sumamount as sumamount
from(
    select year(pro_purchase_time) as year,
    rank() over(partition by year(pro_purchase_time) order by sum(pro_quantity*p_amount) desc,p_id)as rk,
    p_id,sum(pro_quantity*p_amount) as sumamount
    from property,finances_product
    where p_id=pro_pif_id and pro_type=1 and pro_purchase_time between '2010-1-1' and '2011-12-31'
    group by year(pro_purchase_time),p_id
)as A
where rk<=3;






/*  end  of  your code  */