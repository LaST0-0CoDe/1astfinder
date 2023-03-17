#!/bin/bash

# define the list of keywords
keywords="q s search id lang keyword query page keywords year view email type name p month immagine list_type url terms categoryid key l begindate enddate categoryid2 t cat category action bukva redirect_uri firstname c lastname uid startTime eventSearch categoryids2 categoryids sort positiontitle groupid m message tag pn title orgId text handler myord myshownums id_site city search_query msg sortby produkti_po_cena produkti_po_ime mode CODE location v order n term start k redirect ref file mebel_id country from r f field5B5D searchScope state phone Itemid lng place bedrooms expand e price d path address day display a error form language mls kw u"

# loop through the list of URLs and search for the keywords
while read url; do
    echo "Searching keywords in $url"
    content=$(curl -s "$url")
    for keyword in $keywords; do
        if echo "$content" | grep -q "$keyword"; then
            echo "$url contains $keyword"
            echo "$url $keyword" >> keywords.txt
        fi
    done
done < urls.txt
