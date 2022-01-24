#! /usr/bin/env bash

#----------------DESCRIPTION--------------
#
#   CSV PARSER by AdrianoHeller
#   
#----------------VERSION CONTROL--------------
#    Version 1.0
#      - Raw parse implemented
#      - Processed Buffer pipe  
#----------------VARIABLES--------------

RAW_FILE=$(cat "$1")

#----------------TESTED COMPILER--------------

BASH_VERSION=$(bash --version | head -n 1)

#----------------EXECUTION--------------
# touch ../node/list.json
chmod u+w "$RAW_FILE"
name=""
age=""
created_at=""

for line in $RAW_FILE; do
    name=$(echo "$line" | cut -d ";" -f 1)
    age=$(echo "$line" | cut -d ";" -f 2)
    created_at=$(echo "$line" | cut -d ";" -f 3)
    set -x
    if [ "$name" -eq "name" ]; then
        name=""
    fi
    if [ "$age" = "age" ]; then
        age=$("0")
    fi
    if [ "$created_at" = "created_at" ]; then
        created_at=$("0")
    fi
    set +x
    echo "
      {
          \"name\": \"$name\",
          \"age\": $age,
          \"created_at\": $created_at 
      }," >>../node/list.json
done
