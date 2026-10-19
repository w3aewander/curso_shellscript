#!/bin/bash
#

FILES_TO_BACKUP="files_to_backup.txt"
LOG_DIR="/tmp/log"
BACKUP_DIR="/tmp/backup"
BACKUP_DATE=$(date "+%Y%m%d_%H%M%S")
SOURCE_DIR="/home/administrador/projetos/cursos/shellscript"
LOG_FILE="${LOG_DIR}/log_${BACKUP_DATE}.log"
IGNORE_FILES="/.git|.bkp|files_to_backup|.tmp/"
TAR_BALL="${BACKUP_DIR}/backup_${BACKUP_DATE}.tar.gz"

echo "----------------------"
echo "INSPEÇÃO DAS VARIÁVEIS"
echo "----------------------"

echo "FILES_TO_BACKUP: ${FILES_TO_BACKUP}"
echo "LOG_DIR........: ${LOG_DIR}"
echo "BACKUP_DIR.....: ${BACKUP_DIR}"
echo "BACKUP_DATE....: ${BACKUP_DATE}" 
echo "LOG_FILE.......: ${LOG_FILE}"
echo "IGNORE_FILES...: ${IGNORE_FILES}"
echo "TAR_BALL.......: ${TAR_BALL}"


# remover a lista de arquivos para backup gerada pelo processo de backup anterior
rm -f "${FILES_TO_BACKUP}"

find ${SOURCE_DIR} |egrep  -i -v  ${IGNORE_FILES} > ${FILES_TO_BACKUP} && echo "Lista de arquivos para backup foi gerada..." 

if [ $? -eq 0 ]; then  echo "Comando executado com sucesso..." ; else echo "Erro..."; exit 1; fi 

# Verifica se a lista de arquivos foi gerada pelo comando find anterior...
[ ! -f $FILES_TO_BACKUP ] &&  echo "Lista de arquivos para backup não encontrada" 


# Verificar se o diretório de origem existe
[ ! -d $SOURCE_DIR ] && echo -e "Diretório ${SOURCE_DIR} não existe.\nVerifique!" && exit 1 


# Se o diretório LOG_DIR não existe então cria
[ ! -d $LOG_DIR ] && mkdir $LOG_DIR

# Se o diretório de destino de backup não existe crie
[ ! -d $BACKUP_DIR ] && mkdir $BACKUP_DIR

# Comando realizando
# [ -d $LOG_DIR ] && [ -d $BACKUP_DIR ] && cp -av $SOURCE_DIR $BACKUP_DIR  >> $LOG_FILE && echo "Backup concluido com sucesso!" >> $LOG_FILE || echo "Ocorreu um erro ao tentar realizar o backup" >> $LOG_FILE


if [ $? -eq 0 ]; then  echo "Comando executado com sucesso..." ; else echo "Erro..."; exit 1; fi 

[ -f $FILES_TO_BACKUP ] || echo "Lista de arquivos para backup não encontrada"

# Se tudo deu certo até aqui execute o backup
tar -czvf ${TAR_BALL} -T ${FILES_TO_BACKUP} && echo "Backup realizado com sucesso" || echo "Erro ao tentar compactar os arquivos"



[ -f $TAR_BALL ] && echo "Backup concluido com sucesso  em ${TAR_BALL}" >> $LOG_FILE

#fim da automação do backup
