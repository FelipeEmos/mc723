# Programa 0 - ImageMagick (Grupo 6)

## O que faz? Para que serve?
O programa irá testar um benchmarking de processamento de imagens. Esse benchmark envolve: manipulação de arquivos, multithreading, tempo de processamento.

O ImageMagick permite fazer muitas manipulações de imagens, tais que convertir de um formato para um outro, reduzir o tamanho, compressar, fazer uma rotação, aplicar um filtro... Essas operações são executadas com multithreading, e podem demorar muito se o arquivo de entrada seja pesado e/ou se as manipulações aplicadas forem pesadas. 

## Por que é bom para medir desempenho?
Esse programa é bom para medir o desempenho de um computador porque ele mexe com arquivos (podemos medir o desempenho do disco), com multithreading, e pode ter um tempo de execução suficiente para ter uma medida confiavel. 

## O que baixar
O codigo fonte do ImageMagick pode ser achado nesse site :     
www.imagemagick.org/download/ImageMagick.tar.gz

## Como compilar/instalar
Na maioria dos computadores de distribuição Linux o ImageMagick já vem instalado. Para verificar utilize o comando *display*. As instruções a seguir são para caso você não tenha o software e deseja compilá-lo. Vale dizer que os comandos utilizados no nosso benchmark utilizam os "paths" padronizados do software como se ele viesse imbutido na distribuição Linux.


Para compilar o ImageMagick, seguir as seguintes etapas : 

Extraia o arquivo com o comando:
``tar xvzf ImageMagick.tar.gz``

Em seguida configure e compile o ImageMagick:
```
 cd ImageMagick-6.9.3
 ./configure --prefix=/home/.../directory --disable-installed
 make
 make install
 ```
 
## Como executar
Se você já tem o ImageMagick instalado na sua distribuição Linux basta colocar no terminal as palavras chaves de comando. Referências de comando no seguinte [link](http://www.imagemagick.org/script/command-line-processing.php) e na bibliografia ao final do relatório

Para executar o programa, é só ir no arquivo indicado depois de ``--prefix=``, e executar :   
```./ImageMagick/bin/convert in.png [options] out.png```

## Como medir o desempenho
Como que o desempenho foi medido através deste programa? Se for através de tempo, você deve especificar claramente qual tempo deveria ser utilizado e indicar o motivo aqui. Quantas vezes a medida deveria ser feita? O que fazer com ela (média, etc) ? Não especificar o tempo seria considerado falha grave.

Para medir o desempenho através deste programa vamos fazer medições "perf stat-B **command**" com as seguintes operações:
* Gerar uma imagem 5000x5000 pixels com *noise* aleatório
* Aplicar um filtro de blur:
</br>Ex:</br> ![Original Image](http://www.imagemagick.org/Usage/canvas/random.png) ![Blured Image](http://www.imagemagick.org/Usage/canvas/random_10.png)
* Gerar uma imagem 5000x5000 pixels com o seguinte padrão que está imbutido no software:
</br></br> ![Plasma Pathern](http://www.imagemagick.org/Usage/canvas/plasma_seeded.jpg)
* Aplicar o mesmo filtro de distorção anterior

`Obs:` Propõe-se criar uma pasta tmp caso não exista pois as imagens geradas serão de considerável tamanho e poderão preencher o disco desnecessariamente.

## Como apresentar o desempenho
O desempenho será medido através do comando perf stat-B, o qual irá gerar um log par cada execução com informações pertinentes ao benchmark.
Para apresentar o desempenho basta executar o shell script ``benchmark.sh``. Nele será criada uma pasta tmp caso não exista para irá gerar as imagens nela
e irá gerar uma pasta log onde os resultados do perf stat-B serão colocados.

Em cada log gerado haverá uma lista com dados retirados do comando. Dentre elas serão pertinentes os resultados:
 * task-clock 			- representa uma média do número de CPUs utilizadas ao longo do tempo, havendo uma paralelização caso esse número seja maior do que 1.
 * cycles 				- calcula a frequência dos ciclos da máquina durante a execução.
 * instructions 		- mede o número de instruções por ciclo da máquina.
 * tempo de execução - representado pela última linha.

## Medições base (uma máquina)

##Fontes de pesquisa
* http://www.imagemagick.org/Usage/canvas/#random_specks
* http://www.imagemagick.org/Usage/canvas/#random_blur
* http://www.imagemagick.org/Usage/canvas/#plasma_seeded
* http://www.imagemagick.org/script/command-line-processing.php


#Deprecated STUFF
Por isso, basta executar o seguinte comando, e esperar que baixe :  
```wget http://eoimages.gsfc.nasa.gov/images/imagerecords/73000/73726/world.topo.bathy.200406.3x21600x21600.A2.png```   
Mudamos o nome da imagem com esse comando, para deixar os comandos seguintes mais simples :   
```mv world.topo.bathy.200406.3x21600x21600.A2.png big.png```   

