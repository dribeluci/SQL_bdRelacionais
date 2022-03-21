/* Exercício proposto:
1. Crie um banco de dados para um serviço de um açougue ou uma quitanda, 
o nome do banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 
1.1 Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
1.2 Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos 
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de criar a 
foreign key de tb_categoria nesta tabela).
1.3 Popule esta tabela Categoria com até 5 dados.
1.4 Popule esta tabela Produto com até 8 dados.
1.5 Faça um select que retorne os Produtos com o valor maior do que 50 reais.
1.6 Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
1.7 Faça um select  utilizando LIKE buscando os Produtos com a letra C.
1.8 Faça um um select com Inner join entre  tabela categoria e produto.
1.9 Faça um select onde traga todos os Produtos de uma categoria específica 
(exemplo todos os produtos que são aves ou legumes).
 */
 
 CREATE DATABASE  db_cidade_das_frutas;

USE  db_cidade_das_frutas;

CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
categoria varchar(255) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO tb_categoria (categoria)
Values ("Frutas");

INSERT INTO tb_categoria (categoria)
Values ("Legumes");

INSERT INTO tb_categoria (categoria)
Values ("Verduras");


CREATE TABLE tb_produto(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
valor decimal(8,2),
validade date NULL,
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_produto(id)
);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("Morango", "50", 5.99, "2022-04-01", 1);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("Banana", "30", 7.99, "2022-04-05", 1);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("Cenoura", "100", 10.99, "2022-04-21", 2);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("beterrada", "80", 7.99, "2022-04-21", 2);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("alface", "60", 1.99, "2022-04-30", 3);

SELECT * FROM tb_produto WHERE valor > 50.00;

SELECT * FROM tb_produto WHERE valor > 3.00 AND valor < 60.00;

SELECT * FROM tb_produto WHERE nome LIKE "%c%";

SELECT nome, quantidade, valor, validade
 FROM tb_produto INNER JOIN tb_categoria
 ON tb_produto.categoria_id = tb_categoria.id; 
 
 SELECT nome, quantidade, valor, validade
 FROM tb_produto INNER JOIN tb_categoria
 ON tb_produto.categoria_id = tb_categoria.id
 WHERE tb_categoria.categoria= "verdura" ; 
 