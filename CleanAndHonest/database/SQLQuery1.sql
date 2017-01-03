/*审批事项表
	sNo int 审批事项受理编号
	sName nchar(16) 申请人姓名
	sdep nchar(32) 审批部门
	sEmail nchar(32) 申请人邮箱地址
	sTel int not 申请人联系电话
	sAddress nchar(50) 申请人联系地址
	sTitle nchar(50) 事项标题
	sContent text not 事项内容
	sTime date 上报时间
	sAttach nchar(30) 事项附件
	sState int 审批状态
	sPass nchar(16) 查询密码
	*/
drop table shenpi;
create table shenpi(
	sNo int not null primary key,
	sName nchar(16) not null,
	sdep nchar(32) not null,
	sEmail nchar(32) not null,
	sTel int not null,
	sAddress nchar(50) not null,
	sTitle nchar(50) not null,
	sContent text not null,
	sTime date not null,
	sAttach nchar(30),
	sState int not null,
	sPass nchar(16) not null,
)

/*
民政互动表
	cNo int 互动受理编号
	cType nchar(20) 互动类型
	cName nchar(16) 咨询人姓名
	cEmail nchar(32) 邮箱
	cTel int 电话
	cAddress nchar(50) 地址
	cTitle nchar(50) 标题
	cContent text 内容
	cTime date 时间
	cAttach nchar(30) 附件
	cReply int 回复方式
	cPass nchar(16) 查询密码
*/
drop table consult;
create table consult(
	cNo int not null primary key,
	cType nchar(20) not null,
	cName nchar(16) not null,
	cEmail nchar(32) not null,
	cTel int not null,
	cAddress nchar(50) not null,
	cTitle nchar(50) not null,
	cContent text not null,
	cTime date not null,
	cAttach nchar(30),
	cReply int not null,
	cPass nchar(16) not null,
)

/*
回复表
	rNo int 受理编号（由其他表查询得）
	rName nchar(16) 办理人姓名
	rEmail nchar(32) 办理人邮箱
	rTel int 办理人电话
	rContent text 回复内容
	rTime date 回复时间
*/
drop table reply;
create table reply(
	rNo int not null primary key,
	rName nchar(16),
	rEmail nchar(32),
	rTel int,
	rContent text,
	rTime date,
	constraint id_fk foreign key (rNo) references shenpi (sNo)
)
/*
详细信息视图
*/
drop view V_sr
create view V_sr as
select s.sNo,s.sName,s.sdep,s.sEmail,s.sTel,s.sAddress,s.sTitle,s.sContent,s.sTime,
isnull(s.sAttach,'') sAttach,
		s.sState,s.sPass,
		isnull(r.rName,'') rName,isnull(r.rEmail,'') rEmail,
		r.rTel,isnull(r.rContent,'') rContent,r.rTime
from shenpi s, reply r
where s.sNo=r.rNo;

insert into reply(rNo) select sNo from shenpi;