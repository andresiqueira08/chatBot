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
(4, 'não me ajudou'),
(5, 'matrícula'),
(6, 'rematrícula'),
(7, 'reabertura'),
(8, 'calendário'),
(9, 'datas'),
(10, 'início das aulas'),
(11, 'feriados'),
(12, 'trancar curso'),
(13, 'trancamento de matrícula'),
(14, 'transferência de curso'),
(15, 'troca'),
(16, 'financeiro'),
(17, 'desconto'),
(18, 'bolsa'),
(19, 'segunda via'),
(20, 'boleto'),
(21, 'contato'),
(22, 'secretaria');


-- Inserindo respostas
INSERT INTO respostas (id, resposta) VALUES 
(1, 'Entendo que você prefere falar com um atendente humano. Estou aqui para ajudar no que for possível. Entre no link a seguir para falar com um atendente: [wa.me/5581992976911].'),
(2, 'Por favor entre no link a seguir para falar com um atendente: [wa.me/5581992976911].'),
(3, 'Sinto muito por não ter conseguido ajudar. Estou aqui para tentar novamente.'),
(4, 'Lamento que minha resposta anterior não tenha sido útil. Posso tentar de novo?'),
(5, 'chat bot de atendimento da UNICAP. Para realizar sua matrícula entre no link a seguir: https://portal.unicap.br/matricula'),
(6, 'chat bot de atendimento da UNICAP. Você pode entrar no portal educacional → secretaria → requerimentos → reabertura de matrícula. Assim você abre o requerimento para reabrir sua matrícula.'),
(7,'chat bot de atendimento da UNICAP. Para consultar o calendário você pode acessar o portal do aluno e entrar na aba “Calendário” e verificar as datas necessárias.'),
(8, 'chat bot de atendimento da UNICAP. Para cosnsultar as datas do período letivo 2025.2, acesse o portal do aluno e entre na aba "Calendário".'),
(9, 'chat bot de atendimento da UNICAP. Para consultar o Início das aulas, você pode entrar no portal do aluno e entrar na aba “Calendário” e verificar a data de início.'),
(10, 'chat bot de atendimento da UNICAP. Para consultar os feriados, você pode acessar o portal do aluno e entrar na aba “Calendário” e verificar as datas que vão acontecer os feriados.'),
(11, 'chat bot de atendimento da UNICAP. Você pode entrar no portal educacional → secretaria → requerimentos → trancamento de matrícula. Assim você abre o requerimento para trancar sua matrícula.'),
(12, 'chat bot de atendimento da UNICAP. Você pode entrar no portal educacional → secretaria → requerimentos → guia de transferência. Assim você abre o requerimento para transferir o seu curso.'),
(13, 'chat bot de atendimento da UNICAP. Para consultar o financeiro você pode entrar no portal educacional e clicar na aba "financeiro" '),
(14, 'chat bot de atendimento da UNICAP. Você pode consultar e verificar opções de bolsas e/ou descontos na sua mensalidade consultando a tesouraria pelo número (81) 2119-4149.'),
(15, 'chat bot de atendimento da UNICAP. Você pode entrar no portal educacional → financeiro → boletos. Assim você abre a segunda via de boleto.'),
(16, 'chat bot de atendimento da UNICAP. Você pode consultar a secretaria pelos seguintes números:                                                          (81) 2119 - 4124                                                                                            (81) 2119 - 4188                                                                                               (81) 2119 - 4175                                                                                                            (81) 2119 - 4120                                                                                                   (81) 2119 - 4410 .');
-- Ligando palavras às respostas
INSERT INTO palavraResposta (id_palavra, id_resposta) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 11),
(14, 12),
(15, 12),
(16, 13),
(17, 14),
(18, 14),
(19, 15),
(20, 15),
(21, 16),
(22, 16);

