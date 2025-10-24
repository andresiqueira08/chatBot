import os
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = r"caminho"

from google.cloud import dialogflow_v2 as dialogflow

def detectar_intencao(project_id, session_id, text, language_code):
    session_client = dialogflow.SessionsClient()
    session = session_client.session_path(project_id, session_id)

    text_input = dialogflow.TextInput(text=text, language_code=language_code)
    query_input = dialogflow.QueryInput(text=text_input)

    response = session_client.detect_intent(request={"session": session, "query_input": query_input})

    print("Texto:", response.query_result.query_text)
    print("Intenção:", response.query_result.intent.display_name)
    print("Resposta:", response.query_result.fulfillment_text)

    return response.query_result
