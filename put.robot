*** Settings *** 
Library  RequestsLibrary

*** Variables ***
${BASE_URL}    https://crudcrud.com/api/dd04c3480353463981ad89ab0304fabb/unicorns


*** Test Cases ***
Cenário1: Atualizando cadastro
    ${addcrud}=    Create Dictionary  name=Amanda    age=29    colour=Laranja

    Log    ${addcrud}

    #Enviando a solicitação PUT
    ${response}=    PUT    ${BASE_URL}/67f1e2b0c12ab503e86d23e6    json=${addcrud}
    Log    ${response.text}
    Log    ${response.status_code}
    Log    ${response.reason}

    #Validação do status
    Should Be True    ${response.ok}
    Should Be Equal As Numbers  ${response.status_code}    200
