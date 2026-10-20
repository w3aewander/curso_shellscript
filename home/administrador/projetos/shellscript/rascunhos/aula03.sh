#!/bin/bash
#

# Operadores:
# 1. aritméticos, 
# 2. relacionais ou comparação e 
# 3. lógicos

#limpar a tela
clear

echo "====================="
echo "Números para cálculos"
echo "====================="

#let numero1=3
#let numero2=4

echo -n "Digite o primeiro número:";read numero1
echo -n "Digite o segundo número:"; read numero2

echo "Calculando..."

sleep 1

# 1. Operadores aritméticos
let soma=$numero1+$numero2
let subtracao=$numero1-$numero2
let multiplicacao=$numero1*$numero2
let divisao=$numero1/$numero2
let mod=$numero1%$numero2

divisao_ponto_flutuante=$(echo "scale=2; $numero1/$numero2"|bc)

echo  "$numero1 + $numero2 = $soma"
echo  "$numero1 - $numero2 = $subtracao"
echo  "$numero1 * $numero2 = $multiplicacao"
echo  "$numero1 / $numero2 = $divisao"
echo  "Divisão com resultado em ponto flutuante: $divisao_ponto_flutuante" 
echo "Resto a divisão entre \$numero1 e \$numero2: $mod" 

echo -e "Potencia: 3² = $((3**2)); 9² = $((9**2)); 3³ = $((3**3))\n"

raiz_quadrada=$(echo "sqrt(9)"|bc)
echo -e "Raiz quadrada de 9:  $raiz_quadrada" 

logaritmo=$(echo "scale=4;l(5) / l(2)"|bc -l)
echo "Logaritimo de 5 na base 2 = $logaritmo"
echo 
read >> /dev/null

