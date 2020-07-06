# Add the following line after typing the command: crontab -e
# * * * * * sh $HOME/dotfiles/thyme.sh >>$HOME/Desktop/Thyme/thyme.log 2>&1
#
# You can also verify the crontab file by,
# sudo cat /var/spool/cron/crontabs/jayaprakashs
#
# Crontab doesn't set all env variables. We need to set the right display for crontab to run.

###
#
# Note: This script is run every minute (invoked by crontab).
# EVERY SECOND
# -- Captures what is on the front of the screen (active window)
# -- Generate report on how the time is spent (by hour, by days and by month)

export DISPLAY=:0

ROOT_DIR=$HOME/Desktop/Thyme/
THYME_BINARY=$HOME/go/bin/thyme

DIR_PREFIX=`date +%Y/%m`
OUTPUT_DIR=${ROOT_DIR}/${DIR_PREFIX}
HOUR_PREFIX=`date +%Y-%m-%d-%H`
DAY_PREFIX=`date +%Y-%m-%d`
MONTH_PREFIX=`date +%Y-%m`
JSON=${OUTPUT_DIR}/${HOUR_PREFIX}.json

if test -f "$JSON"; then
  touch "${JSON}-already-exist-error"
  exit
fi

# Create directory if it is missing.
mkdir -p ${OUTPUT_DIR}
for run in {1..1800}
do
  HOUR=`date +%Y-%m-%d-%H`
  if [ "$HOUR" = "$HOUR_PREFIX" ];
  then
    ${THYME_BINARY} track -o ${OUTPUT_DIR}/${HOUR_PREFIX}.json
    ${THYME_BINARY} track -o ${OUTPUT_DIR}/${DAY_PREFIX}.json
    ${THYME_BINARY} track -o ${OUTPUT_DIR}/${MONTH_PREFIX}.json
    slee 2s
  else
    break
  fi
done

# Update stats
${THYME_BINARY} show -i ${OUTPUT_DIR}/${HOUR_PREFIX}.json -w stats > ${OUTPUT_DIR}/${HOUR_PREFIX}.html
${THYME_BINARY} show -i ${OUTPUT_DIR}/${DAY_PREFIX}.json -w stats > ${OUTPUT_DIR}/${DAY_PREFIX}.html
${THYME_BINARY} show -i ${OUTPUT_DIR}/${MONTH_PREFIX}.json -w stats > ${OUTPUT_DIR}/${MONTH_PREFIX}.html

# Send notification
python $HOME/dotfiles/time_notification.py


