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
docker run centos /bin/echo "Hello world"
#运行docker并且进入容器
docker run -it centos /bin/bash
#查看启动容器
docker ps
#查看容器内标准输出
docker logs （container id）
-f 动态输出
#查看已有的镜像
docker images
#查看镜像列表
docker search nginx
#导出镜像
docker save images_name.tar images_name
#删除镜像
docker rmi images_name
#载入镜像
docker pull nginx
#启动一个容器
docker run -d -P --name=con_name nginx
-d:让容器在后台运行。
-P:将容器内部使用的网络端口映射到我们使用的主机上。
-p:是容器内部端口绑定到指定的主机端口。
--name 设置名字
#进入容器
docker attach con_name
#删除容器
docker rm zhang
#查看容器内部运行的进程
docker top con_name
#停止容器
docker stop con_name
#更新容器
docker commit -m="has update" -a="runoob" e218edb10161 nginx:v2
-m:提交的描述信息
-a:指定镜像作者
e218edb10161：容器ID
nginx:v2:指定要创建的目标镜像名







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











