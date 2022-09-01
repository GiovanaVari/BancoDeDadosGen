/*Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as 
informações dos colaboradores desta empresa. 
Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar 
com o serviço deste RH.
Insira nesta tabela no mínimo 5 dados (registros).
Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
Ao término atualize um registro desta tabela através de uma query de atualização.
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e 
coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.
*/

-- Criando o banco de dados rh
create database db_rh;

-- Selecionando o db_rh
use db_rh;

-- Criando a tabela tb_colaboradores
create table tb_colaboradores(
cpf int not null,
nome varchar(255) not null,
data_de_nascimento date, 
cargo varchar(255) not null,
salario decimal,
primary key (cpf)
);

-- Inserindo os dados dos colaboradores
insert into tb_colaboradores (cpf, nome, data_de_nascimento, cargo, salario) 
values (123, "Regina das Dores", "1977-09-10", "Gerente Chefe", 4543.00),
(135, "Dina Morgan", "1993-05-26", "Supervisora", 3230.00),
(246, "Jorge Ribeiro", "1960-01-08", "Secretario", 1805.50),
(357, "Dory da Disnerys", "1986-01-01", "Auxiliar de estoque", 2155.00),
(468, "Zé das Couves", "1966-10-28", "faz nada", 2000.00);

-- Mostra os dados dos colaboradores com salario maior que 2000,00
select * from tb_colaboradores where salario > 2000.00;

-- Mostra os dados dos colaboradores com salario menor que 2000,00
select * from tb_colaboradores where salario < 2000.00;

-- Atualizando o salario da Dina
update tb_colaboradores set salario = 3900.00 where cpf = 135;

-- Verificando aumento do salario de Dina
select nome, salario from tb_colaboradores where cpf = 135;
