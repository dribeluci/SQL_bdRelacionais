/* Exercício proposto:
1. Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco 
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as informações 
dos produtos desta empresa. 
1.2 Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
 relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.
1.3 Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos 
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de criar 
a foreign key de tb_categoria nesta tabela).
1.4 Popule esta tabela Categoria com até 5 dados.
1.5 Popule esta tabela pizza com até 8 dados.
1.6 Faça um select que retorne os Produtos com o valor maior do que 45 reais.
1.7 Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.
1.8 Faça um select  utilizando LIKE buscando os Produtos com a letra C.
1.9 Faça um um select com Inner join entre  tabela categoria e pizza.
1.10 Faça um select onde traga todos os Produtos de uma categoria específica 
(exemplo todos os produtos que são pizza doce).
*/

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
categoria varchar(255) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO tb_categoria (categoria)
Values ("Tradicional");

INSERT INTO tb_categoria (categoria)
Values ("Especiais");

INSERT INTO tb_categoria (categoria)
Values ("Doce");


CREATE TABLE tb_pizza(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
sabor varchar(255), 
valor decimal(8,2),
massa varchar(255),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_pizza(id)
);

INSERT INTO tb_pizza (nome, sabor, valor, massa, categoria_id)
Values ("Muzz", "mussarela", 29.99, "fina", 1);

INSERT INTO tb_pizza (nome, sabor, valor, massa, categoria_id)
Values ("Cal", "Calabresa", 29.99, "fina", 1);

INSERT INTO tb_pizza (nome, sabor, valor, massa, categoria_id)
Values ("Tosc", "mussarela,calabresa,molho", 39.99, "grossa", 2);

INSERT INTO tb_pizza (nome, sabor, valor, massa, categoria_id)
Values ("Baiana", "linguiça, ovo, pimenta, mussarela, tomate", 49.99, "grossa", 2);

INSERT INTO tb_pizza (nome, sabor, valor, massa, categoria_id)
Values ("PowerCHoc", "chocolate, granulado, m&m", 49.99, "fina", 3);

SELECT * FROM tb_pizza WHERE valor > 45.00;

SELECT * FROM tb_pizza WHERE valor > 29.00 AND valor < 60.00;

SELECT * FROM tb_pizza WHERE nome LIKE "%c%";

SELECT nome, sabor, valor, massa
 FROM tb_pizza INNER JOIN tb_categoria
 ON tb_pizza.categoria_id = tb_categoria.id; 
 
 SELECT nome, sabor, valor, massa
 FROM tb_pizza INNER JOIN tb_categoria
 ON tb_pizza.categoria_id = tb_categoria.id
 WHERE tb_categoria.categoria= "Doce"; 