/*Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce. 
Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, 
no repositório que você criou sobre Banco de dados.
*/
-- Criando o banco de dados e-vendas
create database db_e_vendas;

-- Selecionando o db_e_vendas
use db_e_vendas;

-- Criando a tabela tb_itens
create table tb_itens(
id bigint auto_increment,
nome varchar(255),
quantidade int,
marca varchar(255),
preco decimal (7,2),
primary key (id)
);

-- Inserindo estoque
insert into tb_itens(nome, quantidade, marca, preco) values
("torradeira", 5, "Britania", 190.00),
("Redmi Note 11 Pro", 19, "Xiaomi", 2150.99),
("SSD 1tb", 3, "KingSpec", 434.99),
("Fone W820NB", 8, "Edifier", 439.80),
("Adaptador bluetooth", 32, "Baseus", 33.90),
("Carregador 18W", 14, "Ugreen", 65.90),
("Liquidificador", 7, "Britania", 150.00),
("Geladeira BRM54HK", 5, "Brastemp", 3099.98);

-- Mostra os itens com preço maior que 500,00
select * from tb_itens where preco > 500;

-- Mostra os itens com preço menor que 500,00
select * from tb_itens where preco < 500;

-- Atualização de preço
update tb_itens set preco = 120.00 where id = 1;

-- Verificando o descontão da torradeira
select nome, preco from tb_itens where nome = "torradeira";