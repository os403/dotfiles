THYME=$HOME/go/bin/thyme
DIR=$HOME/Desktop/thyme/
FILE_PREFIX=`date +%Y-%m-%d-%H`
JSON=$DIR/${FILE_PREFIX}.json
HTML=$DIR/${FILE_PREFIX}.html
# Create directory if it missing.
mkdir -p $DIR
for run in {1..59}
do
  $THYME track -o $JSON
  sleep 1s
done
# Write the report for this minute.
$THYME show -i $JSON -w stats > $HTML
# Exit after a minute.
