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