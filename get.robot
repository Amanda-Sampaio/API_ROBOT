*** Settings *** 
Library  RequestsLibrary
Library    Collections

*** Test Cases ***
Cenário 1: Realizando consulta
    ${response}=    GET    https://crudcrud.com/api/dd04c3480353463981ad89ab0304fabb/unicorns
    Log    ${response.text} 
    Should Be True  ${response.ok}
    Should Be Equal As Strings  ${response.status_code}  200

Cenário 2: Realizando consulta por id
    ${response}=    GET   https://crudcrud.com/api/dd04c3480353463981ad89ab0304fabb/unicorns/67f1d158c12ab503e86d23de

    # Verificando name
    ${namevalue}=    Get From Dictionary    ${response.json()}    name
    Should Be Equal As Strings    ${namevalue}    Amanda

    #Verificando age
    ${agevalue}=      Get From Dictionary    ${response.json()}    age
    Should Be Equal As Strings     ${agevalue}    28

    #Verificando colour
    ${colourvalue}=    Get From Dictionary    ${response.json()}    colour
    Should Be Equal As Strings    ${colourvalue}    rosa