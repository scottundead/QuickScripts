while read fileline; do
    echo $fileline | base64 -D | hexdump -v -e '/1 "%02x" ' >> hex.txt;
    echo "" >> hex.txt;
done < b64.txt
