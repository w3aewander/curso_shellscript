#!/bin/bash

# Convenções
# snake case:  minha_funcao
# pascal case: Minha_Funcao
# camel case:  minhaFuncao

# parâmetros
# $0, $1, $2,..., $n

minha_funcao() {
    param1="$1"
    echo "Olá  ${param1}!"
}

# Chamando a função
minha_funcao "Wanderlei Silva"
