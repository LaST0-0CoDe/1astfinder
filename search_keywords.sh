#!/bin/bash

# Define the keywords to search for
KEYWORDS=("q" "s" "id" "lang" "keyword" "query" "page" "keywords" "year" "view" "email" "type" "name" "p" "month" "immagine" "list_type" "url" "terms" "categoryid" "key" "l" "begindate" "enddate" "categoryid2" "t" "cat" "category" "action" "bukva" "redirect_uri" "firstname" "c" "lastname" "uid" "startTime" "eventSearch" "categoryids2" "categoryids" "sort" "positiontitle" "groupid" "m" "message" "tag" "pn" "title" "orgId" "text" "handler" "myord" "myshownums" "id_site" "city" "search_query" "msg" "sortby" "produkti_po_cena" "produkti_po_ime" "mode" "CODE" "location" "v" "order" "n" "term" "start" "k" "redirect" "ref" "file" "mebel_id" "country" "from" "r" "f" "field5B5D" "searchScope" "state" "phone" "Itemid" "lng" "place" "bedrooms" "expand" "e" "price" "d" "path" "address" "day" "display" "a" "error" "form" "language" "mls" "kw" "u")

# Loop through the URLs and download the HTML content, then search for the keywords
while read url; do
    echo "Searching $url"
    wget -q -O - "$url" | grep -i -w "${KEYWORDS[@]}"
done < urls.txt
