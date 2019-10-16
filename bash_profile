#----- misc -----
certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/\?q=%.$1\&output\=json | jq -r '.[].name_value'  | sed 's/<\/\?[^>]\+>//g' | sort -u
}
certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

certbrute(){
cat $1.txt | while read line; do python3 dirsearch.py -e . -u "https://$line"; done
}

ipinfo(){
curl http://ipinfo.io/$1
}
#------ Tools ------
dirsearch(){
cd ~/tools/dirsearch*
 python3 dirsearch.py -e . -u $1
}

knock(){
cd /home/tools/knock/knockpy
python knockpy.py -w list.txt $1
}

sqlmap(){
cd ~/tools/sqlmap*
python sqlmap.py -u \"$1\"
}

Cknife(){
cd ~/tools/Cknife*
java -jar Cknife.jar
}

Behinder(){
cd ~/tools/Behinder*
java -XstartOnFirstThread -jar Behinder.jar
}
