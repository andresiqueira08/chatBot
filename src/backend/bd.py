import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="senha workbench",
        database="chatBot"
    )

def buscar_resposta(palavra):
    conexao = conectar()
    cursor = conexao.cursor()

    sql = """
    SELECT r.resposta 
    FROM respostas r
    JOIN palavraResposta pr ON r.id = pr.id_resposta
    JOIN palavrasChave p ON p.id = pr.id_palavra
    WHERE LOWER(p.palavra) = %s
    """
    cursor.execute(sql, (palavra.lower(),))
    resultado = cursor.fetchone()

    conexao.close()

    if resultado:
        return resultado[0]
    else:
        return None

