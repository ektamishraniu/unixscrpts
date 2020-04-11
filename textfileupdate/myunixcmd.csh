rm  step1file.txt  step2file.txt  step3file.txt
cat inputfile.txt |cut -d ')' -f2 |cut -c 35-81  | sed 's/.$//'  | awk '{$1=$1;print}'  | sed -e   's/\<field\>//g' | awk '{print tolower($0)}' > step1file.txt
cat step1file.txt | sed 's/ /_/g' | sed 's/.$//' | awk '{print tolower($0)}' > step2file.txt
cat step2file.txt | awk '{print "inv_df = delete_column(inv_df, \"" $0 "\")"}'  > step3file.txt
