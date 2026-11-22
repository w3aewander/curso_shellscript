#!/bin/bash
#

centralizar() {

    largura=$(tput cols)
 
    printf "%*s\n" $(((${#1}+largura)/2)) "\e[1;7;32m$1\e[0m"
    echo -e "\e[0m"
}

#centralizar "Texto Centralizado na Tela"

