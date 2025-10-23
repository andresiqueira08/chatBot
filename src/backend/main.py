from fastapi import FastAPI
from dialogflow_api import detectar_intencao
from bd import buscar_resposta
import uuid

app = FastAPI()

PROJECT_ID = "maria-id"  # Substitua pelo seu Project ID do Dialogflow

@app.get("/mensagem/")
def responder(texto: str, usuario: str | None = None):
    if not usuario:
        usuario = str(uuid.uuid4())[:8]

    # Detecta intenção e pega tanto o nome quanto o texto de resposta do Dialogflow
    resultado_dialogflow = detectar_intencao(PROJECT_ID, usuario, texto)

    intencao = resultado_dialogflow.get("intencao")
    resposta_dialogflow = resultado_dialogflow.get("resposta")

    # Se o Dialogflow respondeu algo, retorna isso
    if resposta_dialogflow and intencao.lower() != "default fallback intent":
        return {"mensagem": resposta_dialogflow}

    # Caso contrário, tenta achar no banco de dados
    resposta_bd = buscar_resposta(texto.lower())

    if resposta_bd:
        return {"mensagem": resposta_bd}

    return {"mensagem": "Não entendi bem sua dúvida. Você poderia repetir?"}
