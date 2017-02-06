#!/bin/bash

for ip_address in `cat input.txt`;
do
      dig +short -x $ip_address >> dnsLookup.out
done
