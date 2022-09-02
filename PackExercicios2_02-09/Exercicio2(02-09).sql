/*Crie um banco de dados para um serviço de uma Pizzaria. O nome do Banco de dados deverá ter o seguinte 
nome db_pizzaria_legal. O sistema trabalhará com as informações dos produtos comercializados pela empresa. 
O sistema trabalhará com 2 tabelas tb_pizzas e tb_categorias, que deverão estar relacionadas.
Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar as pizzas.
Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_pizzas.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela 
tb_categorias.
Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela 
tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da 
tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica 
(Exemplo: Todas as pizzas que são doce)
*/
-- PS. Estou com fome e ao ler as linhas abaixo vc tambem ficara
-- Criando o banco de dados pizzaria legal
create database db_pizzaria_legal;

-- Selecionando db_pizzaria_legal
use db_pizzaria_legal;

-- Criando a tabela categorias
create table tb_categorias(
id bigint auto_increment,
tipo varchar(255) not null,
tamanho char not null,
primary key(id)
);

-- Inserindo dados na tabela categorias
insert into tb_categorias(tipo, tamanho) values
("Doce",'P'),
("Doce",'M'),
("Doce",'G'),
("Salgada",'P'),
("Salgada",'M'),
("Salgada",'G');

-- Criando a tabela pizzas (agora vem a fome)
create table tb_pizzas(
id bigint auto_increment,
tipo_id bigint,
nome varchar(255) not null,
ingredientes varchar(255) not null,
preco decimal(5,2),
primary key (id),
foreign key (tipo_id) references tb_categorias(id)
);

-- Inserindo dados na tabela pizzas
insert into tb_pizzas(tipo_id, nome, ingredientes, preco) values
(4, "Portuguesa","Ovo, presunto, mussarela, milho e o que vc pensar kkkk", 59.00),
(3, "Chocolate","Chocolate e borda de doce de leite", 51.00),
(5, "Calarela","Calabresa e mussarela", 54.00),
(1, "Romeu e Julieta","Mussarela e goiabada", 44.00),
(4, "Mussarela","Mussarela e tomate", 45.00),
(6, "Mineirinha","Peito de peru, baicon e catupiry", 50.00),
(2, "Bis","Chocolate com bis picado", 55.00),
(1, "Hannah","Chocolate, sonho de valsa e gotas de chocolate brando(gorda sabor chocolate)", 55.00);

-- Pequeno teste
select * from tb_pizzas;

-- Mostrando pizzas com preço maior que 45
select * from tb_pizzas where preco > 45;

-- Mostrando pizzas com preço entre 50 e 100
select * from tb_pizzas where preco between 50 and 100;

-- Mostra as pizzas com m no nome
select * from tb_pizzas where nome like "%m%";

-- Conserto do gorda para gordura e brando para branco
update tb_pizzas set ingredientes = 
"Chocolate, sonho de valsa e gotas de chocolate branco (gordura sabor chocolate)" where id = 8;

-- Mostra todas as pizzas e suas informações das duas tabelas
select tb_categorias.tipo, tb_categorias.tamanho, nome, ingredientes, preco
from tb_pizzas inner join tb_categorias
on tb_categorias.id = tb_pizzas.tipo_id;

-- Mostra todas as pizzas salgadas e suas informações
select tb_categorias.tipo, tb_categorias.tamanho, nome, ingredientes, preco
from tb_pizzas inner join tb_categorias
on tb_categorias.id = tb_pizzas.tipo_id
where tipo = "Salgada";

