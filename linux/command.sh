##linux主机
#查看系统日志
journalctl -u 服务名


##k8s
#创建并运行nginx镜像
kubectl run nginx --image=nginx --replicas=3
#查看所有资源/pods资源
kubectl get all/pods
#查看pod的详细信息
kubectl describe pod name
#查看pods及运行节点
kubectl get pods -o wide
#为deployment资源暴露一个新service（ip：port）
kubectl expose deployment nginx --port=88 --target-port=80
#查看pod加入的负载（默认轮训）
kubectl get ep nginx



##docker
#运行ubuntu镜像输出Hello world 
docker run ubuntu:15.10 /bin/echo "Hello world"
#




#SQL
#创建一张表
create table AAAA （
    Sno char（9） primary key，
    Ssex char（2）
）；
#为AA表增加列，数据类型为date
alter table AA add b DATE;
#为表加唯一值得约束条件
alter table AA add unique (Sno);
#改正数据类型
alter table AA alter column Sage int；
#查找语句
select * from AA where Sno!>2 ;
#区间查找
select * from AA where Sno (not) between 10 and 20 ;
#确定查找
select * from AA where Sno (not) in 2;
#模糊匹配(%表示任意长度 _表示单个字符 \转义)
select * from AA where Sno like '张%';
#排序
select * from AA where Sno='3' order by grade (ASC|desc)
#分组
select * from AA group by Sno having avg>9;
#连接查询
select S.*,C.* from S,C where S.no=C.no;
#嵌套查询
select Sno from A where Sno in (
    select Cno from C where Cname=2)；
#插入
insert into  A(Sno，Sname) values (1,2)；
#修改
update A set age=10 where Sno='1';
#删除
delete from A where Sno='2';











