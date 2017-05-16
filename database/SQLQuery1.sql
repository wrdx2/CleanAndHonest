/*���������
	sNo int ��������������
	sName nchar(16) ����������
	sdep nchar(32) ��������
	sEmail nchar(32) �����������ַ
	sTel int not ��������ϵ�绰
	sAddress nchar(50) ��������ϵ��ַ
	sTitle nchar(50) �������
	sContent text not ��������
	sTime date �ϱ�ʱ��
	sAttach nchar(30) �����
	sState int ����״̬
	sPass nchar(16) ��ѯ����
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
����������
	cNo int ����������
	cType nchar(20) ��������
	cName nchar(16) ��ѯ������
	cEmail nchar(32) ����
	cTel int �绰
	cAddress nchar(50) ��ַ
	cTitle nchar(50) ����
	cContent text ����
	cTime date ʱ��
	cAttach nchar(30) ����
	cReply int �ظ���ʽ
	cPass nchar(16) ��ѯ����
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
�ظ���
	rNo int �����ţ����������ѯ�ã�
	rName nchar(16) ����������
	rEmail nchar(32) ����������
	rTel int �����˵绰
	rContent text �ظ�����
	rTime date �ظ�ʱ��
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
��ϸ��Ϣ��ͼ
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