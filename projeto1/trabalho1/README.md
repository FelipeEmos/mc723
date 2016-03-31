Trabalho 1 (Projeto 1): Benchmarking
===================
######Aluno: Felipe de Oliveira Emos </br>RA: 146009</br>Email: felipe.emos.computacao@gmail.com
O enunciado do trabalho encontra-se no site: http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/p1.html

##Introdução
Uma necessidade do desenvolvimento e da evolução da computação é a medição de desempenho de nossas máquinas. Apesar de, a primeira vista, parecer uma tarefa simples, na prática encontramos várias dificuldades nas tarefas de comparação e medição de desempenho de máquinas. Para começar, "melhor desempenho" é um critério amplo demais para um processo tão complexo quanto a execução de um processo num computador, é preciso estipular um crivo bem definido de testes: estaremos medindo capacidade de paralelismo? Velocidade de acesso a disco? Processamento gráfico? </br></br>
Isso é importante porque uma máquina especializada de servidor, por exemplo, ganha em desempenho contra máquinas normais em certos tipos de operação e perde em outros. Qual é a melhor máquina? A resposta é: "depende do critério".</br></br>
Outro conceito importante de se ter em mente é a preocupação com medições artificiais. Por mais que seja ampla a definição de "melhor desempenho", é um consenso entre os desenvolvedores de benchmark que a medição deve ser feita nas condições mais próximas o possível das reais, e isso significa na maioria das vezes executar aquela funcionalidade sendo testada nas condições do "dia a dia" da máquina. Para esclarecer melhor pense que a máquina A é um servidor e fica com certos processos sempre ativos, o correto é executar o benchmark simulando as consdições normais de operabilidade: junto com os outros processos. Fazer a medição em um ambiente incomum irá gerar uma medição chamada de "artificial", e já que queremos o máximo de consistência com o mundo real isso pode ser bem ruim.

##Criando um benchmark (Parte 1)
Nessa primeira parte do projeto fomos separados em grupos de 3 pessoas e foi pedido que criássemos um benchmark para, mais tarde, comapararmos as capacidades de desempenho dos computadores do instituto de computação e de algumas máquinas pessoais de alguns alunos. </br>
O benchmark do meu grupo (ImageMagick) pode ser encontrado nesse mesmo repositório, basta navegar pelo [sumário](https://github.com/FelipeEmos/mc723).
Os benchmarks dos outros grupos também estão em repositórios publicos e seus links podem ser encontrados na página do [exercício](http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/p1.html).

##Medindo os desempenhos (Parte 2)
Nessa segunda parte fomos novamente divididos em grupos, só que de tal forma que duas pessoas de um mesmo grupo da primeira parte não ficássem juntas na segunda parte. Isso é importante porque desta forma todo grupo teria 3 ferramentas de benchmark criadas previamente para agora utilizar nas medições dos computadores. Os 3 benchmarks do meu grupo foram:
 1.  Benchmark 4 - Gnuplot
 2.  Benchmark 5 - Ordenação
 3.  Benchmark 6 - ImageMagick
 

Aplicamos os 3 benchmarks em cima de 3 máquinas diferentes e os dados dessas medições pode ser encontrado na seguinte [planilha](https://docs.google.com/spreadsheets/d/1qFhDX_s1gsIl7PeIimqz-Qh4VMi9qASxFH5sLqxjveA/edit?usp=sharing).

######Obs: Os dados dessa planilha são os mesmos da planilha da disciplina, porém em uma formatação diferente.

##Analisando os dados (Parte 3)
