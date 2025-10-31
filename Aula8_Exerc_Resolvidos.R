dados = readxl::read_excel('plan1.xlsx')
dados

aggregate(temp ~ local, data = dados, FUN = mean)


