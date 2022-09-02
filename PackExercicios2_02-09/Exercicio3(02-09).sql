/*Crie um banco de dados para um serviço de uma Farmácia. O nome do Banco de dados deverá ter o seguinte 
nome db_farmacia_bem_estar. O sistema trabalhará com as informações dos produtos comercializados pela 
empresa. O sistema trabalhará com 2 tabelas tb_produtos e tb_categorias, que deverão estar relacionadas.

Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para 
classificar os produtos.
Crie a tabela tb_produtos e determine 4 atributos, além da Chave Primária, relevantes aos produtos da 
farmácia.
Não esqueça de criar a Foreign Key da tabela tb_categorias na tabela tb_produtos.
Insira 5 registros na tabela tb_categorias.
Insira 8 registros na tabela tb_produtos, preenchendo a Chave Estrangeira para criar a relação com a 
tabela tb_categorias.
Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 50,00.
Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00.
Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo 
nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da 
tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 
(Exemplo: Todes os produtos que pertencem a categoria cosméticos).
*/

-- Criando o banco de dados farmacia bem estar
create database db_farmacia_bem_estar;

-- Selecionando db_farmacia_bem_estar
use db_farmacia_bem_estar;

-- Criando a tabela categoria
create table tb_categoria(
id bigint auto_increment,
tipo varchar(255) not null,
prescrito char not null,
primary key(id)
);

-- Inserindo dados na tabela categoria
insert into tb_categoria(tipo, prescrito) values
("Tarja Preta",'S'),
("Tarja Vermelha",'S'),
("Gripais",'N'),
("Estomacais",'N'),
("Outros",'N');

-- Criando a tabela produtos
create table tb_produtos(
id bigint auto_increment,
tipo_id bigint,
nome varchar(255) not null,
contraindi varchar(255) not null,
preco decimal(5,2),
primary key (id),
foreign key (tipo_id) references tb_categoria(id)
);

-- Inserindo dados na tabela produtos
insert into tb_produtos(tipo_id, nome, contraindi, preco) values
(4, "Gaviscon","Contraindicado para menores de 12 anos", 4.00),
(3, "Naldecon","Contraindicado a pacientes com glaucoma de ângulo estreito", 21.00),
(5, "Balinhas","Contraindicado para diabeticos", 6.00),
(1, "Morfina","Contraindicada para pessoas com hipersensibilidade aos componentes da fórmula...", 60.00),
(4, "Pantoprazol","Contraindicado para menores de 5 anos de idade", 80.00),
(3, "Resfenol","Containdicado para pacientes com hipertensão, doença cardíaca, diabete...", 19.00),
(2, "Metformina","Contraindicado para alergicos ao cloridrato de metformina ou aos outros componentes da fórmula", 55.00),
(1, "Codeína","Contraindicado para pacientes que apresentarem hipersensibilidade aos componentes da fórmula do Codein", 95.00);

-- Mostrando produtos com preço maior que 50 em ordem crescente de acordo com o preço
select * from tb_produtos where preco > 50 order by preco;

-- Mostrando produtos com preço entre 5 e 60 em ordem crescente de acordo com o preço
select * from tb_produtos where preco between 5 and 60  order by preco;

-- Mostra as produtos com m no nome
select * from tb_produtos where nome like "%c%";

-- Mostra todos os produtos e suas informações das duas tabelas
select tb_categoria.tipo, tb_categoria.prescrito, nome, contraindi, preco
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.tipo_id;

-- Mostra todos os produtos tarja preta e suas informações
select tb_categoria.tipo, tb_categoria.prescrito, nome, contraindi, preco
from tb_produtos inner join tb_categoria
on tb_categoria.id = tb_produtos.tipo_id
where tipo = "Tarja Preta";