#!/bin/sh

URL=$1

BASENAME=`basename $URL`

OUTPUT_FILE=`echo $BASENAME | cut -d '?' -f 1`

DOWNLOAD_PATH="/home/downloader"

ssh_command() {
  CMD=$1
  echo "Executing: $CMD\n"
  `ssh downloader@rubyjobsbrazil.com.br "echo $CMD >> ~/ssh_commands.log"`
  `ssh downloader@rubyjobsbrazil.com.br "$CMD"`
}

download_file() {
  FILE=$1
  echo "Dowloading ${FILE}..."
  CMD="scp downloader@rubyjobsbrazil.com.br:$FILE ."
  `$CMD`
}

if [ -f $OUTPUT_FILE ]; then
  echo "File ${OUTPUT_FILE} was already downloaded."
else
  ssh_command "wget -c $URL -O $OUTPUT_FILE" && \
  download_file "$DOWNLOAD_PATH/$OUTPUT_FILE"
fi
