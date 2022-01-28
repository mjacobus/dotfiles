#!/bin/sh

URL=$1

BASENAME=`basename $URL`

OUTPUT_FILE=`echo $BASENAME | cut -d '?' -f 1`

DOWNLOAD_PATH="/home/downloader"

USERNAME=downloader

HOST=rubyjobsbrazil.com.br

ssh_command() {
  CMD=$1
  echo "Executing: $CMD\n"
  `ssh $USERNAME@$HOST "echo $CMD >> ~/ssh_commands.log"`
  `ssh $USERNAME@$HOST "$CMD"`
}

download_file() {
  FILE=$1
  echo "Dowloading ${FILE}..."
  CMD="scp $USERNAME@$HOST:$FILE ."
  `$CMD`
}

if [ -f $OUTPUT_FILE ]; then
  echo "File ${OUTPUT_FILE} was already downloaded."
else
  ssh_command "cd $DOWNLOAD_PATH && wget --no-check-certificate -c $URL -O $OUTPUT_FILE" && \
  download_file "$DOWNLOAD_PATH/$OUTPUT_FILE"
fi
