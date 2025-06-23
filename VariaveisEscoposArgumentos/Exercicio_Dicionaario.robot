*** Settings ***
Documentation   Prática de tipo de variáveis - Dicionário

*** Variables ***
&{MES}  mes1=Janeiro    mes2=Fevereiro   mes3=Março   mes4=Abril   mes5=Maio    mes6=Junho   mes7=Julho
...    mes8=Agosto  mes9=Setembro    mes10=Outubr     mes11=Novembro  mes12=Dezembro

*** Test Cases ***
Caso de teste 01
    Keyword 01

*** Keywords ***
Keyword 01
    Log To Console    message=${MES.mes1} tem 31 dias
    Log To Console    message=${MES.mes2} tem 28 dias
    Log To Console    message=${MES.mes3} tem 31 dias
    Log To Console    message=${MES.mes4} tem 30 dias
    Log To Console    message=${MES.mes5} tem 31 dias
    Log To Console    message=${MES.mes6} tem 30 dias
    Log To Console    message=${MES.mes7} tem 31 dias
    Log To Console    message=${MES.mes8} tem 31 dias
    Log To Console    message=${MES.mes9} tem 3 dias
    Log To Console    message=${MES.mes10} tem 31 dias
    Log To Console    message=${MES.mes11} tem 30 dias
    Log To Console    message=${MES.mes12} tem 31 dias
