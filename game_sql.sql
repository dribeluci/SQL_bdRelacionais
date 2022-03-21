/* Exercício proposto:
 1. Crie um banco de dados para um serviço de um game Online , 
o nome do banco deverá ter o seguinte nome db_generation_game_online, 
onde, o sistema trabalhará com as informações dos personagens desse game. 
O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.
1.1 Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos 
relevantes da classe para se trabalhar com o serviço desse  game Online.
1.2 Crie uma tabela tb_personagem  e utilizando a habilidade de abstração e determine 5 
atributos relevantes dos personagens para se trabalhar com o serviço desse game Online 
(não esqueça de criar a foreign key de tb_classe nesta tabela).
1.3 Popule esta tabela classe com até 5 dados.
1.4 Popule esta tabela personagem com até 8 dados.
1.5 Faça um select que retorne os personagens com o poder de ataque maior do que 2000.
1.6 Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.
1.7 Faça um select  utilizando LIKE buscando os personagens com a letra C.
1.8 Faça um um select com Inner join entre  tabela classe e personagem.
1.9 Faça um select onde traga todos os personagem de uma classe específica 
(exemplo todos os personagens que são arqueiros).
*/ 

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classe(
id bigint AUTO_INCREMENT,
categoria varchar(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_classe (categoria)
Values ("Arqueiro");

INSERT INTO tb_classe (categoria)
Values ("Guerreiro");

INSERT INTO tb_classe (categoria)
Values ("Mago");

SELECT * FROm tb_classe;

CREATE TABLE tb_personagem(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
Ataque int, 
Defesa int,
Magia int,
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_classe(id)
);

INSERT INTO tb_personagem (nome, ataque, defesa,magia,categoria_id)
Values ("GAIA", 2000, 1000, 1700, 3);

INSERT INTO tb_personagem (nome, ataque, defesa,magia,categoria_id)
Values ("Apolo", 1500, 700, 1000, 1);

INSERT INTO tb_personagem (nome, ataque, defesa,magia,categoria_id)
Values ("Ares", 3000, 1000, 500, 2);

INSERT INTO tb_personagem (nome, ataque, defesa,magia,categoria_id)
Values ("Atena", 1000, 2000, 3000, 3);

INSERT INTO tb_personagem (nome, ataque, defesa,magia,categoria_id)
Values ("Calenial", 1000, 1500, 1000, 2);


SELECT * FROM tb_personagem WHERE ataque > 2000;

SELECT * FROM tb_personagem WHERE defesa > 1000 AND defesa <2000;

SELECT * FROM tb_personagem WHERE nome LIKE "%c%";

 SELECT nome, ataque, defesa, magia 
 FROM tb_personagem INNER JOIN tb_classe
 ON tb_personagem.categoria_id = tb_classe.id; 
 
  SELECT nome, ataque, defesa, magia 
 FROM tb_personagem INNER JOIN tb_classe
 ON tb_personagem.categoria_id = tb_classe.id
 WHERE tb_classe.categoria= "Mago"; 
 
