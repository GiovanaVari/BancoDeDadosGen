/*Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro
 dessa escola. 
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se 
trabalhar com o serviço dessa escola.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, 
no repositório que você criou sobre Banco de dados.
*/

-- Criando o banco de dados escola
create database db_escola;

-- Selecionando o db_escola
use db_escola;

-- Criando a tabela tb_estudantes
create table tb_estudantes(
id int auto_increment,
nome varchar(255) not null,
data_de_nascimento date,
serie varchar(255),
nota decimal (4,2),
primary key (id)
);

-- Inserindo dados
insert into tb_estudantes (nome, data_de_nascimento, serie, nota) 
values ("Ricardo", "2005-09-10", "3º", 8.25),
("Julia", "2007-04-03", "1º", 7.00),
("Jazz", "2008-02-29", "8ª", 5.75),
("Alex", "2007-11-13", "1º", 7.85),
("Tommy", "2010-09-10", "6ª", 9.00),
("Jullie", "2009-09-23", "7ª", 10.00),
("Natalha", "2004-06-11", "3º", 9.75),
("Marcio", "2007-02-10", "1º", 4.75);

-- Mostra alunes com nota maior que 7
select * from tb_estudantes where nota > 7.0;

-- Mostra alunes com nota menor que 7
select * from tb_estudantes where nota < 7.0;

-- Atualização de data de nascimento
update tb_estudantes set data_de_nascimento = "2005-06-11" where id = 7;

-- Verificando alteração na data de nascimento da Natalha
select nome, data_de_nascimento from tb_estudantes where id = 7;