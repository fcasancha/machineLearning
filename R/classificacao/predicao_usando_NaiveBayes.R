# Fazer previsao de novos dados (Produ��o), utilizando modelo previamente criado

# carregar dados para previsao
novocredito = read.csv(file.choose(), sep=',', header=T)

novocredito
dim(novocredito)

#predi��o, dados o modelo e os dados novos
predict(modelo, novocredito)