*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Remover post
    Create Session    api    ${BASE_URL}
    ${response}=    DELETE On Session    api    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
