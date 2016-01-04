# 0.3 Test de Hipotesis

# Voy a crear dos conjuntos de datos (2 listas):
# Usando un p-valor de rechazo del 0.05, dime en cuántos y qué casos:
#   - Hay un error de tipo I.
#   - Se acierta al rechazar la hipótesis nula (de igual distribución).
#   - Hay un error de tipo II.
#   - Se acierta al rechazar la hipótesis nula.

set.seed(1234) # para que dé siempre el mismo resultado
#rnorm(n, mean = 0, sd = 1)

foo <- function() list(a = rnorm(20), b = rnorm(20))

lista.a <- replicate(1000, foo(), simplify = F)

#boxplot(lista.a[[1]]$a,lista.a[[1]]$b)
#boxplot(lista.a[[2]]$a,lista.a[[2]]$b)
#mean(lista.a[[1]]$a)
#mean(lista.a[[1]]$b)

# H0: las distribuciones tienen la misma media (ambas estan generadas con la misma distribucion)
# H1: las distribuciones tienen diferente media

acepta_H0<-0
rechaza_H0<-0


in1<-0
in2<-0

milista_H0=list()
milista_NOH0=list()

for (i in 1:1000) {

    p<-t.test(lista.a[[i]]$a, lista.a[[i]]$b) 
  
  if(p$p.value>0.05){
    in1<-in1+1
    acepta_H0<-acepta_H0+1
    milista_H0[[in1]]<-list(a=lista.a[[i]]$a,b=lista.a[[i]]$b)
  
    } else {
    in2<-in2+1
    rechaza_H0<-rechaza_H0+1
    milista_NOH0[[in2]]<-list(a=lista.a[[i]]$a,b=lista.a[[i]]$b)
  }
}


# Dado que los datos se han generado segun una misma distribucion, H0 es VERDADERA
# todos los valores p>0.05 nos permiten aceptar H0
# acepta_H0 es el numero de aciertos en aceptar H0 tal que H0 es verdadera
acepta_H0

# Entonces, los errores Tipo I se producen cuando se rechaza H0 tal que H0 es verdadera
rechaza_H0
# Esta es lista de casos en los que se ha rechazado H0 
milista_NOH0

# Ejemplo para el 1er elemento de la lista de rechazados
t.test(milista_NOH0[[1]]$a, milista_NOH0[[1]]$b)
boxplot(milista_NOH0[[1]]$a, milista_NOH0[[1]]$b)

t.test(milista_NOH0[[15]]$a, milista_NOH0[[15]]$b)
boxplot(milista_NOH0[[15]]$a, milista_NOH0[[15]]$b)

# En estos casos se rechaza H0 porque para estas observaciones... 


#-------------------------------------------------------------------------
foo2 <- function() list(a = rnorm(50), b = rcauchy(50))
lista.b <- replicate(1000, foo2(), simplify = F)

boxplot(lista.b[[1]]$a,lista.b[[1]]$b)
boxplot(lista.b[[2]]$a,lista.b[[2]]$b)
#mean(lista.a[[1]]$a)
#mean(lista.a[[1]]$b)


acepta_H0<-0
rechaza_H0<-0

for (i in 1:1000) {
  k<-t.test(lista.b[[i]]$a, lista.b[[i]]$b, paired = TRUE) 
  
  if(k$p.value>0.05){
    acepta_H0<-acepta_H0+1
  } else {
    rechaza_H0<-rechaza_H0+1
  }
}

acepta_H0
rechaza_H0
