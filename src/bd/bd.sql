CREATE DATABASE IF NOT EXISTS chatBot;
USE chatBot;

-- Tabela de palavras-chave
CREATE TABLE palavrasChave (
    id INT AUTO_INCREMENT PRIMARY KEY,
    palavra VARCHAR(100) NOT NULL
);

-- Tabela de respostas prontas
CREATE TABLE respostas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    resposta TEXT NOT NULL
);

-- Tabela associativa (muitos-para-muitos)
CREATE TABLE palavraResposta (
    id_palavra INT,
    id_resposta INT,
    PRIMARY KEY (id_palavra, id_resposta),
    FOREIGN KEY (id_palavra) REFERENCES palavrasChave(id),
    FOREIGN KEY (id_resposta) REFERENCES respostas(id)
);

-- Inserindo palavras-chave
INSERT INTO palavrasChave (id, palavra) VALUES 
(1, 'humano'),
(2, 'atendente'),
(3, 'não consegui entender'),
(4, 'não me ajudou');

-- Inserindo respostas
INSERT INTO respostas (id, resposta) VALUES 
(1, 'Entendo que você prefere falar com um atendente humano. Estou aqui para ajudar no que for possível. Entre no link a seguir para falar com um atendente: [wa.me/5581992976911].'),
(2, 'Por favor entre no link a seguir para falar com um atendente: [wa.me/5581992976911].'),
(3, 'Sinto muito por não ter conseguido ajudar. Estou aqui para tentar novamente.'),
(4, 'Lamento que minha resposta anterior não tenha sido útil. Posso tentar de novo?');

-- Ligando palavras às respostas
INSERT INTO palavraResposta (id_palavra, id_resposta) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);
