#!/bin/bash

usage() {
    echo "Usage: $0 -u <urls_file>"
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

while getopts "u:" opt; do
    case ${opt} in
        u )
            urls_file=$OPTARG
            ;;
        \? )
            usage
            exit 1
            ;;
        : )
            echo "Error: -$OPTARG requires an argument."
            usage
            exit 1
            ;;
    esac
done

if [ -z "$urls_file" ]; then
    echo "Error: -u flag is missing."
    usage
    exit 1
fi

keywords=("q" "s" "search" "id" "lang" "keyword" "query" "page" "keywords" "year" "view" "email" "type" "name" "p" "month" "immagine" "list_type" "url" "terms" "categoryid" "key" "l" "begindate" "enddate" "categoryid2" "t" "cat" "category" "action" "bukva" "redirect_uri" "firstname" "c" "lastname" "uid" "startTime" "eventSearch" "categoryids2" "categoryids" "sort" "positiontitle" "groupid" "m" "message" "tag" "pn" "title" "orgId" "text" "handler" "myord" "myshownums" "id_site" "city" "search_query" "msg" "sortby" "produkti_po_cena" "produkti_po_ime" "mode" "CODE" "location" "v" "order" "n" "term" "start" "k" "redirect" "ref" "file" "mebel_id" "country" "from" "r" "f" "field5B5D" "searchScope" "state" "phone" "Itemid" "lng" "place" "bedrooms" "expand" "a" "price" "d" "path" "address" "day" "display" "error" "form" "language" "mls" "kw" "u" "/?s=" "/search?q=" "/index.php?lang=" "/pplay/info_prenotazioni.asp?immagine=" "/shared/lgflsearch.php?terms=" "/index.php?page=" "/search?query=" "/en/Telefon-Cam?search=" "/index.php?bukva=" "/pro/events_print_setup.cfm?list_type=" "/pro/events_print_setup.cfm?categoryid=" "/pro/events_print_setup.cfm?categoryid2=" "/?eventSearch=" "/?startTime=" "/pro/events_ical.cfm?categoryids=" "/pro/events_ical.cfm?categoryids2=" "/pro/events_print_setup.cfm?month=" "/pro/events_print_setup.cfm?year=" "/pro/events_print_setup.cfm?begindate=" "/pro/events_print_setup.cfm?enddate=" "/search?keyword=" "/?q=" "/search/?q=" "/index.php?pn=" "/?lang=" "/property/search?uid=" "/index.php?id=" "/search?orgId=" "/products?handler=" "/pro/events_print_setup.cfm?view=" "/pro/events_print_setup.cfm?keywords=" "/?p=" "/search.php?q=" "/?search=" "/pro/minicalendar_detail.cfm?list_type


