/* Exercício Proposto:  
1. Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco 
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as informações
 dos produtos desta empresa. 
1.1 Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
1.2 Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não esqueça de criar a 
foreign key de tb_categoria nesta tabela).
1.3 Popule esta tabela Categoria com até 5 dados.
1.4 Popule esta tabela Produto com até 8 dados.
1.5 Faça um select que retorne os Produtos com o valor maior do que 50 reais.
1.6 Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
1.7 Faça um select  utilizando LIKE buscando os Produtos com a letra B.
1.8 Faça um um select com Inner join entre  tabela categoria e produto.
*/

CREATE DATABASE db_farmacia_do_bem;

USE db_farmacia_do_bem;

CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
categoria varchar(255) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO tb_categoria (categoria)
Values ("Farmacia");

INSERT INTO tb_categoria (categoria)
Values ("Perfumaria");

INSERT INTO tb_categoria (categoria)
Values ("Conveniencia");


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
Values ("Dipirona", "50", 10.99, "2025-03-18", 1);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("Omeprazol", "30", 7.99, "2023-02-18", 1);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("VYCHY pele", "5", 89.99, "2023-12-06", 2);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("Protetor Solar", "7", 65.99, "2022-10-12", 2);

INSERT INTO tb_produto (nome, quantidade, valor, validade, categoria_id)
Values ("Bala mentos", "60", 5.99, "2023-12-06", 3);

SELECT * FROM tb_produto WHERE valor > 50.00;

SELECT * FROM tb_produto WHERE valor > 3.00 AND valor < 60.00;

SELECT * FROM tb_produto WHERE nome LIKE "%b%";

SELECT nome, quantidade, valor, validade
 FROM tb_produto INNER JOIN tb_categoria
 ON tb_produto.categoria_id = tb_categoria.id; 
 
 