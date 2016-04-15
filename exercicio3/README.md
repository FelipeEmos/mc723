Exercício 3 : Contagem de ciclos
===================
######Aluno: Felipe de Oliveira Emos
######RA: 146009
######Email: felipe.emos.computacao@gmail.com
O enunciado do exercício se encontra no site: http://www.ic.unicamp.br/~lucas/teaching/mc723/2016-1/ex3.html

##Introdução
Este exercício tem como objetivo a familiarização com as ferramentas de simulação de arquitetura.


##Atividade
Primeiramente é importante descobrir os melhores parâmetros para serem colocados no processo de compilação para que se tenha aumento de desempenho. Os experimentos a seguir não envolveram modificação na lógica do código, foram apenas mudanças de parâmetro de compilação.
######Obs: Os arquivos referentes a essa seção estão em ["programa1"](src/programa1). Os dados a seguir podem ser conferidos nos arquivos ".log" na [pasta log](log/)

> Trecho paralelizado do [programa4](src/programa4)
```javascript
#pragma omp parallel for   \
default(shared) private(i) \
reduction(+:count) 
for (i = 3; i < n; i+=2){
		if (primo(i)){
			count++;
	}
}
```
##Conclusão
