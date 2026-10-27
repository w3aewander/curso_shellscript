#!/bin/bash

TO="email@docminio.com"
FROM="email@dominio.com"
SUBJECT="Relatório de Monitoramento"

ARQUIVO="caminho_do_arquivo_enexo.pdf"

BOUNDARY="====$(date +%s)===="

{
    echo "From: $FROM"
    echo "To: $TO"
    echo "Subject: $SUBJECT"
    echo "MIME-Version: 1.0"
    echo "Content-Type: multipart/mixed; boundary=\"$BOUNDARY\""
    echo

    echo "--$BOUNDARY"
    echo "Content-Type: text/plain; charset=UTF-8"
    echo
    echo "Olá,"
    echo
    echo "Segue o relatório de monitoramento em anexo."
    echo "Espaço em disco:"
    echo "$(df -h)"
    echo "Estado da memória:"
    echo "$(free -m)"

    echo "--$BOUNDARY"
    echo "Content-Type: application/pdf; name=\"$(basename "$ARQUIVO")\""
    echo "Content-Transfer-Encoding: base64"
    echo "Content-Disposition: attachment; filename=\"$(basename "$ARQUIVO")\""
    echo

    base64 "$ARQUIVO"

    echo
    echo "--$BOUNDARY--"

} | msmtp "$TO"
