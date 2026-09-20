---
layout: post
current: post
cover: assets/images/2020-04-06-arduino-para-el-cuidado-de-plantas/cover.jpg
navigation: True
title: Arduino para el cuidado de plantas
date: 2020-03-26 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
published: true
---

No solo se trata de un microcontrolador que permite automatizar los cuidados de las plantas, Arduino es mucho más que eso.

Yo uso Arduino como la pieza principal a la hora de controlar la humedad, riego o temperatura de mis plantas, pero veamos qué es realmente un microcontrolador. **Un microcontrolador se trata de un circuito integrado que básicamente ejecuta operaciones programadas en base a unas entradas y unas salidas de datos.**

### No tengo ni idea de qué es un circuito integrado
Si ya has leído sobre este tema, puedes saltarte este apartado.

En otro post hablaré detalladamente sobre esto, pero podemos imaginar un circuito como una red de carreteras contectadas entre sí de forma cerrada. Los vehículos son mensajeros que circulan en las carreteras y transportan **datos** sobre, por ejemplo, la temperatura del ambiente o sobre si abrir o cerrar una válvula de riego.

Podemos diferenciar entre datos de **entrada** y datos de **salida**, lo que comunmente en inglés podemos ver como I/O (Input - Output). 

Los datos de entrada se generan mediante sensores que capturan información del exterior, como por ejemplo la humedad o el viento. Estos datos se procesan en el microcontrolador y se producen unos datos de salida que van destinados a dispositivos que los interpretan.

Algunos ejemplos de elementos que generan **datos de entrada** son:
- Sensores de humedad. Generan el mensaje % de humedad.
- Sensores de luminosidad. Generan el mensaje % de luminosidad.

Y algunos ejemplos de elementos que leen los **datos de salida** son:
- Válvulas de riego. Leen el mensaje "abrir" o "cerrar".
- Motores rotativos. Leen el mensaje "arrancar" o "parar".
- Lámparas. Leen el mensaje "encender" o "apagar".

Por lo tanto, un microcontrolador es un pequeño circuito integrado que ejecuta tareas en base a datos. Es un mini cerebro, un **procesador**. Y cómo, cuándo y dónde tiene que ejecutar las tareas se lo decimos nosotros, los programadores. Sí, tú vas a ser un programador, aunque seguro que ya lo eres.

Mira, un ejemplo de tarea en tu calendario del móvil:
- Cuando sean las 8am de la mañana
- Recordarme que tengo que coger la bolsa de deporte de la mesa

Otro ejemplo de **tarea** aplicado al mundo de las plantas sería:

- Si el sensor de humedad envía un mensaje diciendo que la humedad es 20% (dato de entrada).
- Abre la válvula de riego durante 10 minutos (dato de salida).

Por lo tanto, las tareas las guardaremos en la **memoria** de nuestro microcontrolador para que las ejecute cuando sea necesario. No voy a entrar en detalle de los tipos de memoria que tenemos disponibles con Arduino en este post, pero lo veremos más en detalle.

## Mucho más que un simple microcontrolador
Cuando la gente pensamos o buscamos sobre Arduino vemos esto:

![Arduino Uno. Circuito integrado](assets/images/2020-04-06-arduino-para-el-cuidado-de-plantas/arduino-uno.jpg "Arduino Uno. Circuito integrado")

Pero Arduino es más que un simple circuito integrado. Lo que vemos en la imagen es la parte tangible, la parte visible de Arduino, la placa. Sin embargo, **Arduino se trata del software, el hardware, el equipo de desarrollo, la comunidad de usuarios e incluso el espíritu y la filosofía de las personas de alrededor.**

Otro de los motivos por los que Arduino es tan potente es porque **el diseño del hardware de la placa**, lo que hemos visto en la imagen, **es open source**. Esto hace que podamos encontrar placas a muy bajo coste de otros fabricantes, ya que cualquier empresa puede fabricarlo en base a este diseño. Por experiencia, no se comportan tan bien en proyectos con puesta en producción, pero con propósito didáctico o bien para trabajos caseros son más que suficiente.

Por estos motivos decidirse por Arduino es todo un acierto, ya que vamos a tener infinidad de ayuda y documentación. Aun así, también veremos otras alternativas más adelante en el blog.

## ¿A que no sabías esto?
Mira qué curioso: "arduino" es un nombre masculino e italiano que significa "amigo fuerte". El nombre proviene del rey Arduin de Ivrea, que reinó hace miles de años.

## ¿Y cómo podemos aplicar Arduino al mundo de las plantas?
Lo veremos poco a poco en el blog, pero la cantidad de aplicaciones es infinita, prácticamente como tantas ideas tengamos. No olvides que estamos hablando de un pequeño cerebro al que le podemos decir que ejecute tareas de forma programada. 

Por ejemplo, imagina que a tu Hortensia (una planta con grandes requerimientos hídricos) le falta agua. Puedes intentar mantenerla hidratada regándola diariamente, o puedes dejar que tu microcontrolador se encargue de la cantidad de agua que necesita, olvidándote de tener que hacerlo tú mismo. Gracias a él podrías establecer unos criterios de riego que permitiesen mantener con vida tu Hortensia incluso cuando no estuvieses en casa o hiciese mucho calor. ¿Son o no son ventajas a tener en cuenta para aprender a automatizar utilizando Arduino?

Algunas otras tareas en las que podrías aplicar Arduino serían:
- Medir la humedad
- Medir la temperatura del suelo
- Medir la temperatura del aire
- Medir la intensidad viento
- Permitir el bombeo de agua
- Aplicar abono
- ¡Y más!


## ¡Vamos con un ejemplo!
Vamos a construir un pequeño circuito que será la base para poder entender de qué estamos hablando. Lo primero que tendrás que hacer es ir a [Circuito.io](https://www.circuito.io/app) es una app muy intuitiva y que nos permitirá aprender cómo quedaría nuestro diseño sin necesidad de gastar dinero en hardware y ver los resultados. La verdad que es que está muy bien. 

- Inicialmente aparecerá el Arduino Uno la mesa de trabajo
- En el buscador, buscamos "soil" y arrastramos a la mesa de trabajo el "Soil moisture sensor". Nuestro sensor de humedad.
- Y a continuación buscamos "led" y arrastramos.

En este punto ya tenemos nuestro circuito montado. ¿A que ha sido fácil? Guarda esta referencia porque puede que te sea útil a partir de ahora.

## Aunque nunca va a sustituir tus cuidados
A las personas que nos gusta la naturaleza, nos apasiona ir al campo, tocar la tierra y regar nuestras bonitas plantas, podemos sentirnos un poco reticentes a la hora de incorporar la tecnología a estos momentos. Pero la tecnología no viene para quitarnos este trabajo, sino que nos ayuda en los momentos más críticos: unas vacaciones, unos meses muy ajetreados, olas de calor. La tecnología nos permite gestionar mejor el tiempo del cuidado de nuestras plantas y nuestros suelos.

Si a ello le sumas las técnicas tradicionales, descubrirás que puedes conseguir una sensación muy gratificante y especial en el cuidados de tus plantas.
