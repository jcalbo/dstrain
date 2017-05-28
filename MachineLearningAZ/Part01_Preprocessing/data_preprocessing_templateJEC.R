# Data Preprocessing en R

# Importamos el dataset
dataset = read.csv('Data.csv')
head(dataset)
# dataset = dataset[, 2:3]

# Dividimos el dataset en Training y Test con caTools
# install.packages('caTools')
library(caTools)
set.seed(123)

# Tratamos los datos faltantes con la media
# En este caso Age y Salary 
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# Codificamos los datos categoricos
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

# Con SplitRatio establecemos el porcentaje de separacion
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Escalado
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])
