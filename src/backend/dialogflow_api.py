from google.cloud import dialogflow_v2 as dialogflow
import os
from dotenv import load_dotenv

load_dotenv()
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "chave-dialogflow.json"

def detectar_intencao(project_id, session_id, texto, linguagem="pt-BR"):
    client = dialogflow.SessionsClient()
    session = client.session_path(project_id, session_id)

    texto_input = dialogflow.types.TextInput(text=texto, language_code=linguagem)
    query_input = dialogflow.types.QueryInput(text=texto_input)
    response = client.detect_intent(session=session, query_input=query_input)

    return {
        "intencao": response.query_result.intent.display_name,
        "resposta": response.query_result.fulfillment_text
    }
