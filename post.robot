*** Settings *** 
Library  RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://crudcrud.com/api/dd04c3480353463981ad89ab0304fabb


*** Test Cases ***
Cenário1: Realizando cadastro
    ${addcrud}=    Create Dictionary  name=Amanda    age=28    colour=rosa

    Log    ${addcrud}

    #Enviando a solicitação POST
    ${response}=    POST     ${BASE_URL}/unicorns    json=${addcrud}
    Log    ${response.text}
    Log    ${response.status_code}
    Log    ${response.reason}

    #Validação do status
    Should Be True    ${response.ok}
    Should Be Equal As Numbers  ${response.status_code}    200

    #Validando os valores retornados
    ${crud}=    Set Variable    ${response.json()}
    # Exibe o conteúdo do dicionário para identitificar as chaves disponíveis
    Log Dictionary    ${crud} 

    #Validação dos valores dentro da chave crud
    ${crud_info}=    Get From Dictionary    dictionary    ${crud}    crud
    Should Be Equal As Strings    ${crud_info[name]}    123456
    Should Be Equal As Strings    ${crud_info[age]}    28
    Should Be Equal As Strings    ${crud_info[colour]}    rosa

