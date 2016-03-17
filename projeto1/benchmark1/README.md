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
Para compilar o ImageMagick, seguir as seguintes etapas : 

Unpack the distribution with this command:
``tar xvzf ImageMagick.tar.gz``

Next configure and compile ImageMagick:
```
 cd ImageMagick-6.9.3
 ./configure --prefix=/home/.../directory --disable-installed
 make
 make install
 ```
 
## Como executar
Para executar o programa, é só ir no arquivo indicado depois de ``--prefix=``, e executar :   
```./ImageMagick/bin/convert in.png [options] out.png```

## Como medir o desempenho
Como que o desempenho foi medido através deste programa? Se for através de tempo, você deve especificar claramente qual tempo deveria ser utilizado e indicar o motivo aqui. Quantas vezes a medida deveria ser feita? O que fazer com ela (média, etc) ? Não especificar o tempo seria considerado falha grave.

Para medir o desempenho através deste programa vamos fazer medições "perf stat-B **command**" com as seguintes operações:
* Gerar uma imagem 5000x5000 pixels com *noise* aleatório
* Aplicar um filtro de distorção:
</br>Ex:</br> ![Example of filter](http://www.imagemagick.org/Usage/canvas/tile_distort_polar.gif)
* Gerar uma imagem 5000x5000 pixels com o seguinte padrão que está imbutido no software:
</br></br> ![Plasma Pathern](http://www.imagemagick.org/Usage/canvas/plasma_seeded.jpg)
* Aplicar o mesmo filtro de distorção anterior

Agora, podemos medir as performenças executando o seguinte comando :
```./ImageMagick/bin/convert big.png -resize 5% little.png```

Para medir o tempo de execução, usamos este comando :   
```time ./ImageMagick/bin/convert big.png -resize 5% little.png```
Podemos fazer uma media de umas 10 dessa medida, para ter um valor mais certo.
No computador em que testamos, demorou em media ```12.425 secundos```.


## Como apresentar o desempenho
Como o desempenho deverÃ¡ ser mostrado. Margem de erro, etc. 

## MediÃ§Ãµes base (uma mÃ¡quina)
Inclua a especificaÃ§Ã£o dos componentes relevantes e os resultados de desempenho.



#Deprecated STUFF
Por isso, basta executar o seguinte comando, e esperar que baixe :  
```wget http://eoimages.gsfc.nasa.gov/images/imagerecords/73000/73726/world.topo.bathy.200406.3x21600x21600.A2.png```   
Mudamos o nome da imagem com esse comando, para deixar os comandos seguintes mais simples :   
```mv world.topo.bathy.200406.3x21600x21600.A2.png big.png```   

