# NutridAIet

**La aplicación para planificar tu menú con IA**

## Descripción
Nutridaiet es una aplicación capaz de ayudarte a planificar cual es el menú que dentro de tus restricciones calóricas te va a satisfacer más.

## Funcionamiento
La funcionalidad de recomendación de recetas se fundamenta en el filtrado colaborativo. En concreto se utiliza la implementación del algoritmo SVD ofrecida por la librería Surprise.

Otra funcionalidad extra es la extracción de los ingredientes de la lista de la compra para solo ofrecer recetas con dichos ingredientes. Para esta funcionalidad se utiliza el algoritmo de NLP RoBERTa combinado con la api de visión de Google.

## Dataset utilizado
La base de datos utilizada para entrenar los modelos es [food.com](https://www.kaggle.com/shuyangli94/food-com-recipes-and-user-interactions).

## Estructura del proyecto

- Backend: En el fichero backend encontramos la implementación de los modelos de recomendación y NLP; el fichero load_data que formatea los datos y los carga en la base de datos y, la API Rest para poder acceder al servicio desde el frontend. 
- Frontend: Interfaz visual de la aplicación desarrollada con Flutter.