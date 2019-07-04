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
OUTPUT_DIR=${ROOT_DIR}/${DIR_PREFIX}
MINUTE_PREFIX=`date +%Y-%m-%d-%H-%M`
JSON=${OUTPUT_DIR}/${MINUTE_PREFIX}.json
# Create directory if it missing.
mkdir -p ${OUTPUT_DIR}
for run in {1..59}
do
  ${THYME_BINARY} track -o $JSON
  sleep 1s
done
if 

if [[ $JSON_PREFIX == *59 ]] ; then
  # Generate the html report for this hour.
  HOUR_PREFIX=`date +%Y-%m-%d-%H`
  # Concatenate all the minute level data into hourly data.
  cat ${OUTPUT_DIR}/${HOUR_PREFIX}-*.json >> ${OUTPUT_DIR}/${HOUR_PREFIX}.json 
  # Remove minute level data after the merge.
  rm -f ${OUTPUT_DIR}/${HOUR_PREFIX}-*.json
  # Generate html for this concatenated report.
  CONCAT_JSON=${OUTPUT_DIR}/${HOUR_PREFIX}.json
  HTML=${OUTPUT_DIR}/${HOUR_PREFIX}.html  
  ${THYME_BINARY} show -i $CONCAT_JSON -w stats > $HTML
  # Exit after a minute.
fi

if [[ $JSON_PREFIX == *59 ]] ; then
  MESSAGE=`python ~/dotfiles/time_notification.py`
  # Notification stays for 15 mins.
  notify-send 'Notification!' $MESSAGE -u critical -i face-worried -t 900000
fi
