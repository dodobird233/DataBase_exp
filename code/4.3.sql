   -- 3) 查询购买了所有畅销理财产品的客户
--   请用一条SQL语句实现该查询：
select distinct A.pro_c_id as pro_c_id from property as A where not exists(
   select * from(
      select pro_pif_id from property
      where pro_type=1
      group by pro_pif_id
      having count(pro_c_id)>2
   )as B
   where not exists(
      select * from property as C
      where C.pro_type=1 and A.pro_c_id=C.pro_c_id and B.pro_pif_id=C.pro_pif_id
   )
)
order by A.pro_c_id;





/*  end  of  your co
de  */