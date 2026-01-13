*** Keywords ***
Validar estrutura do post
    [Arguments]    ${post}
    Dictionary Should Contain Key    ${post}    userId
    Dictionary Should Contain Key    ${post}    id
    Dictionary Should Contain Key    ${post}    title
    Dictionary Should Contain Key    ${post}    body
