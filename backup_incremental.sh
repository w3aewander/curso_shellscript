#!/bin/bash
ORIGEM="/home/administrador/projetos/shellscript"
DEST="/tmp/backup"
SNAP="$DEST/backup.snar"

DATA=$(date +%Y-%m-%d_%H-%M)
ARQUIVO="$DEST/inc-$DATA.tar.gz"

tar -czg "$SNAP" -f "$ARQUIVO" "$ORIGEM"
