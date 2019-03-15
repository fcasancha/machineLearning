#install.packages("arules")
library(arules)

#cada compra em uma linha, com atrib sep por virgula
transacoes = read.transactions(file.choose(), format = "basket", sep=",")
transacoes

# Minera��o das regras de associa��es
# enviando dados de transa��es, em parametrer: suporte e max de itens
regras = eclat(transacoes, parameter = list(supp=0.1, maxlen=15))

# Visualizando as regras criadas
inspect(regras)
