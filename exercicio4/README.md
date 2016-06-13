Exercício 4 : Plataformas e Periféricos
===================
######Aluno: Felipe de Oliveira Emos
######RA: 146009
######Email: felipe.emos.computacao@gmail.com
O enunciado do exercício se encontra no site: http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/ex4.html

##Introdução

Nem todas as funcionalidades de um computador são responsabilidade do processador. Muitas funcionalidades não conseguiriam ser feitas pelo processador ou seriam feitas de maneira pouco eficaz. Exemplos são processamento de gráfico, de áudio, captura de input de usuário, armazenamento de grandes arquivos de forma permanente, dentre outros. A solução é fazer os processadores se comunicarem com outros componentes especializados, chamados de **periféricos**, os quais realizam essas funcionalidades complementares ao processador. Essa comunicação é feita de forma encapsulada, através de um **barrmento**, e aos olhos do processador as operações de periféricos são vistas como simples manipulação de memória.

##Periférico Básico
> "Neste exercício você vai criar uma plataforma multicore com memória compartilhada e um periférico que implementa funcionalidade load-and-increment."

O primeiro periférico a ser criado é um (controlador de deadlock)[TODO]. Em uma plataforma multicore rodando código em paralelo existe problema na execução de código de região crítica. Utilizando uma analogia, imagine que existe apenas um banheiro numa república de estudantes da Unicamp e todos os 5 estudantes que moram na casa tem aula às 8h da manhã. Ao acordarem, todos se arrumam paralelamente e tomam café paralelamente, entretanto é impossível que eles usem o banheiro paralelamente, pois o banheiro não pode ser usado por mais de uma pessoa ao mesmo tempo, o banheiro é uma região crítica no paralelismo. A postura mais simples é os estudantes que não conseguiram entrar no banheiro ficarem esperando ele ser liberado. Ao ser liberado, o primeiro que conseguir entrar tranca a porta e deixa os demais esperando, isto se repete até que todos usem o banheiro. Essa é a disputa do uso de região crítica em multiprocessadores e essa é a abordagem que o nosso periférico irá tomar quanto à solução, em que na analogia o periférico é a chave da porta. 

O primeiro processador que ler o periférico deve ler *0*, "tomando a posse da chave". Qualquer outra leitura após essa irá retornar *1*, significando que a chave nesse momento já tem dono. A escrita no periférico representa o "retorno da chave" e portanto deve ser feita pelo processador que atualmente tem a chave e deve ser feita com um valor de *0*, isso segundo a nossa convenção. O periférico apenas deve implementar as seguites funcões:

* Leitura(): Lê e retorna o valor da memória do periférico para o usuário. Escreve *1* na memória do periférico. O valor inicial do periférico é *0*
* Escrita(x): Escreve *x* na memória do periférico.

Essas funções são encapsuladas para o processador, caso o processador leia uma tal regição de memória X (que está fora da RAM) ele estará executando a função de **leitura** do periférico e caso o processador escreva nessa região X ele estará executando a função de **escrita** do periférico.

Aos olhos do programador de alto nível, deve-se usar o periférico da seguinte forma:

```cpp
//Declarando macro para o endereço do periférico
#define LOCK_ADDR (100*1024*1024)
//Apontando variável para o endereço do periférico para podermos manipulá-lo (escrevendo ou lendo).
volatile int *lock = (volatile int *) LOCK_ADDR;

//"aquireLock" é ler até conseguir um valor de zero, ou seja, a chave está liberada
void aquireLock(){
  while(*lock);
}

//"releaseLock" pela mesma lógica é escrever zero
void releaseLock(){
  *lock = 0;
}

int main(){
  ...
  aquireLock();
  //Executa região crítica
  regiao_critica();
  releaseLock();
  ...
}
```

##Plataforma Multicore
O próximo passo é modificar as configurações do simulador indicando que queremos simular uma plataforma multicore. Foi necessário alterar os arquivos main.cpp, para inicializar dois processadores, e mips_isa.cpp, para garantir as duas stacks diferentes (para que não ocorra colisão de variáveis nas chamadas de função). Nessas modificações foi seguido o [material de apoio](content/Multicore_Lock.pdf). A modificação no main.cpp é muito bem descrita no material de apoio. Já a modificação do mips_isa.cpp descrita no material de apoio não precisa ser feita em sua integridade, pois o simulador disponibilizado para download fornecido neste exercício já apresenta o código de recorte da RAM nas diferentes stacks, o que deve ser modificado é o tamanho da stack (que não pode ser muito grande porque a RAM atual é pequena). Foram usadas stacks de tamanho 128kB e isto resolveu um bug. Outra alternativa seria mudar o tamanho da RAM.

