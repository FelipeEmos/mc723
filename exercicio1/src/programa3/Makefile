all: end

UsingOriginalFile: primo.c
	#Using only gprof tag
	gcc primo.c -o bin/EX1_primo.exe 

UsingSeparatedFiles: main.c calc_primo.c calc_primo.h
	#Separated files and using only gprof tag
	gcc main.c -c
	gcc calc_primo.c -c
	gcc main.o calc_primo.o -o bin/EX2_primo_Linking.exe
	rm -rf *.o *.s
	gcc -pg main.c calc_primo.c -o bin/EX2_primo_Linking.exe

end: UsingOriginalFile UsingSeparatedFiles