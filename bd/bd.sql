CREATE DATABASE IF NOT EXISTS chatBot;
USE chatBot;

CREATE TABLE palavrasChave(
    id INT PRIMARY KEY AUTO_INCREMENT,
    palavra VARCHAR(100) NOT NULL
);

CREATE TABLE respostas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    resposta TEXT NOT NULL
);

CREATE TABLE palavraResposta (
    id_palavra INT,
    id_resposta INT,
    PRIMARY KEY (id_palavra, id_resposta),
    FOREIGN KEY (id_palavra) REFERENCES PalavraChave(id_palavra),
    FOREIGN KEY (id_resposta) REFERENCES Resposta(id_resposta)
);