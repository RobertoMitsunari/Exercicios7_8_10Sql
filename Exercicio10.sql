create database Exercicio10
go
use Exercicio10

Create table Medicamentos(
Codigo int not null identity,
Nome varchar(100) not null,
Apresentacao varchar(100) not null,
Unid_De_Cadastro varchar(100) not null,
Preco_Proposto decimal(5,3) not null
primary key(Codigo)
)

create table Cliente(
CPF varchar(20) not null,
Nome varchar(50) not null,
Rua varchar(50) not null,
Num int not null,
Bairro varchar(50) not null,
Telefone varchar(20) not null
primary key(CPF)
)

create table Venda(
Nota_Fiscal int not null,
CPF_Cliente varchar(20) not null,
Cod_medicamento int not null,
Qnt int not null,
Valor_Total decimal(5,2) not null,
Datas date not null
primary key(Nota_Fiscal,CPF_Cliente,Cod_medicamento)
foreign key(CPF_Cliente) references Cliente(CPF),
foreign key(Cod_medicamento) references Medicamentos(Codigo)
)





drop table Venda
drop table Cliente

insert into Medicamentos values
('Acetato de medroxiprogesterona','150 mg/ml','Ampola',6.700),
 ('Aciclovir','200mg/comp.','Comprimido',0.280),
 ('Ácido Acetilsalicílico','500mg/comp.','Comprimido',0.035),
 ('Ácido Acetilsalicílico','100mg/comp.','Comprimido',0.030),
 ('Ácido Fólico','5mg/comp.','Comprimido',0.054),
 ('Albendazol','400mg/comp. mastigável','Comprimido',0.560),
 ('Alopurinol','100mg/comp.','Comprimido',0.080),
 ('Amiodarona','200mg/comp.','Comprimido',0.200),
 ('Amitriptilina(Cloridrato)','25mg/comp.','Comprimido',0.220),
 ('Amoxicilina','500mg/cáps.','Cápsula',0.190)

 insert into Cliente values
('343908987-00','Maria Zélia','Anhaia',65,'Barra Funda','92103762'),
('1213459862-90','Roseli Silva','Xv. De Novembro',987,'Centro','82198763'),
('869279818-25','Carlos Campos','Voluntários da Pátria',1276,'Santana','98172361'),
('310981209-00','João Perdizes','Carlos de Campos',90,'Pari','61982371')


insert into Venda values
(31501,'869279818-25',10,3,0.57,'01/11/2010'),
(31501,	'869279818-25',2,10,2.8,'01/11/2010'),
(31501,'869279818-25',5,30,1.05,'01/11/2010'),
(31501,'869279818-25',8,30,6.6,'01/11/2010'),
(31502,'343908987-00',8,15,	3,	'01/11/2010'),
(31502,'343908987-00',2,10,	2.8,'01/11/2010'),
(31502,'343908987-00',9,10,	2.2,'01/11/2010'),
(31503,'310981209-00',1,20, 134,'01/11/2010')



select m.Codigo,m.Nome,m.Apresentacao,
CASE WHEN (m.Unid_De_Cadastro = 'Comprimido') THEN
	'Compr.'
ELSE
	m.Unid_De_Cadastro
END As Unid_De_Cadastro
from Medicamentos m LEFT OUTER JOIN  Venda v
ON m.Codigo = v.Cod_Medicamento where v.Cod_medicamento is null

Select c.Nome From Cliente c, Venda v,Medicamentos m 
where c.CPF = v.CPF_Cliente and v.Cod_medicamento = m.Codigo 
	and m.Nome like 'Amitriptilina(Cloridrato)'

Select c.CPF,c.Rua + ' ' +CAST(c.Num as varchar) + ' ' + c.Bairro As Endereço,
m.Apresentacao,m.Unid_De_Cadastro,m.Preco_Proposto,v.Qnt,v.Valor_Total
From Cliente c, Venda v,Medicamentos m 
where c.CPF = v.CPF_Cliente and v.Cod_medicamento = m.Codigo 
	and c.Nome like 'Maria Zélia'

update Medicamentos
set Nome = 'Cloridrato de Amitriptilina'
where Nome = 'Amitriptilina(Cloridrato)'

select * from Medicamentos






