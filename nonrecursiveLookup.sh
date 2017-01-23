#!/bin/bash

usage()
{
cat << EOF
usage: $0 options

Check target DNS server for nonrecursive DNS Cache vulnerability.

OPTIONS:
  -h  Shows this message
  -s  Target DNS Server to exploit
  -i  Input file of hosts to check for

EOF
}

HOSTLIST=
SERVER=

while getopts "hs:i:" OPTION
do
    case $OPTION in
        h)
            usage
            exit 1
            ;;
        s)
            SERVER=$OPTARG
            ;;
        i)
            HOSTLIST=$OPTARG
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

if [[ -z $SERVER ]] || [[ -z $HOSTLIST ]]
then
    usage
    exit 1
else
    while read HOST
    do
        dig @$SERVER $HOST A +norecurse | tee results.txt
    done < "$HOSTLIST"
fi
