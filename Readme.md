# NutridAIet 馃Ζ

**La aplicaci贸n para planificar tu men煤 con IA**

## Descripci贸n
NutridAIet es una aplicaci贸n capaz de ayudarte a planificar cual es el men煤 que dentro de tus restricciones cal贸ricas te va a satisfacer m谩s.

## Funcionamiento
La funcionalidad de recomendaci贸n de recetas se fundamenta en el filtrado colaborativo. En concreto se utiliza la implementaci贸n del algoritmo SVD ofrecida por la librer铆a Surprise.

Otra funcionalidad extra es la extracci贸n de los ingredientes de la lista de la compra para solo ofrecer recetas con dichos ingredientes. Para esta funcionalidad se utiliza el algoritmo de NLP RoBERTa combinado con la api de visi贸n de Google.

## Dataset utilizado
La base de datos utilizada para entrenar los modelos es [food.com](https://www.kaggle.com/shuyangli94/food-com-recipes-and-user-interactions).

## Estructura del proyecto

- Backend: En el fichero backend encontramos la implementaci贸n de los modelos de recomendaci贸n y NLP; el fichero load_data que formatea los datos y los carga en la base de datos y, la API Rest para poder acceder al servicio desde el frontend. 
- Frontend: Interfaz visual de la aplicaci贸n desarrollada con Flutter.