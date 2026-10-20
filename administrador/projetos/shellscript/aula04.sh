#!/bin/bash

#------------ comentário ---------------

#
# Dados para cálculo
#

nome="Wanderlei"
ano_nascimento=$((1965))
ano_atual=$(date "+%Y")
idade=$(($ano_atual - $ano_nascimento))
altura=$( echo "scale=2;1.85"|bc )
peso=$( echo "scale=2;114"|bc )

# Limpar a tela
 clear

# Calculando o IMC
imc=$( echo "scale=2;$peso/ ($altura * $altura)"|bc )

# Exibindo o resultado
printf "\n\n%s você informou que nasceu no ano %d e como estamos atualmente no ano de %d fazendo os cálculos descobri que você tem %d anos de idade.\n" "$nome" "$ano_nascimento" "$ano_atual" "$idade"


printf "\n\nFicha técnica:\n\n Peso: %.2f\n Altura: %.2f\n IMC: %.2f\n" "$peso" "$altura" "$imc" 

echo -e "\n\Pressione qualquer tecla para continuar..."

read >> /dev/null

clear


