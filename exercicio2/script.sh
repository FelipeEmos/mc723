
trace1_dir=183.equake.f2b
trace2_dir=183.equake.m2b

trace1_name=equake_f2b
trace2_name=equake_m2b


if [ ! -d "log" ]; then
  mkdir "log"
fi

cd log
LOG=$(pwd)

if [ ! -d $trace1_name ]; then
	mkdir $trace1_name
fi
if [ ! -d $trace2_name ]; then
	mkdir $trace2_name
fi

cd ..

mainADDR=$(pwd)
cd ~lucas/mc723/traces/$trace1_dir

../../dinero4sbc/dineroIV -informat s -trname $trace1_name -maxtrace 20 -l1-isize 16K -l1-dsize 16K -l1-ibsize 32 -l1-dbsize 32 > $LOG/$trace1_name/exp_1.log
#../../dinero4sbc/dineroIV -informat s -trname  -maxtrace 20 -l1-isize 16K -l1-dsize 16K -l1-ibsize 32 -l1-dbsize 32 > $LOG/$trace1/exp_1.log
#../../dinero4sbc/dineroIV -informat s -trname equake_f2b -maxtrace 20 -l1-isize 16K -l1-dsize 16K -l1-ibsize 32 -l1-dbsize 32

cd $mainADDR
