dados = readxl::read_excel('plan1.xlsx')
dados

# Média da temperatura por local
aggregate(temp ~ local, data = dados, FUN = mean)

# Média da salinidade por local E estação
aggregate(sal ~ local + estacao, data = dados, FUN = mean)

# Soma da abundância por estação
aggregate(sp1 ~ estacao, data = dados, FUN = sum)

# Quantas amostras tenho por local?
aggregate(temp ~ local, data = dados, FUN = length)

# Para selecionar várias colunas para mostrar: 
aggregate(dados[, c("temp", "sal", "pH")],
           by = list(Local = dados$local,
                     Estacao = dados$estacao),
           data = dados,
           FUN = mean)

dad = readxl::read_excel('limno.xlsx')
dad
