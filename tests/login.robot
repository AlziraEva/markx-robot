*** Settings ***
Documentation       Testes de Login

Resource        ../resources/base.resource
#Executa antes de cada teste
Test Setup      Start session 
#Executa depois de cada teste
Test Teardown   Finish session

*** Test Cases ***
Deve logar com sucesso   

    Do login
    Wait Until Page Contains     Minhas tarefas     5 

    

    