Para testar o multicore foir feito um programa chamado **mediavetor.c** que, a partir de um vetor de números inteiros, calcula a soma e a média dos mesmos. O uso do multiprocessamento está no fato que um processador soma metade do vetor e o outro processador soma a outra metade. O log desse programa para um vetor com tamanho **N**=20000 pode ser visto a seguir:
####Multithread **N** = 20000
```javascript
ArchC: Reading ELF application file: myprogs/mediavetor.mips
ArchC: -------------------- Starting Simulation --------------------
ArchC: Reading ELF application file: myprogs/mediavetor.mips
ArchC: -------------------- Starting Simulation --------------------

Vetor de tamanho [20000] inicializado: { 0, 2, 4, 6, ..., 39996, 39998 }
Processor number 0 summed from index 0 to 10000 and got: 299990000
ArchC: -------------------- Simulation Finished --------------------
Processor number 1 summed from index 10000 to 20000 and got: 99990000
Soma vale: 399980000
Media vale: 19999
ArchC: -------------------- Simulation Finished --------------------
Info: /OSCI/SystemC: Simulation stopped by user.
ArchC: Simulation statistics
    Times: 0.03 user, 0.00 system, 0.04 real
    Number of instructions executed: 152546
    Simulation speed: (too fast to be precise)
ArchC: Simulation statistics
    Times: 0.03 user, 0.00 system, 0.04 real
    Number of instructions executed: 168014
    Simulation speed: (too fast to be precise)
```

Com o trabalho dividido pela metade tivemos desempenho de 0.03 segundos de tempo de usuário. O log de uma modificação desse código para a não divisão de trabalho pode ser visto a seguir:

####Singlethread **N** = 20000
```javascript
ArchC: Reading ELF application file: myprogs/mediavetorSingleThread.mips
ArchC: -------------------- Starting Simulation --------------------
Vetor de tamanho [20000] inicializado: { 0, 2, 4, 6, ..., 39996, 39998 }
Processor number 0 summed from index 0 to 20000 and got: 399980000
ArchC: -------------------- Simulation Finished --------------------

Info: /OSCI/SystemC: Simulation stopped by user.
ArchC: Simulation statistics
    Times: 0.03 user, 0.00 system, 0.04 real
    Number of instructions executed: 202544
    Simulation speed: (too fast to be precise)
```

A diferença é imperceptível! Isto é muito longe do esperado, este fenômeno ocorre porquê o experimento é muito rápido e a parte paralelizável não ocupa tempo significativo para fazer diferença *"Simulation speed: (too fast to be precise)"*, aumentando o tamanho do vetor a diferença deve ficar perceptível! O **drawback** é que a soma dos vetores vai fazer overflow nos inteiros, então fica a nota de que os próximos valores de soma e média não serão realistas, entretanto o paralelismo irá se mostrar mais eficaz.

####Multithread **N** = 100000000
```javascript
ArchC: Reading ELF application file: myprogs/mediavetor.mips
ArchC: -------------------- Starting Simulation --------------------
Vetor de tamanho [1000000] inicializado: { 0, 2, 4, 6, ..., 1999996, 1999998 }
Processor number 0 summed from index 0 to 500000 and got: -1619776800
ArchC: -------------------- Simulation Finished --------------------
Processor number 1 summed from index 500000 to 1000000 and got: 891396832
Soma vale: -728379968
Media vale: -728
ArchC: -------------------- Simulation Finished --------------------
Info: /OSCI/SystemC: Simulation stopped by user.
ArchC: Simulation statistics
    Times: 0.72 user, 0.00 system, 0.73 real
    Number of instructions executed: 6524457
    Simulation speed: 9061.75 K instr/s
ArchC: Simulation statistics
    Times: 0.72 user, 0.00 system, 0.73 real
    Number of instructions executed: 6540826
    Simulation speed: 9084.48 K instr/s
```
####Singlethread **N** = 100000000
```javascript
ArchC: Reading ELF application file: myprogs/mediavetorSingleThread.mips
ArchC: -------------------- Starting Simulation --------------------
Vetor de tamanho [1000000] inicializado: { 0, 2, 4, 6, ..., 1999996, 1999998 }
Processor number 0 summed from index 0 to 1000000 and got: -728379968
ArchC: -------------------- Simulation Finished --------------------
ArchC: Simulation statistics
    Times: 0.78 user, 0.00 system, 0.80 real
    Number of instructions executed: 9024453
    Simulation speed: 11569.81 K instr/s
```

##Conclusão
O ganho de paralelismo foi surpreendentemente pequeno, no caso singlethread tivemos 0.80 segundos de tempo real enquanto no multithread tivemos 0.73 segundos de tempo real. O ganho é de aproximadamente 9% em uma aplicação altamente paralelizável, por isso é surpreendentemente pequeno. Talvez tenha sido alguma imprecisão de simulação ou falta de multiprocessamento da parte do servidor ssh do laboratório do ic. 
