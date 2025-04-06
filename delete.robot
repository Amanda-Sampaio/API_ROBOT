*** Settings *** 
Library  RequestsLibrary

*** Test Cases ***
Cenário 1: Excluindo cadastro
    ${response}=    DELETE   https://crudcrud.com/api/dd04c3480353463981ad89ab0304fabb/unicorns/67f1d158c12ab503e86d23de
    
    #Validação do status
    Should Be True    ${response.ok}
    Should Be Equal As Numbers  ${response.status_code}    200

