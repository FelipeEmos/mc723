Exercício 3 : Contagem de ciclos
===================
######Aluno: Felipe de Oliveira Emos
######RA: 146009
######Email: felipe.emos.computacao@gmail.com
O enunciado do exercício se encontra no site: http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/ex3.html

##Introdução
Este exercício tem como objetivo a familiarização com as ferramentas de simulação de arquitetura, descritas no [enunciado](http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/ex3.html).

##Atividade - Contando instruções
Primeiramente deveriamos contar quantas instruções de **add** existem em certos códigos em **C** compilados para arquitetura *mips*. O código mais básico da programação C, o chamado *"Helloworld"*, não contém nenhuma instrução de **add** quando compilado pra *mips*.
```javascript
//Helloworld.c
#include <stdio.h>
int main(){ 
	printf("Helloworld!\n");
}
```

À primeira vista isto é bem estranho, pois a função *printf* trata strings e muito provavelmente devem ser feitas operações de soma. Para eliminar essa dúvida sobre as somas dentro do *printf* o próximo passo investigativo foi compilar o seguinte codigo:
```javascript
//Soma.c
#include <stdio.h>
int main(){
	int a, b, c;
	a = 1;
	b = 2;
	c = a + b;
	printf("Soma: %d\n", c);
}
```

O código *Soma.c* com certeza tem operações de soma, porém ao investigar suas instruções *mips* geradas na compilação não existem instruções de **add**!

Uma análise mais cuidadosa dos conjuntos de instruções geradas na cmpilação revela que são geradas muitas instruções deo **addu**. Após este resultado foi consultado o manual de instruções *mips* : http://www.mrc.uidaho.edu/mrc/people/jff/digital/MIPSir.html 

A instrução de **add** gera interrupções em casos de overflow, enquanto a instrução de **addu** ignora todos os overflows (que é o comportamento padrão da linguagem **C**). Como em termos de operações de bits as somas com sinal são iguais às somas sem sinal os efeitos de um **add** podem ser perfeitamente replicados por **addu**. Mais referências procure por somadores binários e representação de números negativos por complemento.

##Atividade - Avaliando o desempenho

