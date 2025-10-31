# 📚 biblioteca-sql - Projeto: Banco de Dados de Biblioteca (MySQL)

# biblioteca-sql  
**Projeto: Banco de Dados de Biblioteca (MySQL)**  

Este projeto é um exercício de modelagem de dados e prática de SQL, focado na criação de um banco de dados simples para um sistema de biblioteca.  
O esquema foi desenvolvido utilizando o MySQL Workbench.  

🎯 Objetivo principal:  
Aplicar e revisar conceitos de banco de dados relacionais, normalização, relacionamentos e consultas SQL (SELECT, JOIN, filtros, etc).

---

## Entidades

O banco de dados é composto por quatro entidades principais:

* `autor`: Armazena os dados dos autores dos livros.
* `livro`: Armazena as informações dos livros (título, ano de publicação, etc.).
* `usuario`: Armazena os dados dos usuários cadastrados na biblioteca.
* `emprestimo`: Tabela que registra o histórico de empréstimos, ligando `usuario` e `livro`.
---

## Regras de Relacionamento

Os relacionamentos definidos no diagrama (DER) seguem estas regras de negócio:

Autor e Livro (1:N): Um autor pode ter escrito vários livros, mas cada livro possui apenas um autor.

Usuário e Empréstimo (1:N): Um usuário pode realizar vários empréstimos.

Livro e Empréstimo (1:N): Um livro pode estar associado a vários empréstimos ao longo do tempo (desde que em datas diferentes).

---

## Diagrama Entidade-Relacionamento (DER)

Abaixo está a representação visual do esquema do banco de dados:

<img width="1137" height="738" alt="image" src="https://github.com/user-attachments/assets/5b766659-cab2-424a-bd49-285e2a9b3387" />

---

## Estrutura do projeto

Abaixo está a estrutura de arquivos contidos neste repositório:

* `biblioteca-sql/`
    * `schema.sql`: Contém o script de criação de todas as tabelas (DDL).
    * `consultas.sql`: Contém todas as consultas de prática (DML).
    * `README.md`: Este arquivo.

## Consultas e Exemplos de SQL

Este projeto demonstra a aplicação prática de consultas SQL para análise de dados em um banco de dados de biblioteca.
O banco foi testado com 14 consultas, abordando desde filtros simples (WHERE, LIKE) até análises mais avançadas com JOIN, GROUP BY e funções de agregação.

🔗 **[Veja o script completo com todas as 14 consultas aqui](./consultas-.sql)**

### Exemplos de Consultas  

#### 1. Consulta simples com `SELECT`  
**Objetivo:** Encontrar todos os livros do gênero *Suspense*.  

```
SELECT titulo, genero 
FROM livro 
WHERE genero = 'Suspense';
```

#### 2. Consulta com JOIN

**Objetivo:** Descobrir o nome de todos os livros escritos pelo autor Rafael Montes.

```SELECT livro.titulo, autor.nome 
FROM livro 
JOIN autor ON autor.id_autor = livro.id_autor
WHERE autor.nome = 'Rafael Montes';
```

#### 3. Consulta com GROUP BY e Função de Agregação

**Objetivo:** Encontrar qual é o livro mais emprestado.

```
SELECT livro.titulo, COUNT(*) AS livro_mais_emprestado
FROM livro 
JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
GROUP BY livro.titulo
ORDER BY livro_mais_emprestado DESC
LIMIT 1;
```

#### 4. Consulta com Múltiplos Relacionamentos

**Objetivo:** Exibir o nome do autor do livro que o usuário Maria Oliveira pegou emprestado.

```
SELECT autor.nome 
FROM autor 
JOIN livro ON autor.id_autor = livro.id_autor
JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
WHERE usuario.nome = 'Maria Oliveira';
```
