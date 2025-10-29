const chat = document.getElementById('chat');
  const form = document.getElementById('chat-form');
  const input = document.getElementById('user-input');
  const themeBtn = document.getElementById('theme-btn');

  const API_URL = "http://127.0.0.1:8000/mensagem/";

  // Função para adicionar mensagens ao chat
  function addMessage(text, sender = 'user') {
    const msg = document.createElement('div');
    msg.classList.add('message', sender === 'user' ? 'user-message' : 'bot-message');
    msg.innerHTML = `
      <p>${text}</p>
      <div class="timestamp">${new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</div>
    `;
    chat.appendChild(msg);
    chat.scrollTop = chat.scrollHeight;
  }

  // Envio de mensagem ao backend
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const userText = input.value.trim();
    if (!userText) return;

    addMessage(userText, 'user');
    input.value = '';

    try {
      // Envia a mensagem para o backend FastAPI
      const res = await fetch(`${API_URL}?texto=${encodeURIComponent(userText)}`);
      const data = await res.json();

      // Exibe a resposta retornada
      if (data.mensagem) {
        addMessage(`${data.mensagem}`, 'bot');
      } else {
        addMessage('Desculpe, não consegui entender.', 'bot');
      }
    } catch (err) {
      addMessage('❌ Erro ao conectar com o servidor.', 'bot');
      console.error(err);
    }
  });

  // Alterna entre modo claro e escuro
  function toggleTheme() {
    const body = document.body;
    const current = body.getAttribute('data-theme');
    const newTheme = current === 'light' ? 'dark' : 'light';
    body.setAttribute('data-theme', newTheme);
    themeBtn.textContent = newTheme === 'light' ? '☀️' : '🌙';
  }
