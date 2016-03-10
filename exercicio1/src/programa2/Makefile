all: end

UsingOriginalFile: primo.c
	#Method simple: no tags on compiler
	gcc primo.c -o bin/EX1_primo.exe

UsingSeparatedFiles: main.c calc_primo.c calc_primo.h
	#Method separate compilation: manualy link
	gcc main.c -c
	gcc calc_primo.c -c
	gcc main.o calc_primo.o -o bin/EX2_primo_Linking.exe
	rm -rf *.o *.s

end: UsingOriginalFile UsingSeparatedFiles