/*	Crie um banco de dados para um serviço de uma loja de Material de Construção. O nome do Banco de dados 
deverá ter o seguinte nome db_construindo_vidas. O sistema trabalhará com as informações dos produtos 
comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão 
estar relacionadas.
	Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar os produtos.
	Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da 
farmácia.
	Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
	Insira 5 registros na tabela tb_categorias.
	Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com 
a tabela tb_categorias.
	Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
	Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.
	Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no 
atributo nome.
	Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados 
da tabela tb_categorias.
	Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados 
da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os produtos que pertencem a categoria hidráulica).
*/

-- Criando o banco de dados db_construindo_vidas
create database db_construindo_vidas;

-- Selecionando db_construindo_vidas
use db_construindo_vidas;

-- Criando a tabela categoria
create table tb_categoria(
id bigint auto_increment,
tipo varchar(255) not null,
promo varchar(255),
primary key(id)
);

-- Inserindo dados na tabela categoria
insert into tb_categoria(tipo, promo) values
("Tintas","7%"),
("Portas e Janelas","10%"),
("Eletrica","15%"),
("Hidraulica","5%"),
("Outros","");

-- Criando a tabela produtos
create table tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
marca varchar(255),
quantidade int not null,
preco decimal(7,2),
tipo_id bigint,
primary key (id),
foreign key (tipo_id) references tb_categoria(id)
);

-- Inserindo dados na tabela produtos
insert into tb_produtos(tipo_id, nome, marca, quantidade, preco) values
(4, "Sifão com copo cromado","Astra", 120, 85.20),
(3, "Disjuntor Série Sd62 63a 2p","Steck", 100, 39.99),
(5, "Kit com 15 suculentas","", 23, 30.49),
(1, "Rende muito","Coral", 167, 44.91),
(4, "Base valvula descarga 1.1/4","Hydra", 300, 139.60),
(3, "Cabo flexivel 2,5mm 100 metros","Sil", 1000, 175.90),
(2, "Porta postigo","Sasazaki", 20, 1075.96),
(1, "Lousa e cor","Suvinil", 200, 53.50);

-- Mostrando produtos com preço maior que 100 em ordem crescente de acordo com o preço
select * from tb_produtos where preco > 100 order by preco;

-- Mostrando produtos com preço entre 70 e 150 em ordem crescente de acordo com o preço
select * from tb_produtos where preco between 70 and 150  order by preco;

-- Mostra as produtos com c no nome
select * from tb_produtos where nome like "%c%";

-- Mostra todos os produtos e suas informações das duas tabelas
select tb_categoria.tipo, tb_categoria.promo, nome, marca, quantidade, preco
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.tipo_id;

-- Mostra todos os produtos do tipo eletrico e suas informações
select tb_categoria.tipo, tb_categoria.promo, nome, marca, quantidade, preco
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.tipo_id
where tipo = "Eletrica";

