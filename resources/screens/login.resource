*** Settings ***
Documentation       Elementos e ações da tela de login

Library     AppiumLibrary

*** Variables ***
${API_IP}       192.168.101.8

*** Keywords ***
Do login
    Input text         xpath=//*[@resource-id="apiIp"]        ${API_IP}
    Click Element      xpath=//*[@resource-id="signInButton"]