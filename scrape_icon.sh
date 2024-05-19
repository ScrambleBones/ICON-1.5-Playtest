#!/usr/bin/env bash

curl -s 'https://iconpendium.netlify.app/static/js/main.b466a4e7.js' | 
	grep -Po "JSON\.parse\('\K.*?(?='\)[,;])"  | 
	sed -e 's/\\"/\"/g' -e "s/\\u2019/'/g" -e "s/\\u2018/'/g" -e 's/\\xda/ú/g' -e 's/\\u201d/"/g' -e "s/____\",/____',/g" | 
	sed "s/\\\'/'/g" | 
	jq -s '.' > icon_dump.json
