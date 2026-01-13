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