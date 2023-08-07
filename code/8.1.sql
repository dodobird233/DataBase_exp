use finance1;
drop trigger if exists before_property_inserted;
-- 请在适当的地方补充代码，完成任务要求：
delimiter $$
CREATE TRIGGER before_property_inserted BEFORE INSERT ON property
FOR EACH ROW 
BEGIN
if(new.pro_type not in(1,2,3)) then
    set @msg=concat('type ',new.pro_type,' is illegal!');
    signal sqlstate '45000' set MESSAGE_TEXT = @msg;
end if;
if(new.pro_type=1) and (select count(*) from finances_product where p_id=new.pro_pif_id)=0 then
    set @msg=concat('finances product #',new.pro_pif_id,' not found!');
    signal sqlstate '45000' set MESSAGE_TEXT = @msg;
end if;

if(new.pro_type=2) and (select count(*) from insurance where i_id=new.pro_pif_id)=0 then
    set @msg=concat('insurance #',new.pro_pif_id,' not found!');
    signal sqlstate '45000' set MESSAGE_TEXT = @msg;
end if;

if(new.pro_type=3) and (select count(*) from fund where f_id=new.pro_pif_id)=0 then
    set @msg=concat('fund #',new.pro_pif_id,' not found!');
    signal sqlstate '45000' set MESSAGE_TEXT = @msg;
end if;

END$$
 
delimiter ;

















