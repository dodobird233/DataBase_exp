  -- 2) 投资积极且偏好理财类产品的客户
--   请用一条SQL语句实现该查询：
select pro_c_id from(
  select pro_c_id,count(pro_pif_id) as cnt1
  from property
  where pro_type=1
  group by pro_c_id
  having count(pro_pif_id)>=3
)as A
join(
  select pro_c_id,count(pro_pif_id) as cnt2
  from property
  where pro_type=3
  group by pro_c_id
)as B
using(pro_c_id)
where cnt1>cnt2





/*  end  of  your code  */