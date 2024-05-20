#!/usr/bin/env bash

set -ex

curl -s 'https://iconpendium.netlify.app/static/js/main.b466a4e7.js' | 
	grep -Po "JSON\.parse\('\K.*?(?='\)[,;])"  | 
	sed -e 's/\\"/\"/g' -e "s/\\u2019/'/g" -e "s/\\u2018/'/g" -e 's/\\xda/ú/g' -e 's/\\u201d/"/g' -e "s/____\",/____',/g" | 
	sed "s/\\\'/'/g" | 
	jq -s '.' > icon_dump.json

sections=() # TODO figure out the order of the sections from the dump and add the names here

for i in $(seq $(jq 'length' icon_dump.json)); do
    # jq ".[$i]" > icon_dump_${sections[$i]}.json    
    jq ".[$((i-1))]" icon_dump.json > icon_dump_section$i.json
done
