/*	Crie um banco de dados para uma plataforma de Cursos Online (EAD). O nome do Banco de dados deverá 
ter o seguinte nome db_curso_da_minha_vida. O sistema trabalhará com as informações dos produtos 
comercializados pela empresa. O sistema trabalhará com 2 tabelas tb_cursos e tb_categorias, que deverão 
estar relacionadas.
	Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes 
para classificar os produtos.
	Crie a tabela tb_cursos e determine 4 atributos, além da Chave Primária, relevantes aos cursos.
	Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_cursos.
	Insira 5 registros na tabela tb_categorias.
	Insira 8 registros na tabela tb_cursos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.
	Faça um SELECT que retorne todes os cursos cujo valor seja maior do que R$ 500,00.
	Faça um SELECT que retorne todes os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00.
	Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo 
nome.
	Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da 
tabela tb_categorias.
	Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os cursos que pertencem a categoria Java).
*/

-- Criando o banco de dados db_curso_da_minha_vida
create database db_curso_da_minha_vida;

-- Selecionando db_curso_da_minha_vida
use db_curso_da_minha_vida;

-- Criando a tabela categoria
create table tb_categoria(
id bigint auto_increment,
tipo varchar(255) not null,
promo varchar(255),
primary key(id)
);

-- Inserindo dados na tabela categoria
insert into tb_categoria(tipo, promo) values
("TI","5%"),
("Linguas","10%"),
("Gastronomia","15%"),
("Artes","12%"),
("Outros","");

-- Criando a tabela cursos
create table tb_cursos(
id bigint auto_increment,
nome varchar(255) not null,
turmas int not null,
vagas int,
preco decimal(8,2),
tipo_id bigint,
primary key (id),
foreign key (tipo_id) references tb_categoria(id)
);

-- Inserindo dados na tabela cursos
insert into tb_cursos(tipo_id, nome, turmas, vagas, preco) values
(4, "Desenho digital", 1, 3, 585.20),
(3, "Mixologia","3", 39, 499.99),
(5, "Eletrica basica", 2, 35, 430.49),
(1, "Manutenção de PC", 5, 46, 750.99),
(2, "Italiano", 2, 35, 590.60),
(3, "Confeitaria", 2, 10, 855.90),
(2, "Inglês", 3, 33, 1455.96),
(1, "Programação", 9, 50, 1979.50);

-- Mostrando cursos com preço maior que 500 em ordem crescente de acordo com o preço
select * from tb_cursos where preco > 500 order by preco;

-- Mostrando cursos com preço entre 600 e 1000 em ordem crescente de acordo com o preço
select * from tb_cursos where preco between 600 and 1000  order by preco;

-- Mostra as cursos com j no nome
select * from tb_cursos where nome like "%j%";

-- Mostra todos os cursos e suas informações das duas tabelas
select tb_categoria.tipo, tb_categoria.promo, nome, turmas, vagas, preco
from tb_cursos inner join tb_categoria
on tb_categoria.id = tb_cursos.tipo_id;

-- Mostra todos os cursos do tipo eletrico e suas informações
select tb_categoria.tipo, tb_categoria.promo, nome, turmas, vagas, preco
from tb_cursos inner join tb_categoria
on tb_categoria.id = tb_cursos.tipo_id
where tipo = "Gastronomia";
