#!/bin/sh -l

# Define variables
HOSTNAME=$1
PATH=$2
FILTER=$3
EXPECTED=$4
UNSECURE=$5

URL="https://${HOSTNAME}${PATH}"

if $UNSECURE; then
    result=$(/usr/bin/wget --no-check-certificate -qO- "$URL" | /usr/bin/jq -r "$FILTER")
else
    result=$(/usr/bin/wget -qO- "$URL" | /usr/bin/jq -r "$FILTER")
fi


if [ "$EXPECTED" != "$result" ]; then 
    echo "Expected: ${EXPECTED} ; Get: ${result}" 
    exit 1; 
fi

echo "::set-output name=result::$result"