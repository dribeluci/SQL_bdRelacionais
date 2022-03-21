/* Exercício proposto: 
1. Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco deverá
ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as informações dos produtos 
desta empresa. 
1.1 Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes
do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.
1.2 Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes 
dos tb_produto para se trabalhar com o serviço de um site de cursos onlines(não esqueça de criar a foreign 
key de tb_categoria nesta tabela).
1.3 Popule esta tabela Categoria com até 5 dados.
1.4 Popule esta tabela Produto com até 8 dados.
1.5 Faça um select que retorne os Produtos com o valor maior do que 50 reais.
1.6 Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.
1.7 Faça um select  utilizando LIKE buscando os Produtos com a letra J.
1.8 Faça um um select com Inner join entre  tabela categoria e produto.
1.9 Faça um select onde traga todos os Produtos de uma categoria específica 
(exemplo todos os produtos que são da categoria Java).
*/

CREATE DATABASE  db_cursoDaMinhaVida;

USE  db_construindo_a_nossa_vida;

CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
categoria varchar(255) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO tb_categoria (categoria)
Values ("Java");

INSERT INTO tb_categoria (categoria)
Values ("Python");

INSERT INTO tb_categoria (categoria)
Values ("NodeJS");


CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidadeVagas int, 
valor decimal(8,2),
descricao varchar (255),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_produto(id)
);

INSERT INTO tb_produtos (nome, quantidadeVagas, valor, descricao, categoria_id)
Values ("Inc Java ", "50", 150.00, "Curso Iniciante java", 1);

INSERT INTO tb_produtos (nome, quantidadeVagas, valor, descricao, categoria_id)
Values ("Avan Java ", "50", 350.00, "Curso Avançado java", 1);

INSERT INTO tb_produtos (nome, quantidadeVagas, valor, descricao, categoria_id)
Values ("Inc Pythin ", "50", 150.00, "Curso Iniciante python", 2);

INSERT INTO tb_produtos (nome, quantidadeVagas, valor, descricao, categoria_id)
Values ("Avn Python ", "50", 250.00, "Curso Avançado python", 2);

INSERT INTO tb_produtos (nome, quantidadeVagas, valor, descricao, categoria_id)
Values ("Inc Node ", "50", 150.00, "Curso Iniciante Node", 3);

INSERT INTO tb_produtos (nome, quantidadeVagas, valor, descricao, categoria_id)
Values ("Avn Node ", "50", 350.00, "Curso Avançado node", 3);

SELECT * FROM tb_produto WHERE valor > 50.00;

SELECT * FROM tb_produto WHERE valor > 3.00 AND valor < 60.00;

SELECT * FROM tb_produto WHERE nome LIKE "%j%";

SELECT nome, quantidadeVagas, valor, descricao
 FROM tb_produtos INNER JOIN tb_categoria
 ON tb_produtos.categoria_id = tb_categoria.id; 
 
 SELECT nome, quantidadeVagas, valor, descricao
 FROM tb_produtos INNER JOIN tb_categoria
 ON tb_produtos.categoria_id = tb_categoria.id
 WHERE tb_categoria.categoria= "Java" ; 