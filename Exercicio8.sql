create database Exercicio5
go
use Exercicio5



create table Cliente(
Codigo int not null Identity,
Nome varchar(100) not null,
Endereco varchar(100) not null,
Telefone varchar(20) not null,
Tel_Comercial varchar(20)
primary key(Codigo)
)

create table Tipo_Mercadoria(
Codigo int not null Identity(10001,1),
Nome varchar(100) not null,
primary key(Codigo),
)

create table Corredores(
Codigo int not null Identity(101,1),
Tipo int,
Nome varchar(100),
primary key(Codigo),
foreign key(Tipo) REFERENCES Tipo_Mercadoria(Codigo)
)


create table Mercadoria(
Codigo int not null Identity,
Nome varchar(100) not null,
Corredor int not null,
Tipo int not null,
Valor DECIMAL(5,2)
primary key(Codigo)
foreign key(Corredor) references Corredores(Codigo),
foreign key(Tipo) references Tipo_Mercadoria(Codigo)
)


create table Compra(
Nota_fiscal int not null,
Cod_Cliente int not null,
Valor int not null
primary key(Nota_fiscal),
foreign key(Cod_Cliente) references Cliente(Codigo)
)

insert into Cliente values
('Luis Paulo','R. Xv de Novembro, 100',45657878,null),
('Maria Fernanda','R. Anhaia, 1098',27289098,40040090),
('Ana Claudia','Av. Voluntários da Pátria, 876',21346548,null),
('Marcos Henrique','R. Pantojo, 76',51425890,30394540),
('Emerson Souza','R. Pedro Álvares Cabral, 97',44236545,39389900),
('Ricardo Santos','Trav. Hum, 10',98789878,null)

insert into Tipo_Mercadoria values
('Pães'),
('Frios'),
('Bolacha'),
('Clorados'),
('Frutas'),
('Esponjas'),
('Massas'),
('Molhos')

insert into Corredores values
(10001,	'Padaria'),
(10002,	'Calçados'),
(10003, 'Biscoitos'),
(10004,	'Limpeza'),
(null,null),
(null,null),
(10007,'Congelados')

insert into Compra values
(1234,	2,	200),
(2345,	4,	156),
(3456,	6,	354),
(4567,	3,	19)

insert into Mercadoria values
('Pão de Forma',101,10001,3.5),
('Presunto',101,10002,2.0),
('Cream Cracker',103,10003,4.5),
('Água Sanitária',104,10004,6.5),
('Maçã',105,10005,0.9),
('Palha de Aço',106,10006,1.3),
('Lasanha',107,	10007,9.7)


select * from Cliente
select * from Compra

select p.Valor from Cliente c,Compra p where c.Codigo = p.Cod_Cliente and c.Nome = 'Luis Paulo'

select p.Valor from Cliente c,Compra p where c.Codigo = p.Cod_Cliente and c.Nome = 'Marcos Henrique'

select c.Endereco,c.Telefone from Cliente c,Compra p where c.Codigo = p.Cod_Cliente and p.Nota_fiscal = 4567

select m.Nome from Mercadoria m, Tipo_Mercadoria t where m.Tipo = t.Codigo and t.Nome = 'Pães' 


select c.* from Corredores c,Mercadoria m where m.Corredor = c.Codigo and m.Nome = 'Lasanha'

select c.* from Corredores c,Tipo_Mercadoria t where c.Tipo = t.Codigo and t.Nome = 'Clorados'



