---
layout: post
current: post
cover: assets/images/2020-06-04-programar-arduino-para-plantas/cover.jpg
navigation: True
title: "Programar cuidados en C: cómo empezar"
date: 2020-06-04 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: true
---

C es el lenguaje de programación que usamos en Arduino para programar las tareas de cuidado que necesitan nuestras plantas.

**Un lenguaje de programación se trata de un lenguaje pensado para instruir a un ordenador a ejecutar tareas**, como he comentado. Como cualquier lenguaje tiene una serie de reglas gramaticales y vocabulario.

## C va a ser nuestro nuevo lenguaje
Hay ingente documentación sobre este lenguaje, nuestros sistemas operativos se basan en este lenguaje, sistemas a tiempo real e infinidad de aplicaciones que usamos diariamente. En este post no voy a entrar en detalle sobre él, pero si vamos a ver sus aplicaciones a la hora de programar en Arduino.

Antes de ello, tenemos que familiarizarnos estos conceptos:
- **Sentencia**, una sentencia es una frase que contiene una acción. Por ejemplo

{% highlight C++ linenos %}
  mover los pies
{% endhighlight %}

- **Función**. Es un conjunto de acciones que vamos a programar y a la que le daremos un nombre. Por ejemplo:

{% highlight C++ linenos %}
void andar(){
  mover los pies
}
{% endhighlight %}

- **Programa**, en Arduino suele llamarse Sketch, para simplificar se trata de un conjunto de funciones que se van a ejecutar.
Por ejemplo

{% highlight C++ linenos %}
void andar(){
  mover los pies
}

void setup(){
  andar()
}

void loop(){
}

{% endhighlight %}

En el programa anterior tenemos tres funciones, una creada por nosotros: *andar* y las otras dos son funciones, y que son las que nuestro Sketch va a usar siempre.

## Setup y Loop
Los programas en Arduino son bucles, es decir, ejecutan lo mismo de forma infinita mientras estén encendidos. 

En cada Sketch vamos a ver dos funciones:
- setup. Esta función se ejecuta antes del bucle y se ejecuta solo una vez cuando encendemos Arduino, como su nombre indica, sirve para configurar parámetros iniciales, como por ejemplo un sensor para poder trabajar con él.

- loop. Como su nombre indica, este es el bucle. Se ejecutará de forma infinita y aquí es donde irá normalmente el código de medición de sensores, etc. 

## A la práctica: el IDE
Vale, antes de ello voy a explicar que es un IDE. Un IDE son las siglas de Entorno de Desarrollo Integrado (Integrated Development Environment). Y consiste en una aplicación que nos va a permitir escribir nuestro programa.

Actualmente contamos con dos opciones, la opción Web y la opción nativa, la que descargamos a nuestro ordenador. Para este ejemplo, vamos a comenzar con la opción web. Por lo que iremos al IDE online de Arduino: [Arduino Create](https://create.arduino.cc), nos registramos y seleccionamos 

![Arduino Create. Web Editor](assets/images/2020-06-04-programar-arduino-para-plantas/arduino-create.png "Arduino Create. Web editor")

¡Y tachan! tenemos nuestro primer Sketch con las funciones que he comentado anteriormente. Vamos a parar por un momento para asimilar todo lo que hemos visto.

## Siguientes pasos
Hemos visto dónde escribir un Sketch de Arduino y qué significa. Ahora necesitas un Arduino :) ¿Por qué? porque para poder seguir y ver los resultados de forma real es lo más recomendable.

El primero que compré yo para jugar y experimentar fue [este similar Arduino UNO](http://rover.ebay.com/rover/1/1185-53479-19255-0/1?ff3=4&pub=5575581389&toolid=10001&campid=5338673600&customid=&mpre=https%3A%2F%2Fwww.ebay.es%2Fitm%2FUNO-R3-Rev3-ATmega328-16U2-Arduino-100-Compatible-cable-USB-ULTIMA-VERSION-B009%2F201530741428%3Fhash%3Ditem2eec2b12b4%3Ag%3AKKAAAOSwFdtXxD45){:target="_blank"} 

No es el original, pero funciona perfectamente ya que es 100% compatible. [Recordemos que Arduino es hardware open source](arduino-para-el-cuidado-de-plantas), por lo que cualquiera puede crear sus propias placas.

Más adelante veremos que hay otras placas más pequeñas o más potentes, pero por el momento esta nos va a dar mucho juego.

## Programando el parpadeo de un LED
En este punto vamos a ver lo sencillo que es programar un parpadeo de un LED. Para empezar necesitamos los siguientes componentes:
- Un LED
- Una resistencia
- Un Arduino
- Una placa de prueba
- Cables

La resistencia va a ser necesaria porque de lo contrario corremos el riesgo de quemar nuestro led, puesto que la corriente que circula por él puede ser muy grande al no haber resistencia. Añadiendo una resistencia evitamos eso.

El código lo tenemos como uno de los ejemplos en Arduino Web Editor o Arduino IDE. Vamos a Examples -> Basics -> Blink y nos apaecerá el siguiente código:

{% highlight C++ linenos %}
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}
{% endhighlight %}

Te sugiero que leas los comentarios del código para entender qué sucede.

En este punto tenemos que subir el código a nuestro Arduino, para que lo ejecute. Le damos a Sketch -> Upload

Tras subirse deberíamos de ver el parpadeo del led cada segundo.

## Conclusión
Esta ha sido una introducción básica donde hemos visto cómo interactuar con elementos externos, en este caso un LED. Esto nos permitirá entender cómo se comunican los sensores con nuestro Arduino en un próximo post.

Además hemos visto cómo se ejecuta el código en Arduino, desde su programación hasta su posterior subida y ejecución.
