请给出ER图文件存放的URL:
https://web-demo1-tlias.oss-cn-shanghai.aliyuncs.com/ersolution.png
以下给出关系模式：
电影(movie_ID,title,type,runtime,release_date,director,starring,buyer),主码:(movie_ID); 外码：(buyer)
顾客(c_ID,title,name),主码:(c_ID)
放映厅(hall_ID,mode,capacity,loction),主码:(hall_ID);
排场(schedule_ID,date,time,price,number,loc),主码:(schedule_ID); 外码：(loc)
电影票(ticket_ID,seat_num,sc),主码:(ticket_ID); 外码：(sc)



