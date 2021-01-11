#!/bin/bash

if [ "$#" -ne 1 ] || [[ "$1" != http* ]]; then
    echo "Usage: $0 URL -- download and extract an oxen-core ios-deps package (typically from https://oxen.rocks)" >&2
    exit 1
fi

if ! [ -d oxen_coin/ios/External/ios/oxen ]; then
    echo "This script needs to be invoked from the oxen-wallet top-level project directory" >&2
    exit 1
fi

curl -sS "$1" | tar --strip-components=1 -C oxen_coin/ios/External/ios/oxen/ -xJv
