#!/bin/bash
#
# frutas=("Banana" "Maçã" "Limão" "Pêra")

# numeros=(1 2 3 4 5 6 7 8 9)

# echo "Elementos da lista frutas:  ${frutas[@]}"
# echo "Quantidade de elementos da lista frutas:  ${#frutas[@]}"

# # Percorrer a lista de frutas
# posicao=0



# for fruta in ${frutas[@]}
# do
#     echo "Fruta - ${posicao} : $fruta"
#     if [ "$fruta" == "Limão"  ]
#     then
#         echo "Gosto muito do suco de  $fruta"
#     fi
#     ((posicao++))   
# done

# echo "Elementos da lista numeros:  ${numeros[@]}"
# echo "Quantidade de elementos da lista numeros:  ${#numeros[@]}"

# posicao=0
# for numero in ${numeros[@]}
# do
#     echo "Numero - ${posicao} : $numero"
#     ((posicao++))
# done


declare -a frutas

#Definir elementos da lista frutas
frutas[0]="Banana"
frutas[1]="Maçã"
frutas[2]="Limão"
frutas[3]="Pêra"
frutas[4]="Uva"
frutas[5]="Melancia"

echo "Inserindo elementos na lista frutas:  ${frutas[@]}"

read -p "Digite o nome de uma fruta: " fruta
frutas[6]="$fruta"


echo "Elementos da lista frutas:  ${frutas[@]}"
echo "Quantidade de elementos da lista frutas:  ${#frutas[@]}"

# Mostrar pedaços da lista frutas
echo "Elementos da lista frutas do 0 ao 3: ${frutas[@]:0:4}"
echo "Elementos da lista frutas do 2 ao 5: ${frutas[@]:2:4}"

# Mostrar o enésimo elemento da lista frutas
echo "Elemento da lista frutas na posição 3: ${frutas[3]}"

# Mostrar o último elemento da lista frutas
echo "Último elemento da lista frutas: ${frutas[${#frutas[@]}-1]}"


read fim > /dev/null

