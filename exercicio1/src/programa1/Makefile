all: end

UsingOriginalFile: primo.c
	#Method simple: no tags on compiler
	gcc primo.c -o bin/EX1_primo.exe
	
	#Method mtune Native: tag -mtune=native
	gcc primo.c -o bin/EX2_primo_mtune_native.exe -mtune=native
	
	#Method O0: tag -O0
	gcc primo.c -o bin/EX3_primo_O0.exe -O0
	
	#Method O1: tag -O1
	gcc primo.c -o bin/EX4_primo_O1.exe -O1
	
	#Method O2: tag -O2
	gcc primo.c -o bin/EX5_primo_O2.exe -O2
	
	#Method O3: tag -O3
	gcc primo.c -o bin/EX6_primo_O3.exe -O3

UsingSeparatedFiles: main.c calc_primo.c calc_primo.h
	#Method separate compilation: manualy link
	gcc main.c -c
	gcc calc_primo.c -c
	gcc main.o calc_primo.o -o bin/EX7_primo_Linking.exe
	rm -rf *.o *.s

end: UsingOriginalFile UsingSeparatedFiles