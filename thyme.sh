# Add the following line after typing the command: crontab -e
# * * * * * sh $HOME/dotfiles/thyme.sh >>$HOME/Desktop/Thyme/thyme.log 2>&1
#
# You can also verify the crontab file by, 
# sudo cat /var/spool/cron/crontabs/jayaprakashs
#
# Crontab doesn't set all env variables. We need to set the right display for crontab to run.
export DISPLAY=:0

ROOT_DIR=$HOME/Desktop/Thyme/
THYME_BINARY=$HOME/go/bin/thyme

DIR_PREFIX=`date +%Y/%m`
FILE_PREFIX=`date +%Y-%m-%d-%H`
OUTPUT_DIR=${ROOT_DIR}/${DIR_PREFIX}
JSON=${OUTPUT_DIR}/${FILE_PREFIX}.json
HTML=${OUTPUT_DIR}/${FILE_PREFIX}.html
# Create directory if it missing.
mkdir -p ${OUTPUT_DIR}
for run in {1..59}
do
  ${THYME_BINARY} track -o $JSON
  sleep 1s
done
# Write the report for this minute.
${THYME_BINARY} show -i $JSON -w stats > $HTML
# Exit after a minute.
