# Data Preprocessing template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('/tmp/Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
# Para la X lo hacemos asi para que quede una matriz y no un vector

y = dataset.iloc[:, 2].values

# No tenemos suficientes datos para separar en training y test
#from sklearn.cross_validation import train_test_split
#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling - No hace falta porq la mayoria de los metodos ya lo hacen
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)"""

# Construimos un Modelo Lineal para comparar luego
from sklearn.linear_model import LinearRegression
lin_reg = LinearRegression()
lin_reg.fit(X,y) 

# Modelo de Regresión Polinómico
# lo que vamos a hacer primero es crear una nueva matriz con un predictor (X) y su cuadrado
from sklearn.preprocessing import PolynomialFeatures
poly_reg = PolynomialFeatures(degree=2)
X_poly = poly_reg.fit_transform(X)

# Ahora hacemos un Modelo basado en el mismo metodo de Regresion Linear
lin_reg_2 = LinearRegression()
lin_reg_2.fit(X_poly,y)

# Visualizacion de la Linear Regresion Simple
# primero los puntos de las observaciones reales (los salarios)
plt.scatter(X,y, color = 'red')
# luego los estimados de los mismos puntos pero con el modelo de regresion linear simple
plt.plot(X,lin_reg.predict(X), color='blue')
plt.title('Modelo de Regresion Linear Simple')
plt.ylabel('Salario')
plt.xlabel('Nivel de Cargo')
plt.show()

print(lin_reg.predict(10))
print(lin_reg.predict(6.5))

# Visualizacion de la Polynomial Regression 
# primero los puntos de las observaciones reales (los salarios)
plt.scatter(X,y, color = 'red')

# luego los estimados de los mismos puntos pero con el modelo de regresion linear simple
plt.plot(X,lin_reg_2.predict(poly_reg.fit_transform(X)), color='blue')
plt.title('Modelo de Regresion Linear Polinomica')
plt.ylabel('Salario')
plt.xlabel('Nivel de Cargo')
plt.show()

print(lin_reg_2.predict(poly_reg.fit_transform(10)))
print(lin_reg_2.predict(poly_reg.fit_transform(6.5)))


# Creamos un modelo con grado 3
poly_reg3 = PolynomialFeatures(degree=3)
X_poly3 = poly_reg3.fit_transform(X)
lin_reg_3 = LinearRegression()
lin_reg_3.fit(X_poly3,y)

plt.scatter(X,y, color = 'red')
# luego los estimados de los mismos puntos pero con el modelo de regresion linear simple
plt.plot(X,lin_reg_3.predict(poly_reg3.fit_transform(X)), color='blue')
plt.title('Modelo de Regresion Linear Polinomica')
plt.ylabel('Salario')
plt.xlabel('Nivel de Cargo')
plt.show()

# Creamos un modelo con grado 4
poly_reg4 = PolynomialFeatures(degree=4)
X_poly4 = poly_reg4.fit_transform(X)
lin_reg_4 = LinearRegression()
lin_reg_4.fit(X_poly4,y)

plt.scatter(X,y, color = 'red')
# luego los estimados de los mismos puntos pero con el modelo de regresion linear simple
plt.plot(X,lin_reg_4.predict(poly_reg4.fit_transform(X)), color='blue')
plt.title('Modelo de Regresion Linear Polinomica')
plt.ylabel('Salario')
plt.xlabel('Nivel de Cargo')
plt.show()

# Hacemos un cambio en la resolución del eje X para que quede mas smoothy
X_grid = np.arange(min(X), max(X), 0.1)
# Hacemos un reshape para que quede una matriz de N x 1
X_grid = X_grid.reshape((len(X_grid),1))

# Ahora solo hay que cambiar la X por X_grid
plt.scatter(X,y, color = 'red')
# luego los estimados de los mismos puntos pero con el modelo de regresion linear simple
plt.plot(X_grid,lin_reg_4.predict(poly_reg4.fit_transform(X_grid)), color='blue')
plt.title('Modelo de Regresion Linear Polinomica')
plt.ylabel('Salario')
plt.xlabel('Nivel de Cargo')
plt.show()