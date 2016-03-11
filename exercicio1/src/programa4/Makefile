all: end

UsingOriginalFile: primo.c
	gcc -fopenmp primo.c -o bin/EX1_primo.exe

UsingSeparatedFiles: main.c calc_primo.c calc_primo.h
	gcc -fopenmp main.c calc_primo.c -o bin/EX2_primo_Linking.exe

end: UsingOriginalFile UsingSeparatedFiles
