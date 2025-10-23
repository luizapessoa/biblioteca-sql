CREATE DATABASE biblioteca;

USE biblioteca;

create table autor (
id_autor int auto_increment not null,
nome varchar(30),
nacionalidade varchar(20),
data_nascimento date,
primary key (id_autor)
) DEFAULT CHARSET = utf8mb4;


create table livro (
id_livro int auto_increment not null,
titulo varchar(40),
primary key (id_livro),
id_autor int,
foreign key (id_autor) references autor(id_autor),
ano_publicacao YEAR,
genero varchar (20)
) DEFAULT CHARSET = utf8mb4;


create table usuario (
id_usuario int auto_increment not null,
primary key (id_usuario),
nome varchar(30),
sexo enum('M', 'F'),
email varchar(30),
telefone varchar(11)
) DEFAULT CHARSET = utf8mb4;


create table emprestimo (
id_emprestimo int primary key auto_increment not null,
id_usuario int,
foreign key(id_usuario) references usuario(id_usuario),
id_livro int,
foreign key(id_livro) references livro (id_livro),
data_emprestimo date,
data_devolucao date
) DEFAULT CHARSET = utf8mb4;

insert into autor (nome, nacionalidade, data_nascimento) values
('J.K. Rowling', 'Reino Unido', '1965-07-31'),
('George R.R. Martin', 'Estados Unidos', '1948-09-20'),
('Paulo Coelho', 'Brasil', '1947-08-24'),
('Freida McFadden', 'Estados Unidos', '1980-05-1'),
('Rafael Montes', 'Brasil', '1990-09-22');


insert into livro (titulo, id_autor, ano_publicacao, genero) values
('Harry Potter e a Pedra Filosofal', 1, 1997, 'Fantasia'),
('Harry Potter e a Câmara Secreta', 1, 1998, 'Fantasia'),
('Game of Thrones', 2, 1996, 'Fantasia'),
('O Alquimista', 3, 1988, 'Ficção'),
('A Empregada', 4, 2023, 'Suspense'),
('Uma Família Feliz', 5, 2024, 'Suspense'),
('Suicidas', 5, 2012, 'Suspense');


insert into usuario (nome, sexo, email, telefone) values
('Lucas Silva', 'M', 'lucas@gmail.com', '11987654321'),
('Maria Oliveira', 'F', 'maria@gmail.com', '21987654321'),
('Luiza Pessoa', 'F', 'luiza@gmail.com', '81956563241'),
('Jairo Victor', 'M', 'jairo@gmail.com', '81995432015'),
('Laura Maria', 'F', 'laura@gmail.com', '81985632414');


insert into emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao) values
(1, 1, '2025-10-01', '2025-10-10'),
(2, 4, '2025-10-03', '2025-10-15'),
(3, 5, '2025-10-05', '2025-10-20'),
(4, 7, '2025-10-08', '2025-10-18'),
(5, 3, '2025-10-10', NULL);