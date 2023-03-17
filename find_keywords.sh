#!/bin/bash
echo -e "\033[1;31m⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡤⠊⠁⠀⠀⠀⠀⠀⠀⠀⣙⡦⢄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⢀⠠⠂⠁⠀⠈⣂⠉⡹⠃⠀⠀⠀⠀⠀
⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⡐⠀⠀⠀⠀⠀⠀⠈⡏⠀⠀⠀⠀⠀⠀⠀
⠀⢸⡄⠀⠀⠀⢀⡠⠴⠟⣆⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
⠀⣿⢻⡄⠀⣼⠉⠀⡌⠀⠹⣆⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
⢠⡳⠀⡇⢠⡏⠀⢰⡀⠀⠀⠹⣄⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
⠘⢿⣇⣹⣼⠀⣠⣊⣡⠟⠀⠀⣹⠆⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀
⠀⣾⠑⢺⢿⣍⠉⠁⠀⠀⠀⣰⠋⠀⠀⠀⠀⢰⢻⠀⠀⠀⠀⠀⠀⠀
⠀⠈⣇⢸⠀⠙⢵⣄⠀⠀⡴⠃⠀⠀⠀⠀⢀⡞⣇⢇⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣿⠀⠀⠀⠙⠳⠞⠁⠀⠀⠀⠀⢀⣞⠠⠜⠚⢳⠀⠀⠀⠀⠀
⠀⠀⠀⢱⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠔⣉⠠⠄⠐⠊⢉⣣⡀⠀⠀⠀
⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⡰⠞⠂⣉⣠⠴⠆⢈⡉⢻⡀⠱⡀⠀⠀
⠀⠀⠀⠀⠙⠢⣀⡠⠤⠖⡪⠔⡪⠛⠉⠀⠀⠀⠀⠀⠉⠓⠤⣳⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠸⠂⢁⠔⠁⠀⢀⣤⠶⠞⠛⠋⠉⠉⠛⠒⠮⣧⠀
⠀⠀⠀⠀⠀⠀⠀⣠⡶⠁⢀⣠⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠆
⠀⠀⠀⠀⠀⢀⠜⡏⠀⣔⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘
⠀⠀⠀⠀⡰⠃⢸⠠⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⡴⠁⠀⢸

# Define the animation string
animation="-\|/"

# Start the loop
while true; do
    # Print the animation string with a message
    printf "\r%s %s" "Your URL is loading" "${animation:i++%${#animation}:1}"
    # Delay for a short time to slow down the animation
    sleep 0.1
done

while getopts "u:" arg; do
  case $arg in
    u)
      url_file=$OPTARG
      ;;
  esac
done

if [ -z "$url_file" ]; then
  echo "Please provide a URLs file using the -u flag"
  exit 1
fi

# Create a new file to store the found URLs
found_urls_file="found_urls.txt"
touch $found_urls_file

# Loop through the URLs file and search for the specified keywords
while read url; do
  if echo "$url" | grep -E 'q|s|search|id|lang|keyword|query|page|keywords|year|view|email|type|name|p|month|immagine|list_type|url|terms|categoryid|key|l|begindate|enddate|categoryid2|t|cat|category|action|bukva|redirect_uri|firstname|c|lastname|uid|startTime|eventSearch|categoryids2|categoryids|sort|positiontitle|groupid|m|message|tag|pn|title|orgId|text|handler|myord|myshownums|id_site|city|search_query|msg|sortby|produkti_po_cena|produkti_po_ime|mode|CODE|location|v|order|n|term|start|k|redirect|ref|file|mebel_id|country|from|r|f|field5B5D|searchScope|state|phone|Itemid|lng|place|bedrooms|expand|e|price|d|path|address|day|display|a|error|form|language|mls|kw|u' > /dev/null; then
    echo $url >> $found_urls_file
  fi
done < $url_file

echo "Keyword found URLs saved in $found_urls_file"
