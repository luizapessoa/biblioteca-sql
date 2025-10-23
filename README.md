# biblioteca-sql
# Projeto: Banco de Dados de Biblioteca (MySQL)
## Este projeto é um exercício de modelagem de dados e prática de SQL, focado na criação de um banco de dados simples para um sistema de biblioteca. O esquema foi desenvolvido utilizando o MySQL Workbench.

O objetivo principal foi aplicar e revisar conceitos de SQL, incluindo a definição de tabelas, chaves primárias, chaves estrangeiras e os relacionamentos entre elas.

---

# Entidades

O banco de dados é composto por quatro entidades principais:

autor: Armazena os dados dos autores dos livros.

livro: Armazena as informações dos livros (título, ano de publicação, etc.).

usuario: Armazena os dados dos usuários cadastrados na biblioteca.

emprestimo: Tabela que registra o histórico de empréstimos, ligando usuario e livro.

---

# Regras de Relacionamento

Os relacionamentos definidos no diagrama (DER) seguem estas regras de negócio:

Autor e Livro (1:N): Um autor pode ter escrito vários livros, mas cada livro possui apenas um autor.

Usuário e Empréstimo (1:N): Um usuário pode realizar vários empréstimos.

Livro e Empréstimo (1:N): Um livro pode estar associado a vários empréstimos ao longo do tempo (desde que em datas diferentes).

---

# Diagrama Entidade-Relacionamento (DER)

Abaixo está a representação visual do esquema do banco de dados:

<img width="1094" height="733" alt="image" src="https://github.com/user-attachments/assets/d7593b2b-62c1-4be3-aa48-484cefb4969b" />
