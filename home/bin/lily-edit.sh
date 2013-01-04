#!/bin/bash

if [ -z $1 ] ;then
  echo "Usage: $0 <recordid>"
  exit 1
fi

JSON_ORIG=$(mktemp)
curl http://localhost:12060/repository/record/$1 -H "Content-Type: application/json" | json_reformat > $JSON_ORIG

JSON_EDIT=$(mktemp)
cp $JSON_ORIG $JSON_EDIT

${EDITOR:-vim} $JSON_EDIT

POSTDATA=$(mktemp)

cat >> $POSTDATA <<EOF
{ "action": "update",
  "record":
    $(cat $JSON_EDIT)
}
EOF

diff $JSON_ORIG $JSON_EDIT
if [ $? -ne "0" ]; then
  curl -X POST http://localhost:12060/repository/record/$1 -H "Content-Type: application/json" -d"@$POSTDATA" -s --fail
else
  echo "No changes. Not updating record"
fi

rm $JSON_ORIG
rm $JSON_EDIT
rm $POSTDATA
