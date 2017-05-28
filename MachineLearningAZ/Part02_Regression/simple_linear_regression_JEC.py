# Regresion Lineal Simple (JEC)

# Importamos librerias
import os;

print os.getcwd();
#os.chdir(r"C:\Users\n062300\Dropbox\Cursos Udemy\MachineLearningA-Z\Part 2 - Regression\Section 4 - Simple Linear Regression")
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importando el dataset
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

# Separamos en Training y Test
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.33, random_state = 0)

# Escalado - En este caso no hace falta
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

# Hacemos el ajuste de Simple Linear Regression al conjunto Training
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Hacemos la prediccion sobre el dataset de Test
y_pred = regressor.predict(X_test)

# Visualizamos los resultados de training
plt.scatter(X_train, y_train, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salario vs Experiencia (Training set)')
plt.xlabel('Anios de Experiencia')
plt.ylabel('Salario')
plt.show()

# Visualizamos los resultados de test
plt.scatter(X_test, y_test, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color = 'blue')
plt.title('Salario vs Experiencia (Test set)')
plt.xlabel('Anios de Experiencia')
plt.ylabel('Salario')
plt.show()