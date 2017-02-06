#!/bin/bash

for ip_address in `cat input.txt`;
do
    whois -h whois.cymru.com " -v $ip_address" >> IP_ASN_BGP.out
done
