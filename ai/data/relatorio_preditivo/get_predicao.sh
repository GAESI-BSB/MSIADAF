dirin="/scratch/Documentos/profissional/Microstrategy/predicao2018/"


touch predicao2018.csv; rm predicao2018.csv
  touch x.tmp; rm *.tmp

for xlsx in $(ls $dirin/*.xlsx);do
  csv=$(echo $xlsx | sed 's/\.xlsx$/\.csv/g' )
  touch $csv; rm $csv

#  ssconvert $xlsx $xlsx.csv -O # 'separator=; format=raw'
  libreoffice --convert-to csv $xlsx # configurado com padrao de decimal em ingles
  iconv -f iso8859-1 -t utf8 $csv > tmp; mv tmp $csv

  sed -i 's/4,5 MG/4.5MG/g' $csv  
  sed -i 's/2,5 MG/2.5MG/g' $csv
  sed -i 's/1,5 MG/1.5MG/g' $csv
  sed -i 's/0,3 MG/0.3MG/g' $csv
  sed -i 's/0,5 MG/0.5MG/g' $csv
  sed -i 's/0,05 MG/0.05MG/g' $csv
  sed -i 's/0,04 MG/0.04MG/g' $csv
  sed -i 's/0,125 MG/0.125MG/g' $csv
  sed -i 's/0,25 MG/0.25MG/g' $csv
  sed -i 's/0,75 MG/0.75MG/g' $csv
  sed -i 's/0,1 MG/0.1MG/g' $csv
  sed -i 's/2,5 ML/2.5ML/g' $csv
  sed -i 's/"//g' $csv
  sed -i 's/Mês Ano/CMPT/g' $csv

  uf=""; 
  ano=""; 
  cmpt="";
  t=$(basename $xlsx | awk '{print substr($1,1,1)}') # trimestre
  for line in $(cat $csv | sed 's/ /£/g');do
     uf_aux=$(echo $line | grep "^UF" | sed 's/UF://g' | sed 's/,//g' | sed 's/£//g')
     if [ ! -z "$uf_aux" ]; then uf=$uf_aux; fi

     ano_aux=$(echo $line | grep "^Ano" | sed 's/Ano://g' | sed 's/,//g' | sed 's/£//g')
     if [ ! -z "$ano_aux" ]; then ano=$ano_aux; fi

     cmpt_aux=$(echo $line | grep "^CMPT" | sed 's/CMPT://g' | sed "s/$ano//g" | sed 's/JAN/01/g' | sed 's/FEV/02/g' | sed 's/MAR/03/g' | sed 's/ABR/04/g' | sed 's/MAI/05/g' | sed 's/JUN/06/g' | sed 's/JUL/07/g' | sed 's/AGO/08/g' | sed 's/SET/09/g' | sed 's/OUT/10/g' | sed 's/NOV/11/g' | sed 's/DEZ/12/g' | sed 's/,//g' | sed 's/£//g')
     if [ ! -z "$cmpt_aux" ]; then cmpt=$cmpt_aux; fi     

     echo "$uf,$ano$cmpt,$t,$line" | sed 's/, /,/g' | sed 's/£/ /g' | grep -v ",,,,,$" | grep -v "^Arquivo" >> $csv.tmp
  done # line
  cat $csv.tmp >> predicao2018.csv
  rm $csv.tmp
done # xlsx

paste <(awk -F'[,:]' '{print $1}' predicao2018.csv) <(awk -F',' '{print $2","$4","$7","$8","$9","$10}' predicao2018.csv) | sed 's/\t/,/g' | egrep -v 'Ano|CMPT|Páginas|UF' > predicao2018.ok.csv


awk -F',' '{print $1","$2","$3","$4","$7}' predicao2018.ok.csv | sort -u | grep -v 'Qtd Estoque' > estoque2013a2018.csv

awk -F',' '{print $1","$2","$3","$4","$7","$8","$9}' predicao2018.ok.csv | sort -u | grep -v 'Qtd Estoque' > reposicao2013a2018.csv


awk -F',' '{print $1","$2","$3","$4","$6}' predicao2018.ok.csv | sort -u | grep -v 'Qtd Estoque' > predicao2013a2018.csv



exit

     1	ACRE
     2	201301
     3	1
     4	Produto
     5	Métrica
     6	Soma 4 meses
     7	Qtd Estoque
     8	Reposição total do produto
     9	Reposição - Qtd Embalagens

