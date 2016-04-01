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

######Obs1: É muito recomendado que, para acompanhar corretamente esse relatório, a tabela esteja aberta, pois existem muitas referências a mesma.
######Obs2: Os dados dessa planilha são os mesmos da planilha da disciplina, porém em uma formatação diferente.

##Analisando os dados (Parte 3)

As 3 máquinas nas quais aplicasmos os benchmarks são muitos distintas nas especificações de seus poderes de processamento, logo era esperado também que suas medições de processamento fossem muito distintas.
* Máquina 15 - Notebook pessoal do aluno Gabriel Magalhães - Intel® Core™ i7-3612QM CPU @ 2.10GHz × 8; Memory 8GB, SSD Kingston 240GB V300 Sata III;  Ubuntu 15.04 
* Máquina 17 - Desktop da sala 301 do instituto de computacao (Nome: Titan) - Intel® Core™2 Quad CPU Q8400 @ 2.66GHz × 4 Intel® Q45/Q43, 3.8GB RAM
* Máquina 31 - Netbook pessoal do aluno Felipe Emos - Intel Atom Processor D4xx/D5xx/N4xx/N5xx DMI Bridge, 1GB RAM; Ubuntu 14.04


Olhando apenas para as especificações, o Notebook é para se sair como o melhor dos 3, seguido pelo Desktop do Instituto de computação e por último o Netbook, falta agora analisar os dados para averiguar se eles corroboram essa previsão.

#### Benchmark 4 - Gnuplot
Esse benchmark plota, com a ferramenta **gnuplot**, gráficos com um número bem alto de pontos e mede o tempo real e de clock gastos na operação. Para a medição de tempo utiliza-se uma ferramenta auxiliar recomendada para essa atividade chamada **perf**.

Esse tipo de operação não faz acesso a disco e idealmente carrega o programa todo em RAM. A operação não é muito demorada e portanto o tempo de execução pode estar um pouco contaminado por algumas eventuais operações do escalonador do sistema operacional. Apesar desse possível problema, para caráter comparativo, a medição do benchmark já foi coerente com a previsão. Classificando em desempenho:</br>
> Notebook (Máquina 14) > Desktop (Máquina 17) > Netbook (Máquina 31)

#### Benchmark 5 - Ordenação
Esse benchmark executa com um código em *C* várias operações de ordenação com algoritmos clássicos de ordenação comparativa:
{Selection Sort, Insertion Sort, Quick Sort ...} (Informações mais específicas podem ser encontradas no repositório Git do grupo desse benchmark) e, com a biblioteca **time.h**, mede o tempo de execução para cada ordenação. Uma observação importante é que o programa dispara apenas um processo e não faz syscalls. Para explicar porque isso é relevante basta pensar que se fosse um programa principal que executa outros programas separados (**quicksort.exe**, **selectionsort.exe**, ...) existiria uma maior variância do benchmark pelo diferente tratamento do escalonador do sistema operacional.

Esse benchmark faz bastante alocação de memória dinamicamente, por causa do método de ordenação **mergesort**, entretanto esse benchmark não faz acesso a disco e não utiliza de paralelismo. Os dados coletados são tempos de execução dos algorítmos contra vetores pré selecionaods pelos criadores do benchmark. Em algumas das linhas da tabela pode-se averiguar uma diferença bem considerável de tempos de execução, como por exemplo a **Média do pior caso, para o algoritmo mais lento.**, entretanto em outras linhas não dá para afirmar com muito peso a comparação de desempenho pois os números são bem próximos (exemplo a linha **Média do pior caso, para o algoritmo mais rápido**). Apesar dos valores próximos em algumas linhas o benchmark consistentemente classificou os computadores em todas as suas categorias conforme o previsto:</br>
> Notebook (Máquina 14) > Desktop (Máquina 17) > Netbook (Máquina 31)

#### Benchmark 6 - Image Magick
Existe uma ferramenta que vem com a maioria das distribuições de Linux chamada "ImageMagick", para outros sistemas operacionais ela também é compativel porém não nativa. O benchmark 6 utiliza de certas funcionalidades do ImageMagick para executar uma operação demorada de processamento de imagem (mais informações olhar o relatório do grupo). Com a ferramenta **perf** o benchmark coleta informações sobre as ditas operações.

Esse benchmark utiliza de muitas funcionalidades da máquina, primeiramente podemos dizer que é feito bastante acesso a disco: as imagens geradas são da casa de 500MB de memória e, além de escrita, quando aplicamos um filtro a uma imagem o computador tem que repetidamente ler e escrever em disco. O Image Magick é um software bem otimizado pela comunidade e suas operações são paralelizadas com OMP e até processamento em placa de vídeo (através de OpenGL).

Quanto às medições existe uma diferença perceptivel entre as máquinas (e que segue as nossas previsões) em todas as operações feitas, entretanto as operações de filtro (#2 e #4) são bem gritantes. O Notebook faz a operação #4 aproximadamente 4.5 vezes mais rápido do que o Netbook. O palpite é que essas operações de filtro tem muito acesso a disco e o SSD do Notebook (Máquina 14) deve ter feito uma boa diferença, além de que o poder de processamento de um **Intel i7** é muito maior que o de um processador **Intel Atom** de um Netbook. Um dado coletado que vale mencionar é que o Notebook utiliza mais **CPUs** que os demais, ou seja, o código está mais bem paralelizado no Notebook do que nos outros. Isso ocorre porque tanto a otimização do OMP quanto a do OpenGL favorecem o Notebook, que tem um hardware que é extremamente beneficiado com as tais ferramentas e portanto consegue paralelizar muito bem essas operações de imagem.</br>
Ranking de desempenho do benchmark:</br>
> Notebook (Máquina 14) > Desktop (Máquina 17) > Netbook (Máquina 31)
