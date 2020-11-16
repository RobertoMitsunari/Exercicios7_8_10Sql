
create table Clientes(
Rg varchar(13) not null,
Cpf varchar(14) not null,
Nome varchar(120) not null,
Endereco varchar(120) not null,
primary key(Rg)
)

create table Pedido(
NotaFiscal int not null identity(1001,1),
Valor int not null,
Data date not null,
RG_Cliente varchar(13) not null
primary key(NotaFiscal)
foreign key(RG_Cliente) references Clientes(Rg)
)

create table Fornecedor(
Codigo int not null identity,
Nome varchar(100),
Endereco varchar(100),
Telefone varchar(20),
Cgc varchar(50),
Cidade varchar(50),
Transporta varchar(50),
Pais varchar(50),
Moeda varchar(50)
primary key(Codigo)
)

create table Mercadoria(
Cod int not null identity(10,1),
Descricao varchar(150) not null,
Preco int not null,
Qtn int not null,
Cod_Fornecedor int not null,
primary key(Cod),
foreign key(Cod_Fornecedor) references Fornecedor(Codigo)
)


insert into Clientes values
('2.953.184-4',	'345.198.780-40',	'Luiz André',	'R. Astorga, 500'),
('13.514.996-x',	'849.842.856-30',	'Maria Luiza',	'R. Piauí, 174'),
('12.198.554-1',	'233.549.973-10',	'Ana Barbara',	'Av. Jaceguai, 1141'),
('23.987.746-x',	'435.876.699-20',	'Marcos Alberto',	'R. Quinze, 22')



insert into Pedido values
(754,	'01/04/2018',	'12.198.554-1'),
(350,	'02/04/2018',	'12.198.554-1'),
(30,	'02/04/2018',	'2.953.184-4'),
(1500,	'03/04/2018',	'13.514.996-x')


insert into Mercadoria values
('Mouse',	24,	30,	1),
('Teclado',	50,	20,	1),
('Cx. De Som',	30,	8,	2),
('Monitor 17',	350,	4,	3),
('Notebook',	1500,	7,	4)

insert into Fornecedor values
('Clone',	'Av. Nações Unidas, 12000',	'(11)4148-7000',null,'São Paulo',null,null,null),
('Logitech','28th Street, 100',	'1-800-145990',null,null,'Avião','EUA','US$'),
('Lg','Rod. Castello Branco',	'0800-664400', '415997810/0001','Sorocaba',null,null,null),
('PcChips','Ponte da Amizade',null,null,null,'Navio','Py','US$')


select (valor * 0.90) as valor from Pedido where NotaFiscal = 1003

select (valor * 0.95) as valor from Pedido where Valor > 700

select * from Mercadoria
update Mercadoria
set Preco = Preco * 1.20
where Qtn < 10

select * from Pedido where RG_Cliente = '2.953.184-4'

select c.Cpf,c.Nome from Pedido p, Clientes c
where c.Rg = p.RG_Cliente and p.NotaFiscal = 1004

select f.Pais,f.Transporta from Fornecedor f,Mercadoria m
where m.Cod_Fornecedor = f.Codigo and m.Descricao = 'Cx. De Som'

select m.Descricao,m.Qtn from Fornecedor f,Mercadoria m
where m.Cod_Fornecedor = f.Codigo and f.Nome = 'Clone'

select f.Endereco,f.Telefone from Fornecedor f,Mercadoria m
where m.Cod_Fornecedor = f.Codigo and m.Descricao = 'Monitor 17'

select f.Moeda from Fornecedor f,Mercadoria m
where m.Cod_Fornecedor = f.Codigo and m.Descricao = 'Notebook'

select *,DATEDIFF(DAY,Data,GETDATE()) AS Data_Dif,
CASE WHEN (DATEDIFF(MONTH,Data,GETDATE()) > 6) THEN
	'Pedido antigo' 
END As Pedido_Antigo
from Pedido

select c.nome,COUNT(c.Nome) As Qnt_Compras from Pedido p,Clientes c where p.RG_Cliente = c.Rg GROUP BY c.nome

select c.Nome from Pedido p RIGHT OUTER JOIN Clientes c ON p.RG_Cliente = c.Rg where p.RG_Cliente is null

