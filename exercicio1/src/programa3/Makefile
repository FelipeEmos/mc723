all: end

UsingOriginalFile: primo.c
	#Using only gprof tag
	gcc -pg primo.c -o bin/EX1_primo.exe 

UsingSeparatedFiles: main.c calc_primo.c calc_primo.h
	#Separated files and using only gprof tag
	gcc main.c calc_primo.c -o bin/EX2_primo_Linking.exe

end: UsingOriginalFile UsingSeparatedFiles
