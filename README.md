# robot_integration-web_tests
A project that share integration tests and it´s evolution for web tests and incrise the coverage to protect booth layers;
At first i´m commit in portuguese language, after i´ll publish in english.

# 🚀 Robot Integration – Web & API Tests
## Robot Framework + Python + Browser (Playwright) + RequestsLibrary

Este repositório contém uma **documentação completa, passo a passo**, para criação de um projeto de **automação de testes** utilizando:

- **Robot Framework**
- **Python**
- **RequestsLibrary** (testes de API)
- **Browser Library + Playwright** (testes Web / UI)

O objetivo é oferecer uma base sólida para quem deseja construir um projeto **profissional**, escalável e pronto para evoluir para:

- Testes híbridos (API + UI)
- Integração com CI/CD
- Boas práticas de automação

---

# 📌 Visão geral do projeto

Neste projeto você aprenderá a:

- Criar um projeto do zero
- Configurar ambiente virtual Python (`venv`)
- Instalar e configurar Robot Framework
- Trabalhar com:
  - `GET`
  - `POST`
  - `PUT`
  - `DELETE`
- Validar respostas de API
- Preparar o ambiente para testes Web com Playwright

---

# 🌐 API utilizada

## JSONPlaceholder

API pública ideal para aprendizado.

**URL base:**
https://jsonplaceholder.typicode.com


> ⚠️ As operações de escrita são simuladas (não persistem dados), mas os retornos são perfeitos para testes automatizados.

---

# 🛠️ Pré-requisitos

No Windows, instale:

- **Python 3.8+**
- **Node.js 16+** (necessário para Playwright)

Verifique:

```bash
python --version
node --version

📁 Criação do projeto

mkdir Robot_integration-web_tests
cd Robot_integration-web_tests


🐍 Configuração do ambiente virtual

Criar venv

python -m venv venv


Ativar venv

venv\Scripts\activate

Após ativar, você verá:

(venv)

📦 Instalação das dependências

Com o venv ativo:

pip install robotframework
pip install robotframework-requests
pip install robotframework-browser

🎭 Instalar Playwright

rfbrowser init

🗂️ Estrutura do projeto

Robot_integration-web_tests/
│
├── tests/
│   ├── api_get.robot
│   ├── api_post.robot
│   ├── api_put.robot
│   └── api_delete.robot
│
├── results/
├── venv/
└── README.md

🧪 Testes de API com Robot Framework
📄 1️⃣ GET — Consultar recurso

Arquivo: tests/api_get.robot

*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Validar retorno da API de Posts
    Create Session    api    ${BASE_URL}
    ${response}=    GET On Session    api    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    userId
    Dictionary Should Contain Key    ${response.json()}    id
    Dictionary Should Contain Key    ${response.json()}    title
    Dictionary Should Contain Key    ${response.json()}    body

📄 2️⃣ POST — Criar recurso

Arquivo: tests/api_post.robot

*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Criar novo post
    Create Session    api    ${BASE_URL}
    ${payload}=    Create Dictionary
    ...    title=Meu Post de Teste
    ...    body=Conteúdo do post
    ...    userId=1

    ${response}=    POST On Session    api    /posts    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    201


📄 3️⃣ PUT — Atualizar recurso

Arquivo: tests/api_put.robot

*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Atualizar post existente
    Create Session    api    ${BASE_URL}
    ${payload}=    Create Dictionary
    ...    id=1
    ...    title=Post Atualizado
    ...    body=Novo conteúdo
    ...    userId=1

    ${response}=    PUT On Session    api    /posts/1    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200


📄 4️⃣ DELETE — Remover recurso

Arquivo: tests/api_delete.robot

*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Remover post
    Create Session    api    ${BASE_URL}
    ${response}=    DELETE On Session    api    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200


▶️ Executando os testes

Na raiz do projeto:

robot -d results tests


📊 Relatórios

Após a execução:

results/
├── report.html
└── log.html

Abra no navegador para ver:

Status dos testes

Logs detalhados

Evidências de execução

❌ Erro comum: RequestsLibrary não encontrada

Importing test library 'RequestsLibrary' failed:
ModuleNotFoundError: No module named 'RequestsLibrary'


✅ Como resolver

Ative o venv:
venv\Scripts\activate

Reinstale:
pip install robotframework-requests

Confirme:
pip list

Execute novamente:
robot -d results tests


🧭 Próximas evoluções do projeto

🔎 Validação avançada de JSON

📱 Projeto híbrido (API + UI com Browser/Playwright)

🔁 Integração com CI/CD (GitHub Actions / GitLab CI)

🧩 Page Objects + Keywords reutilizáveis 🙌
