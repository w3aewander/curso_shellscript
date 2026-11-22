#!/bin/bash
#
clear

# Cores
VERDE="\e[32m"
VERMELHO="\e[31m"
AZUL="\e[34m"
AMARELO="\e[33m"
RESET="\e[0m"


# Registra logs no arquivo usuarios.log
registrar_log() {

if [ ! -f "usuarios.log" ]; then
     echo "arquivo não existe"
     echo "Criando o arquivo usuarios.log"
     touch "usuarios.log"
fi
    echo "$(date '+%d/%m/%Y %H:%M:%S') - $1" \
    >> usuarios.log
}

# Centralizar na tela o texto informado no parâmetro
centralizar() {

    largura=$(tput cols)

    printf "%*s\n" $(((${#1}+largura)/2)) "$1"
}

listar_csv() {

    echo

    printf "%-20s %-20s\n" "USUARIO" "SENHA"

    echo "----------------------------------------"

    tail -n +2 usuarios.csv | while IFS=';' read usuario senha
    do
        printf "%-20s %-20s\n" "$usuario" "$senha"
    done

    echo
}


usuario_existe() {

    id "$1" &>/dev/null
}

criar_usuarios() {

    tail -n +2 usuarios.csv |

    while IFS=';' read usuario senha
    do

        if usuario_existe "$usuario"
        then

            echo "[INFO] $usuario já existe"
            registrar_log "CRIACAO IGNORADA: usuario $usuario ja existe"

        else

            useradd -m "$usuario"

            echo "$usuario:$senha" | chpasswd

            echo "[OK] $usuario criado"

            registrar_log "USUARIO $usuario CRIADO"

        fi

    done
}

remover_usuarios() {

    tail -n +2 usuarios.csv |

    while IFS=';' read usuario senha
    do

        if usuario_existe "$usuario"
        then

            userdel -r "$usuario"

            echo "[OK] $usuario removido"

            registrar_log "USUARIO $usuario REMOVIDO"

        else

            echo "[INFO] $usuario inexistente"

            registrar_log "REMOCAO IGNORADA: usuario $usuario nao existe"

        fi

    done
}

function main() {

echo -e "${AZUL}"
centralizar "================================"
centralizar "GERENCIADOR DE USUARIOS"
centralizar "================================"
echo -e "${RESET}"

PS3="Escolha uma opção: "

select opcao in \
"Listar CSV" \
"Criar Usuarios" \
"Remover Usuarios" \
"Sair"
do

    case $REPLY in

        1)
            listar_csv
            ;;
        2)
            criar_usuarios
            ;;
        3)
            remover_usuarios
            ;;
        4)
            break
            ;;
        *)
            echo "Opcao invalida"
            ;;
    esac

done

}

# Chamando a função principal...
main

