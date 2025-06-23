*** Settings ***
Documentation   Exercício sobre IFs e Loops

*** Variables ***
@{NUMEROS}   1    2    3    4    5    6    7    9    10
${NUMBER}    0

*** Test Case ***
Teste para Exercicio
    Usando FOR IN
    IF  ${NUMBER} == 5
    Usando FOR IN
        Log    message=Eu sou o número 5!  console=True
    ELSE IF    ${NUMBER} == 10
    Usando FOR IN
        Log  message=u sou o número 10!  console=True
    END

*** Keywords ***
Usando FOR IN
    Log To Console    ${\n}
    FOR  ${NUMBER}   IN  @{NUMEROS}
        Log To Console    Meu número é: ${NUMBER}!
        No Operation
    END
