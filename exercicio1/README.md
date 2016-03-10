Exercício 1 : Compilação e Otimização
===================
######Aluno: Felipe de Oliveira Emos
######RA: 146009
######Email: felipe.emos.computacao@gmail.com
O enunciado do exercício se encontra no site: http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/ex1.html

##Introdução
Para facilitar a execução dos experimentos, que são muitos, criei um script em shell "timemeasure.sh" que executa todos os arquivos ".exe" dentro de uma pasta "bin" **N** vezes, sendo que esse parâmetro é passado no script pelo usuário, e mede esses tempos de execução. Por fim esses valores de tempo são colocados em arquivos ".log" na pasta log. É feita também uma média dos tempos. Segue um exemplo de log gerado pelo script:

> 'primo.exe' was tested i = 5 times </br>
> real	0m0.400s </br>
> real	0m0.399s </br>
> real	0m0.398s </br>
> real	0m0.399s </br>
> real	0m0.399s </br>
> Avarage:  0.399s </br>

A medição de tempo é feita com o comando "time" já incluído no shell, por isso aparece no log "real", indicando que aquele valor é um tempo real e não um tempo de sistema ou de usuário. Usar o tempo real é mais próximo do que o usuário vivencia e portanto tem mais sentido quando falamos em benchmark. Um possível problema é que há interferência do sistema operacional na medida, o tempo que o escalonador de processos demora para dar poder de processamento à aplicação vai entrar na medição de tempo. Uma forma de evitar uma grande variância do dado é manter um ambiente minimamente controlado (não fazer operações anormais durante o experimento) e fazer uma média de um grande número de medidas (isso é uma boa vantagem do script). Ambas as práticas foram adotadas no experimento.

##Alternando os parâmetros de compilação
Primeiramente é importante descobrir os melhores parâmetros para serem colocados no processo de compilação para que se tenha aumento de desempenho. Os experimentos a seguir não envolveram modificação na lógica do código, foram apenas mudanças de parâmetro de compilação.
######Obs: Os arquivos referentes a essa seção estão em ["programa1"](src/programa1). Os dados a seguir podem ser conferidos nos arquivos ".log" na [pasta log](log/)
* O programa fornecido na página do exercício, "primo.c", quando compilado no gcc sem "tags" adicionais gastou [numero](log/programa1/EX1_primo.log)
* Quando compilado com a tag "-O0" gastou [numero](log/programa1/EX4_primo_O0.log)
* Quando compilado com a tag "-O1" gastou [numero](log/programa1/EX5_primo_O1.log)
* Quando compilado com a tag "-O2" gastou [numero](log/programa1/EX6_primo_O2.log)
* Quando compilado com a tag "-O3" gastou [numero](log/programa1/EX7_primo_O3.log)
</br></br>
Como pode ser visto o melhor método de otimização de compilação foi o ______ ....
</br>Outra forma de otimização é o uso do parâmetro "-mtune": você pode configurar o compilador gcc para gerar um executável otimizado para um grande escopo de máquinas (que usa instruções de processadores IA32/AMD64/EM64T) com o parâmetro "-mtune=generic" ou configurar o compilador para gerar código executável otimizado para um processador específico, por exemplo: "-mtune=i386". Outra possibilidade é compilar com o parâmetro "-mtune=native", isso fará o gcc descobrir **em tempo de compilação** o processador da máquina atual, também gerando executável específico. Vale ressaltar o trivial: um binário específico para um processador não funcionará em processadores que não tem aquele subconjunto de instruções de otimização.
</br></br>
* (Repetindo informação) O programa fornecido na página do exercício, "primo.c", quando compilado no gcc sem "tags" adicionais gastou [numero](log/programa1/EX1_primo.log)
* Quando compilado com o parâmetro "-mtune=native" gastou [numero](log/programa1/EX2_primo_mtune_native.log)
* Quando compilado com o parâmetro "-mtune=generic" gastou [numero](log/programa1/EX3_primo_mtune_generic.log)
</br></br>
Como pode ser visto o melhor método de otimização de compilação foi o ______ ....
</br>Mais uma ideia proposta para otimização foi quebrar o programa inicial "primo.c" em dois arquivos separados "main.c" e "calc_primo.c", compilá-los separadamente e depois ligá-los em um executável.
</br></br>
* (Repetindo informação) O programa fornecido na página do exercício, "primo.c", quando compilado no gcc sem "tags" adicionais gastou [numero](log/programa1/EX1_primo.log)
* O programa gerado com ligamento separado dos dois arquivos gastou [numero](log/programa1/EX8_primo_Linking.log)
</br></br>
Como pode ser visto o melhor método de otimização de compilação foi o ______ ....

##Modificando o código
Após os testes com o programa dado foi pedida a modificação do código:
> Modifique seu programa para calcular quantos números primos existem entre 1 e n, seguindo o mesmo algoritmo utilizado, modificando apenas a função main e fazendo com que n seja um parâmetro passado por linha de comando.

######Obs: Este novo código é chamado nos arquivos de ["programa2"](src/programa2)
Como pedido foram feitos experimentos calculando os primeiros **N** primos sendo **N** um número grande, foi usado arbitrariamente **N=10.000**.
* Compilando o programa em um arquivo temos tempo de execução de ________
* Compilando o programa em dois arquivos separados temos tempo de execução de ________
</br></br>
Como pode ser visto o melhor método de otimização de compilação foi o ______ ....


Foi pedido que usássemos o *gprof* nesses dois códigos e foram obtidos os seguintes resultados:
######Obs: O experimento do *gprof* por motivos de organização se encontra em "programa3"
* [Log **gprof** da compilação com um arquivo](src/programa3/bin/analysisEX1.txt)
* [Log **gprof** da compilação com dois arquivos](src/programa3/bin/analysisEX2.txt)


