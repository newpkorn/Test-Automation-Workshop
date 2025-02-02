*** Comments ***
Deverlop By: Pakorn Soikham
Date: 25-01-2025


*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}          https://www.allonline.7eleven.co.th/
${BROWSER}      gc


*** Keywords ***
Open Web Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
