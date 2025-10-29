from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from dialogflow_api import detectar_intencao
from bd import buscar_resposta
import uuid
import os

app = FastAPI()
PROJECT_ID = "maria-id"

# Caminho para a pasta do frontend
frontend_dir = os.path.join(os.path.dirname(__file__), "../frontend")

# Serve arquivos estáticos (HTML, CSS, JS)
app.mount("/static", StaticFiles(directory=frontend_dir), name="static")

@app.get("/")
def serve_index():
    """Serve o arquivo index.html na raiz"""
    return FileResponse(os.path.join(frontend_dir, "index.html"))

@app.get("/mensagem/")
def responder(texto: str, usuario: str | None = None):
    if not usuario:
        usuario = str(uuid.uuid4())[:8]

    # 1️⃣ Primeiro verifica no banco de dados
    for palavra in texto.split():
        resposta_bd = buscar_resposta(palavra)
        if resposta_bd:
            return {"origem": "banco_de_dados", "mensagem": resposta_bd, "palavra": palavra}

    # 2️⃣ Depois tenta o Dialogflow
    resultado = detectar_intencao(PROJECT_ID, usuario, texto, "pt-BR")

    if resultado and resultado.fulfillment_text:
        return {
            "origem": "dialogflow",
            "mensagem": resultado.fulfillment_text,
            "intencao": resultado.intent.display_name
        }

    # 3️⃣ Caso nenhum reconheça
    return {
        "origem": "nenhuma",
        "mensagem": "Não encontrei resposta no banco nem no Dialogflow.",
        "intencao": "Default Fallback Intent"
    }
