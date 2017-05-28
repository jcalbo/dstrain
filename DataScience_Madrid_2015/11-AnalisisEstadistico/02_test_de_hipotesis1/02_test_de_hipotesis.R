# Busca un test no paramétrico alternativo al de Student y aplícalo al caso 
t.test(extra ~ group, data =sleep)
# Explica la salida.

# Para el t-test la salida sería asi:
#                       Welch Two Sample t-test
# data:  extra by group
# t = -1.8608, df = 17.776, p-value = 0.07939
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
# -3.3654832  0.2054832
# sample estimates:
# mean in group 1 mean in group 2 
#           0.75            2.33


# utilizo el Test No Parametrico de Wilcoxon
wilcox.test(extra ~ group, data =sleep)

# En este caso la salida es:
#         Wilcoxon rank sum test with continuity correction

# data:  extra by group
# W = 25.5, p-value = 0.06933
# alternative hypothesis: true location shift is not equal to 0


