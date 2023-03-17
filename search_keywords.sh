#!/bin/bash

# Enter the URLs to extract keywords from
urls=(
"http://web.archive.org/..."
"http://web.archive.org/..."
"http://web.archive.org/..."
)

# Loop through each URL and extract the keywords
for url in "${urls[@]}"
do
    echo "Extracting keywords from $url"
    curl -s $url | grep -Eo '\b(q|search|id|lang|keyword|query|page|keywords|year|view|email|type|name|p|month|immagine|list_type|url|terms|categoryid|key|l|begindate|enddate|categoryid2|t|cat|category|action|bukva|redirect_uri|firstname|lastname|uid|startTime|eventSearch|categoryids2|categoryids|sort|positiontitle|groupid|m|message|tag|pn|title|orgId|text|handler|myord|myshownums|id_site|city|search_query|msg|sortby|produkti_po_cena|produkti_po_ime|mode|CODE|location|v|order|n|term|start|k|redirect|ref|file|mebel_id|country|from|r|f|field5B5D|searchScope|state|phone|Itemid|lng|place|bedrooms|expand|e|price|d|path|address|day|display|a|error|form|language|mls|kw|u)/?\b' | tr '[:upper:]' '[:lower:]' | sort -u >> keywords.txt
done

echo "Keyword extraction complete"
