# regresion Polinomica (JORGE)
library(ggplot2)
# Importing the dataset
dataset = read.csv('Position_Salaries.csv')

# me quedo solo con el puesto y el salario
dataset = dataset[2:3]

# como el dataset es muy chico no hacemos la separacion
#--------------------------------------------------------
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#library(caTools)
#set.seed(123)
#split = sample.split(dataset$Purchased, SplitRatio = 0.8)
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

# no es necesario hacer el escalado porq ya lo hace el metodo
#--------------------------------------------------------
# Feature Scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Primero construimos el Modelo Lineal Simple para comparar
lin_reg = lm(formula = Salary ~ . ,
             data = dataset)

# Visualizamos el Modelo lineal simple
ggplot() +
  geom_point(aes(x = dataset$Level , y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y=predict(lin_reg, newdata=dataset)),
             colour = 'blue') +
  ggtitle("Mi Titulo") +
  xlab("Puesto") +
  ylab("Salario")


# Ahora construimos el Modelo polinomico
#---------------------------------------------------------------
# realmente podemos utilizar el mismo metodo lm() pero agregando
# variables independientes X en sus potencias... las que necesitemos

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4

poly_reg = lm(formula = Salary ~ . ,
             data = dataset)

# Visualizamos el Modelo Polinomico
#-------------------------------------
ggplot() +
  geom_point(aes(x = dataset$Level , y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y=predict(poly_reg, newdata=dataset)),
            colour = 'blue') +
  ggtitle("Mi Titulo") +
  xlab("Puesto") +
  ylab

# Haciendo las predicciones
#--------------------------

# Lineal simple
# la función predict siempre espera data.frames
y_pred = predict(lin_reg, newdata=data.frame(Level=6.5))

# Polinomica (grado 4)
# ahora tengo que agregar los valores ^2 ^3 ^4
y_pred2 = predict(poly_reg, newdata=data.frame(Level=6.5, 
                                              Level2=6.5^2,
                                              Level3=6.5^3,
                                              Level4=6.5^4))
ggplot() +
  geom_point(aes(x = dataset$Level , y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level , y=predict(poly_reg, newdata=dataset)),
            colour = 'blue') +
  geom_point(aes(x = 6.5 , y=y_pred2),
             colour = 'red') +
  ggtitle("Mi Titulo") +
  xlab("Puesto") +
  ylab