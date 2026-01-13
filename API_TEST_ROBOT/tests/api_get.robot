*** Settings ***

Library      RequestsLibrary
Library      Collections
Library      Browser


*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com


*** Test Cases ***
Validar retorno da API de Posts
    Criar Sessão API
    Obter Post Por ID
    Validar Status Code
    Validar Campos do Retorno


*** Keywords ***
Criar Sessão API
    Create Session       jsonplaceholder    ${BASE_URL}

Obter Post Por ID
    ${response}=    GET On Session    jsonplaceholder    /posts/1
    Set Test Variable    ${response}

Validar Status Code
    Should Be Equal As Integers    ${response.status_code}    200

Validar Campos do Retorno
    Dictionary Should Contain Key    ${response.json()}    userId
    Dictionary Should Contain Key    ${response.json()}    id
    Dictionary Should Contain Key    ${response.json()}    title
    Dictionary Should Contain Key    ${response.json()}    body
