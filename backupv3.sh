#!/bin/bash
#

# definição de variáveis
export FILES_TO_BACKUP="files_to_backup.txt"
export LOG_DIR="/tmp/log"
export BACKUP_DIR="/tmp/backup"
export BACKUP_DATE=$(date "+%Y%m%d_%H%M%S")
export SOURCE_DIR="/home/administrador/projetos/shellscript"
export LOG_FILE="${LOG_DIR}/log_${BACKUP_DATE}.log"
export IGNORE_FILES="/.git|.bkp|files_to_backup|.tmp/"
export TAR_BALL="${BACKUP_DIR}/backup_${BACKUP_DATE}.tar.gz"

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
[ -e  ${FILES_TO_BACKUP} ] && rm -f "${FILES_TO_BACKUP}" 


find ${SOURCE_DIR} |egrep  -i -v  ${IGNORE_FILES} > ${FILES_TO_BACKUP} && echo "Lista de arquivos para backup foi gerada..."

# Remove a primeira linha do arquivo files_to_backup contendo o caminho absoluto do diretorio atual
sed -i '1d' "${FILES_TO_BACKUP}"

# verifica se o comando anterior foi executado sem erro [erro=1]
if [ $? -ne 0 ];then  
  echo "Erro ao executar o comando sed para remover a primeira linha "
  exit 1
fi 

# Verifica se a lista de arquivos foi gerada pelo comando find anterior...
[ ! -e ${FILES_TO_BACKUP} ] &&  echo "Lista de arquivos para backup não encontrada" 

# Verificar se o diretório de origem existe
[ ! -d ${SOURCE_DIR} ] && echo -e "Diretório ${SOURCE_DIR} não existe.\nVerifique!" && exit 1 


# Se o diretório LOG_DIR não existe então cria
[ ! -d ${LOG_DIR} ] && mkdir ${LOG_DIR}

# Se o diretório de destino de backup não existe crie
[ ! -d ${BACKUP_DIR} ] && mkdir ${BACKUP_DIR}

[ -f ${FILES_TO_BACKUP} ] || echo "Lista de arquivos para backup não encontrada"

# Se tudo deu certo até aqui execute o backup
tar -czvf ${TAR_BALL} -T ${FILES_TO_BACKUP} && echo "Backup realizado com sucesso" || echo "Erro ao tentar compactar os arquivos"

[ -f ${TAR_BALL} ] && echo "Backup concluido com sucesso  em ${TAR_BALL}" >> ${LOG_FILE}

md5sum "${TAR_BALL}" >> "${TAR_BALL}.md5sum.txt"
resultado=$(tar -ztvf ${TAR_BALL} > /dev/null )

echo "${resultado}" >> "${LOG_FILE}"

#fim da automação do backup
