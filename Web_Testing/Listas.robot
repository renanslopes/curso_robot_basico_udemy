*** Settings ***

*** Variable ***
@{CARROS}    uno   palio   clio   monza   duster

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword 01

*** Keywords ***
Uma keyword 01
    Log To Console    Lista carros: ${CARROS[0]}, ${CARROS[1]}, ${CARROS[2]}, ${CARROS[3]}, ${CARROS[4]}
