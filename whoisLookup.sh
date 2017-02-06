#!/bin/bash

if [[ $(wc -l <input.txt) -ge 2 ]]
then
    `echo "begin" > bulkInput.txt`
    `echo "verbose" >> bulkInput.txt`
    `cat input.txt >> bulkInput.txt`
    `echo -e "\nend" >> bulkInput.txt`
    `nc whois.cymru.com 43 < bulkInput.txt | sort -n > whoisLookup.out`
    `rm bulkInput.txt`
else
    for ip_address in `cat input.txt`;
	do
        whois -h whois.cymru.com " -v $ip_address" >> whoisLookup.out
		done
fi
