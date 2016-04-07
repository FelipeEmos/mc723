#!/bin/bash

declare -a traces=(       "equake_f2b"        "parser_f2b"        "eon_f2b"        "gap_f2b")
declare -a traces_dir=(   "183.equake.f2b"    "197.parser.f2b"    "252.eon.f2b"    "254.gap.f2b")
#declare -a l1_isizes=( "16K" "32K" "64K" "128K" )
declare -a l1_isizes=("64K" )
#declare -a l1_dsizes=( "16K" "32K" "64K" "128K" )
declare -a l1_dsizes=("16K" "32K" "64K" "128K" "256K" "512K" "1024K" "2048K" "4096K" )

if [ ! -d "log" ]; then
  mkdir "log"
fi

cd log
LOG=$(pwd)


for index in `seq 0 $((${#traces[@]}-1))`;
do
	trace=${traces[($index)]}
	trace_dir=${traces_dir[($index)]}

	printf "\nName: $trace\n\n"
	
	if [ ! -d log/"$trace" ]; then
		mkdir log/"$trace"
	fi
	
	cd ..

	mainADDR=$(pwd)
	cd ~lucas/mc723/traces/$trace_dir
	
	echo "Begining to test $trace..."
	
	
	var=0
	for i in 
	do
		for j in `seq 0 $((${#l1_dsizes[@]}-1))`
		do
			printf "${l1_isizes[($i)]} x ${l1_dsizes[($j)]}\n"
			var=$(($var+1))
		done
	done
	
	
	echo "Table of instruction misses:" > $LOG/$trace/instruction_misses.log
	echo "Table of data misses:" > $LOG/$trace/data_misses.log
	
	printf "l1_I x l1_D" >> $LOG/$trace/instruction_misses.log
	printf "l1_I x l1_D" >> $LOG/$trace/data_misses.log
	
	for i in `seq 0 $((${#l1_dsizes[@]}-1))`
	do
		printf ",     ${l1_dsizes[($i)]}" >> $LOG/$trace/instruction_misses.log
		printf ",     ${l1_dsizes[($i)]}" >> $LOG/$trace/data_misses.log
	done
	
	#Redirect stderr
	exec 3>&2
	exec 2> /dev/null
	
	for i in `seq 0 $((${#l1_isizes[@]}-1))`
	do
		l1_isize="${l1_isizes[($i)]}"
		
		printf "\n    $l1_isize" >> $LOG/$trace/instruction_misses.log
		printf "\n    $l1_isize" >> $LOG/$trace/data_misses.log
		
		for j in `seq 0 $((${#l1_dsizes[@]}-1))`
		do
			l1_dsize="${l1_dsizes[($j)]}"
			
			echo "Cash config: l1_I=$l1_isize  l1_D=$l1_dsize"
			
			log_file="$LOG"/$trace/ins_"$l1_isize"_x_data_"$l1_dsize".log
			
			../../dinero4sbc/dineroIV -informat s -trname $trace -maxtrace 20 -l1-isize "$l1_isize" -l1-dsize "$l1_dsize" -l1-ibsize 32 -l1-dbsize 32 > $log_file
			
			printf ",   " >> $LOG/$trace/instruction_misses.log
			printf ",   " >> $LOG/$trace/data_misses.log
			
			value_i="$(awk '/Demand miss rate/' "$log_file" | sed -n 1p | cut -d ' ' -f11 )"
			value_d="$(awk '/Demand miss rate/' "$log_file" | sed -n 2p | cut -d ' ' -f11 )"
			
			printf "$value_i" >> $LOG/$trace/instruction_misses.log
			printf "$value_d" >> $LOG/$trace/data_misses.log
		done
	done
	
	#Restore stderr
	exec 2>&3
	cd $mainADDR
	
done
