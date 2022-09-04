/*	Crie um banco de dados para um serviço de um Açougue ou de um Hortifruti. O nome do Banco de dados 
deverá ter o seguinte nome db_cidade_das_carnes ou cidade_dos_vegetais. O sistema trabalhará com as 
informações dos produtos comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_produtos e 
tb_categorias, que deverão estar relacionadas.
	Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes 
para classificar os produtos.
	Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos 
da farmácia.
	Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
	Insira 5 registros na tabela tb_categorias.
	Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.
	Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
	Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00.
	Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no 
atributo nome.
	Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados 
da tabela tb_categorias.
	Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados 
da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os produtos que pertencem a categoria aves ou frutas).
*/

-- Criando o banco de dados cidade das carnes
create database db_cidade_das_carnes;

-- Selecionando db_cidade_das_carnes
use db_cidade_das_carnes;

-- Criando a tabela categoria
create table tb_categoria(
id bigint auto_increment,
tipo varchar(255) not null,
promo varchar(255),
primary key(id)
);

-- Inserindo dados na tabela categoria
insert into tb_categoria(tipo, promo) values
("Aves","10%"),
("Frutos do mar",""),
("Suina","12%"),
("Bovina","6%"),
("Outros","");

-- Criando a tabela produtos
create table tb_produtos(
id bigint auto_increment,
nome varchar(255) not null,
validade date not null,
quantidade decimal(5,3) null,
preco decimal(5,2),
tipo_id bigint,
primary key (id),
foreign key (tipo_id) references tb_categoria(id)
);

-- Inserindo dados na tabela produtos
insert into tb_produtos(tipo_id, nome, validade, quantidade, preco) values
(4, "Lagarto","2022-09-22", 1.20, 55.20),
(3, "Bisteca","2022-09-15", 2.01, 28.14),
(5, "Carvão 3Kg","2025-01-05", 1, 18.00),
(1, "Peito","2022-09-16", 3, 60.00),
(4, "Patinho","2022-10-30", 1.54, 61.60),
(3, "Barriga","2022-09-10", 1.0, 19.00),
(2, "Lagosta (uni)","2022-09-22", 2, 175.96),
(1, "Coxa","2022-09-14", 3.50, 38.50);

-- Mostrando produtos com preço maior que 50 em ordem crescente de acordo com o preço
select * from tb_produtos where preco > 50 order by preco;

-- Mostrando produtos com preço entre 50 e 150 em ordem crescente de acordo com o preço
select * from tb_produtos where preco between 50 and 150  order by preco;

-- Mostra as produtos com c no nome
select * from tb_produtos where nome like "%c%";

-- Mostra todos os produtos e suas informações das duas tabelas
select tb_categoria.tipo, tb_categoria.promo, nome, validade, quantidade, preco
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.tipo_id;

-- Mostra todos os produtos do tipo frutos do mar e suas informações
select tb_categoria.tipo, tb_categoria.promo, nome, validade, quantidade, preco
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.tipo_id
where tipo = "Frutos do mar";
