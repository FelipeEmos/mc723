Exercício 2 : Configuração de Cache
===================
######Aluno: Felipe de Oliveira Emos
######RA: 146009
######Email: felipe.emos.computacao@gmail.com
O enunciado do exercício se encontra no site: http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/ex2.html

##Introdução
Nesse exercício o aluno deveria utilizar um software de simulação de cache em traces de execução para observar a influência dos tamanhos de cache nos "misses" de cache. Para tal foi utilizado o [*dinero*](http://www.cs.wisc.edu/~markhill/DineroIV/) e os traces fornecidos pelo professor.
Com a intenção de facilitar o processo de testes fiz um [script shell](script.sh) que, uma vez especificados os traces e as configurações de tamanho de cache L1 de dados e L1 de instruções, executa o dinero com todas as combinações especificadas e captura os logs de "miss".

##Atividade
Como dito no enunciado do exercício:
> Cada aluno terá duas opções de exercício (escolha à vontade):
* Simular um programa com dois níveis de cache e achar a melhor configuração para os dois níveis (L1 de instruções, L1 de dados e L2 unificado). Você pode usar qualquer um dos 46 traces que estão disponíveis (cada programa tem dois traces, f2b e m2b, veja informações sobre isso na página dos traces).
* Simular 4 programas com um nível de cache e achar a melhor configuração (L1 de instruções e L1 de dados). Escolha 4 programas distintos do conjunto de programas, não pegue uma versão f2b junto com m2b.

Foi escolhido para esse relatório a segunda opção: "Simular 4 programas com um nível de cache e achar a melhor configuração (L1 de instruções e L1 de dados)"

##Considerações iniciais
Algo que vale mensionar é que, como aprendemos em mc722 (Projeto de Sistemas Computacionais), uma cache utiliza, no mapeamento dos objetos armazenados, um pedaço do binário da palavra de memória, por exemplo:

> Exemplo de dado ou instrução: 0011010100011011101011**0101101010**

Neste exemplo a parte em **negrito** da palavra representa o endereço em que a palavra será cacheada.

Isto é importante saber porque a consequência dessa propriedade é que as caches devem ter seu tamanho em potências de *2*. Do contrário as caches ou teriam seus espaços mal utilizados ou a operação de endereçamento seria "muito complexa". A operação de endereçamento de um dado deve ser tão simples e rápida quanto a operação de encaminhar uma fração dos fios da palavra de memória, que é o que fazemos: pegamos apenas "n" bits de uma palavra. O número de bits que usamos depende do tamanho da cache.

##[Experimento 1](experiment1)
Primeiramente decidi fazer uma permutação dos tamanhos de cache L1 de dados e instruções, variando-os no seguinte espaço amostral: **{ 16kB, 32kB, 64kB, 128kB  }**

O resultado nas tabelas de data_misses e instruction_misses para cada trace de execução. Os traces escolhidos arbitrariamente foram: **{ equake_f2b,  parser_f2b,  eon_f2b,  gap_f2b }**. Todas essas tabelas tiveram um comportamento semelhante e de certa forma esperado, veja um [exemplo](experiment1/eon_f2b/data_misses.log):
> Table of data misses:

>InsXData,     16K,     32K,     64K,     128K</br>
    16K,   0.0231	,   0.0134	,   0.0060	,   0.0008	
    32K,   0.0231	,   0.0134	,   0.0060	,   0.0008	
    64K,   0.0231	,   0.0134	,   0.0060	,   0.0008	
    128K,   0.0231	,   0.0134	,   0.0060	,   0.0008

A conclusão trivial ao olhar para esses dados é que alterações no tamanho da cache de instruções não influenciam na tacha de "miss" da cache de dados.

##[Experimento 2](experiment2) - L1 de instruções
Agora que costatamos o resultado da indepenência das caches podemos escolher um valor arbitrário para uma das caches e, apenas variando o tamanho da outra, inferir o resultado dos experimentos que não fizemos. Exemplificando: uma vez feito o experimento da "miss rate" de dados de uma cache *L1-Dados = 64kB X L1-Instruções = 64kB* podemos inferir que o resultado será o mesmo para qualquer valor da cache L1-Instruções.

Para o experimeto 2 foi medido o "miss rate" de instruções, fixamos a cache de dados em **64kB** e variamos apenas a cache de instruções no espaço amostral:
**{ 16kB, 32kB, 64kB, 128kB, 256kB, 512kB, 1024kB, 2048kB, 4096kB }**

Para visualizar o gráfico e tabela utilize este [link](TODO).

##[Experimento 3](experiment3) - L1 de dados
Para o experimeto 3 foi medido o "miss rate" de dados, fixamos a cache de instruções em **64kB** e variamos apenas a cache de dados no espaço amostral:
**{ 16kB, 32kB, 64kB, 128kB, 256kB, 512kB, 1024kB, 2048kB, 4096kB }**

Para visualizar o gráfico e tabela utilize este [link](TODO).
