# Created by Felipe de Oliveira Emos
# felipe.emos.computacao@gmail.com
# 
# This script executes all *.exe files in $1 folder and measures how much time do they take to execute.
# This experiment is done "$3" times for each *.exe file. The final log is saved at respective "$2/*.log" file
# $1 - Folder where to execute files
# $2 - Log destination
# $3 - Repeat experiment $3 times for each file
# $4 - Possible param to execute your file
#

if [ $# -eq 0 ]
  then
    echo "Need more arguments"
fi



for file in $1/*.exe
do
	echo "Starting $file ..."
    FILENAME=`echo "$file" | cut -d'/' -f2 | cut -d'.' -f1`
    
    echo "'$FILENAME.exe' was tested i = $3 times" > "$2/$FILENAME".log
    
	for (( i=1; i <= $3; ++i ))
	do
	  (time ./"$file" 10000;) 2>&1 | grep real >> "$2/$FILENAME".log
	done
	
	(awk '/m[0-9]/{sum += strtonum(substr($2, 3, 5));cnt++} END {print "Avarage:  " sum/cnt "s"}' "$2/$FILENAME".log ) >> "$2/$FILENAME".log
	
done
