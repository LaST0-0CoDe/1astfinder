#!/bin/bash

# Parse command line arguments
while getopts u: flag
do
    case "${flag}" in
        u) url_file=${OPTARG};;
    esac
done

# Check if URL file is provided
if [ -z "${url_file}" ]
then
    echo "Error: Please provide a file containing URLs using the -u flag."
    exit 1
fi

# Define keywords to search for
keywords=(q= s= search= id= lang= keyword= query= page= keywords= year= view= email= type= name= p= month= immagine= list_type= url= terms= categoryid= key= l= begindate= enddate= categoryid2= t= cat= category= action= bukva= redirect_uri= firstname= c= lastname= uid= startTime= eventSearch= categoryids2= categoryids= sort= positiontitle= groupid= m= message= tag= pn= title= orgId= text= handler= myord= myshownums= id_site= city= search_query= msg= sortby= produkti_po_cena= produkti_po_ime= mode= CODE= location= v= order= n= term= start= k= redirect= ref= file= mebel_id= country= from= r= f= field5B5D= searchScope= state= phone= Itemid= lng= place= bedrooms= expand= e= price= d= path= address= day= display= a= error= form= language= mls= kw= u=

)

# Initialize list of URLs with keywords
url_list=""

# Read each URL from file and search for keywords
while read url
do
    # Split URL by query string parameters
    params=$(echo "${url}" | awk -F'[?&]' '{print substr($0,index($0,$2))}')

    # Check if URL contains at least one keyword
    if echo "${params}" | grep -q -E "${keywords[*]}"
    then
        url_list="${url_list}${url}\n"
        # Search for each keyword in URL parameters
        for keyword in "${keywords[@]}"
        do
            echo "${params}" | grep -o "${keyword}[^&]*" | sed "s/${keyword}//g" | while read value
            do
                echo "Keyword ${keyword} found in ${url} with value ${value}"
            done
        done
    fi
done < "${url_file}"

# Output list of URLs with keywords
echo -e "URLs with keywords:\n${url_list}"
