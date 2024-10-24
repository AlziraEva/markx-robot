*** Settings ***
Documentation       Suite de testes de cadastro de tarefas

Resource    ${EXECDIR}/resources/base.resource

Test Setup      Start session
Test Teardown   Finish session
 
*** Test Cases ***
Deve poder cadastrar uma nova tarefas

    ${task}     Set Variable      Estudar Python  
    Remove task from database     ${task}

    Do login 
    Create a new task       ${task}   
    Should have task        ${task}


Deve poder remover uma tarefa indesejada
    [Tags]      remove

    # Dado que eu tenho uma tarefa indesejada
    ${task}     Set Variable      Comprar refrigerante
    Remove task from database     ${task}

    # E essa foi cadastrada no sistema
    Do login 
    Create a new task       ${task} 
    Should have task        ${task} 

    # Quando faço a exclusão dessa tarefa
    Remove task by name                     ${task}

    # Então essa tarefa some da tela
    Wait Until Page Does Not Contain        ${task}


Deve poder concluir uma tarefa
    [Tags]      done

    # Dado que eu tenho uma tarefa que desejo concluir
    ${task}     Set Variable      Estudar XPath
    Remove task from database     ${task}

    # E essa foi cadastrada no sistema
    Do login 
    Create a new task       ${task} 
    Should have task        ${task} 

    # Quando marco como concluida
    Finish task             ${task}

    # Então essa tarefa é marcada como concluida
    Task should be done     ${task}


    

