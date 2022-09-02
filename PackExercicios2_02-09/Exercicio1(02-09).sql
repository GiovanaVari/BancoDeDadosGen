/*Crie um banco de dados para um serviço de um Games Online. O nome do Banco de 
dados deverá ter o seguinte nome db_generation_game_online. O sistema trabalhará 
com as informações dos personagens do jogo. O sistema trabalhará com 2 tabelas 
tb_personagens e tb_classes, que deverão estar relacionadas.

Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.
Insira 5 registros na tabela tb_classes.
Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
Salve todas as queries para cada um dos requisitos do exercício em um único script (arquivo .SQL) e coloque no seu Github pessoal, no repositório que você criou sobre Banco de dados.

*/
-- Criando o banco de dados db_generation_game_online
create database db_generation_game_online;

-- Selecionando o banco de dados db_generation_game_online
use db_generation_game_online;

-- Criando a tabela classes
create table tb_classes(
id bigint auto_increment,
clan varchar(255) not null,
poderes varchar(255) not null,
primary key (id)
);

-- Inserindo dados na tabela classes
insert into tb_classes(clan, poderes) values
("Sombras", "Ataque gelado, defeza das trevas"),
("Luz", "Ataque vulcanico, Cega inimigo"),
("Engrenagem", "Ataque armado, Construção de armas"),
("Sabedoria", "Tiro de livros, Monta armadilhas"),
("Magia", "Ataque de gatos, Tiro de vassoura");

-- Criando a tabela personagens
create table tb_personagens(
id bigint auto_increment,
nome varchar(255) not null,
ataque int not null,
defesa int not null,
super_poder varchar(255) not null,
clan_id bigint,
primary key (id),
foreign key (clan_id) references tb_classes(id)
);

-- Inserinto dados na tabela personagens
insert into tb_personagens(nome, ataque, defesa, super_poder, clan_id) values
("Morgana", 3500, 1200, "Caldeirão de acido", 5),
("Peter", 1040, 3000, "Armadilha da morte", 4),
("Perséfone", 1900, 2666, "Virado do avesso", 1),
("Ravena", 6666, 666, "Ida ao inferno", 1),
("Minerva", 3333, 600 , "Caminho dos ceus", 2),
("Dom", 1500, 2500, "Transformação em robo", 3),
("Casper",2890, 1200, "Portal da morte", 5),
("Josh", 2300, 1500, "Armadilha da morte", 4);

-- Mostra os personagens com ataque maior que 2000
select * from tb_personagens where ataque >= 2000;

-- Mostra os personagens com defesa entre 1000 e 2000
select * from tb_personagens where defesa between 1000 and 2000;

-- Mostra os personagens com c no nome
select * from tb_personagens where nome like "%c%";

-- Junta as tabelas e mostra tudo
select nome, ataque, defesa, super_poder, tb_classes.clan, tb_classes.poderes
from tb_personagens inner join tb_classes
on tb_classes.id = tb_personagens.clan_id;

-- Junta as tabelas e mostra só os do clan das Sombras
select nome, ataque, defesa, super_poder, tb_classes.clan, tb_classes.poderes
from tb_personagens inner join tb_classes
on tb_classes.id = tb_personagens.clan_id
where clan = "Sombras";

