#!/bin/bash
#
# NAME
#   multi-domain-check.sh
# 
# DEPENDENCIES
#   curl - transfer a URL
#   dig - DNS lookup utility
#   gawk - pattern scanning and processing language
#   whois - client for the whois directory service
#
# DESCRIPTION
#   The script takes a list of domain names from 
#   'multi-domain-check_input.txt` and retrieves several information on each 
#   domain name. The full set of information is printed to 
#   'multi-domain-check_output.csv`.
# 
# USAGE:
#   Write all domain names to check in the input file 
#   `multi-domain-dig_input.txt', separated by newline.

# Define column headers in output file
echo "\
  \$DOMAIN NAME\$;\
  \$EMAILS\$;\
  \$A RECORD (IPv4)\$;\
  \$AAAA RECORD (IPv6)\$;\
  \$NS RECORD\$;\
  \$CNAME\$;\
  \$MX RECORDS\$;\
  \$TXT RECORDS\$;\
  \$HTTP STATUS\$;\
  \$SERVER\$" > multi-domain-check_output.csv

while read domain

do
  # Fetch A records (IPv4)
  ipv4=`dig a $domain +short`

  # Fetch associated email addresses
  emails=`whois -H $domain | grep -E -i 'email:|e-mail:|mail:' | gawk '{print $NF}'`

  # Fetch AAAA records (IPv6)
  ipv6=`dig aaaa $domain +short`

  # Fetch NS records (name server records)
  ns=`dig ns $domain +short`

  # Fetch CNAME record, translate newline to comma
  cname=`dig cname $domain +short | sort | tr '\n' ','`

  # Fetch MX records (mail exchange resource record)
  mx=`dig mx $domain +short`

  # Fetch TXT records
  txt=`dig txt $domain +short`

  # Fetch HTTP status code, silently
  httpsc=`curl -s -I $domain | grep -i -m 1 'HTTP' | gawk {'print $2'}`

  # Fetch Server, silently
  server=`curl -s -I $domain | grep -i -m 1 'Server' | gawk {'print $2'}`

  # Print fetched data to stout
  echo "Domain name:       $domain"
#   echo "A record(s):       $ipv4"
#   echo "AAAA record(s):    $ipv6"
#   echo "CNAME:             $cname"
#   echo "MX record(s):      $mx"
#   echo "TXT record(s):     $txt"
#   echo "HTTP Status Code:  $httpsc"

  # Write fetched data to file
  echo -e "\
    \$$domain\$;\
    \$$emails\$;\
    \$$ipv4\$;\
    \$$ipv6\$;\
    \$$ns\$;\
    \$$cname\$;\
    \$$mx\$;\
    \$$txt\$;\
    \$$httpsc\$;\
    \$$server\$" >> multi-domain-check_output.csv

# Specify infile
done < multi-domain-check_input.txt
