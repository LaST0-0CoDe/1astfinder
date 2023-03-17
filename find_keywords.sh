#!/bin/bash

# Function to extract keywords from URL
extract_keywords() {
    echo "$1" | grep -oE 'q|s|search|id|lang|keyword|query|page|keywords|year|view|email|type|name|p|month|immagine|list_type|url|terms|categoryid|key|l|begindate|enddate|categoryid2|t|cat|category|action|bukva|redirect_uri|firstname|c|lastname|uid|startTime|eventSearch|categoryids2|categoryids|sort|positiontitle|groupid|m|message|tag|pn|title|orgId|text|handler|myord|myshownums|id_site|city|search_query|msg|sortby|produkti_po_cena|produkti_po_ime|mode|CODE|location|v|order|n|term|start|k|redirect|ref|file|mebel_id|country|from|r|f|field5B5D|searchScope|state|phone|Itemid|lng|place|bedrooms|expand|e|price|d|path|address|day|display|a|error|form|language|mls|kw|u|\?s=|\?q=|/search\?q=|/search\?keyword=|/search\?search=|/search-results\?q=|/search\?field5B5D=|/videos\?tag=|/videos\?place=|/videos\?search=|/property/search\?uid=|/search\.php\?q='
}

# Check if urls file is provided as argument
if [[ -z "$1" ]]; then
    echo "Please provide a URLs file as argument using -u flag."
    exit 1
fi

# Check if urls file exists
if [[ ! -f "$1" ]]; then
    echo "The specified URLs file does not exist."
    exit 1
fi

# Loop through each URL in the file and extract keywords
while read url; do
    echo "Keywords in URL: $url"
    keywords=$(extract_keywords "$url")
    echo "$keywords"
done < "$1"
