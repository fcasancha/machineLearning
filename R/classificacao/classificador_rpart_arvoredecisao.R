# �rvore de Decis�o com R Part - 
# Pode ser usado para Classifica��o ou para Regress�o
install.packages("rpart", dependencies = T) # Instala��o da biblioteca rpart
library(rpart) # Carrega biblioteca

# carrega arquivo de dados que ser�o classificados, separa��o por v�rgula e cabe�alho True
credito = read.csv(file.choose(), sep = ',', header = T)

# Separar Dados de treino e teste para posterior constru��o e avalia��o do modelo
# Par�metros: 2 conjuntos, 1000 entradas, com reposi��o,  % de treino e teste respectivamente
amostra = sample( 2, 1000, replace = T, prob = c(0.7,0.3) )
conj_treino = credito[amostra==1,]
conj_teste = credito[amostra==2,]

# Cria��o da �rvore de Decis�o - Modelo de classifica��o
# Par�metros: atributo de classifica��o e os demais (. = todos), 
#    os dados de treino, m�todo pode ser: classifica��o ou regress�o
arvore = rpart(class ~., data=conj_treino, method="class")

print(arvore) #impress�o da �rvore gerada
# Impress�o da �rvore gerada de forma gr�fica
plot(arvore)
text(arvore, use.n = TRUE, all = TRUE, cex=.8) #aparecer valores nas folhas

# Predi��o do conjunto de teste - Probabilidade por classe
# Par�metros: modelo (�rvore), conjunto a ser classificado 
teste_classif = predict(arvore, newdata = conj_teste )
teste_classif

# Converter probalidade para valor bin�rio (bom ou exclusivo mau)
# Cbind add uma coluna em cred
# Par�metros: conj de teste, dados de predi��o realizada sobre o conj. teste
cred = cbind(conj_teste, teste_classif)
fix(cred) #mostra o resultado de cred
cred['Result'] = ifelse(cred$bad >=0.5, "bad", "good")

# matriz de confus�o
confusao = table(cred$class, cred$Result)
confusao

# Taxas de Acerto e de Erro
taxaacerto = (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto
taxaerro = (confusao[2] + confusao[3]) / sum(confusao)
taxaerro


