CREATE TABLE usuario (
  id    SERIAL PRIMARY KEY,
  nome  VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(100) NOT NULL
);

CREATE TABLE genero (
  id   SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE autor (
  id   SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE editora (
  id   SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE livro (
  id         SERIAL PRIMARY KEY,
  titulo     VARCHAR(150) NOT NULL,
  isbn       VARCHAR(20),
  sinopse    TEXT,
  paginas    INT,
  capa_url   TEXT,
  genero_id  INT REFERENCES genero(id),
  editora_id INT REFERENCES editora(id)
);

CREATE TABLE livro_autor (
  livro_id INT REFERENCES livro(id),
  autor_id INT REFERENCES autor(id),
  PRIMARY KEY (livro_id, autor_id)
);

CREATE TABLE leitura (
  id          SERIAL PRIMARY KEY,
  usuario_id  INT NOT NULL REFERENCES usuario(id),
  livro_id    INT NOT NULL REFERENCES livro(id),
  status      VARCHAR(20) NOT NULL DEFAULT 'quero_ler',
  data_inicio DATE,
  data_fim    DATE,
  nota        NUMERIC(2,1),
  review      TEXT,
  tem_spoiler BOOLEAN DEFAULT FALSE
);

CREATE TABLE meta_anual (
  id         SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL REFERENCES usuario(id),
  ano        INT NOT NULL,
  quantidade INT NOT NULL
);