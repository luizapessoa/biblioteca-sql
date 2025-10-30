-- 📚 CONSULTAS SQL - Projeto Biblioteca (MySQL)
-- Descrição: consultas de prática SQL para o banco de dados de biblioteca

-- 1. listar todos os autores que nasceram depois de 1980
SELECT * 
FROM autor 
WHERE data_nascimento > '1980-12-31';

-- 2. encontrar todos os livros do gênero "Suspense"
SELECT titulo, genero 
FROM livro 
WHERE genero = 'Suspense';

-- 3. verificar quais usuários têm um e-mail @gmail.com
SELECT nome, email 
FROM usuario 
WHERE email LIKE '%@gmail.com';

-- 4. listar todos os empréstimos devolvidos no dia 10 de outubro de 2025
SELECT id_emprestimo, data_devolucao 
FROM emprestimo 
WHERE data_devolucao = '2025-10-10';

-- 🔗 consultas com JOINs

-- 5. descobrir o nome de todos os livros escritos pelo autor 'Rafael Montes'
SELECT livro.titulo, autor.nome 
FROM livro 
JOIN autor ON autor.id_autor = livro.id_autor
WHERE autor.nome = 'Rafael Montes';

-- 6. verificar o histórico de empréstimos da usuária 'Luiza Pessoa' (quais livros ela pegou)
SELECT emprestimo.id_emprestimo, usuario.nome, livro.titulo 
FROM emprestimo 
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
JOIN livro ON emprestimo.id_livro = livro.id_livro
WHERE usuario.nome = 'Luiza Pessoa';

-- 7. descobrir quem pegou emprestado o livro 'O Alquimista'
SELECT usuario.nome, livro.titulo 
FROM emprestimo 
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
JOIN livro ON emprestimo.id_livro = livro.id_livro
WHERE livro.titulo = 'O Alquimista';

-- 8. listar o nome do usuário e o título do livro para empréstimos ainda não devolvidos
SELECT usuario.nome, livro.titulo 
FROM emprestimo 
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
JOIN livro ON emprestimo.id_livro = livro.id_livro
WHERE data_devolucao IS NULL;

-- 📊 consultas com group by e funções

-- 9. contar quantos livros cada autor tem cadastrado
SELECT autor.nome, COUNT(*) AS total_livros
FROM livro 
JOIN autor ON livro.id_autor = autor.id_autor
GROUP BY autor.nome;

-- 10. contar quantos empréstimos cada usuário já realizou
SELECT usuario.nome, COUNT(*) AS total_emprestimos
FROM emprestimo 
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
GROUP BY usuario.nome;

-- 11. encontrar qual livro foi o mais emprestado
SELECT livro.titulo, COUNT(*) AS livro_mais_emprestado
FROM livro 
JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
GROUP BY livro.titulo
ORDER BY livro_mais_emprestado DESC
LIMIT 1;

-- 12. listar os autores e a média de ano de publicação de seus livros
SELECT autor.nome, AVG(ano_publicacao) AS media_publicacao_livros
FROM autor 
JOIN livro ON autor.id_autor = livro.id_autor
GROUP BY autor.nome;

-- 🧩 consultas complexas com múltiplos relacionamentos

-- 13. nome do autor do livro que o usuário 'Maria Silveira' pegou emprestado
SELECT autor.nome 
FROM autor 
JOIN livro ON autor.id_autor = livro.id_autor
JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
WHERE usuario.nome = 'Maria Oliveira';

-- 14. usuários (nome e telefone) que pegaram livros de autores brasileiros
SELECT DISTINCT usuario.nome, usuario.telefone 
FROM usuario 
JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario
JOIN livro ON emprestimo.id_livro = livro.id_livro
JOIN autor ON livro.id_autor = autor.id_autor
WHERE autor.nacionalidade = 'Brasil';