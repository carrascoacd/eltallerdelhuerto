---
layout: post
current: post
cover: assets/images/2020-05-04-cambio-arduino-nano-8mhz-software/cover.jpg
navigation: True
title: "Cambio de frecuencia de Arduino Nano desde 18Mhz a 8Mhz por software"
date: 2020-05-04 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: true
---

Vamos a ver cómo modificar la frecuencia de reloj de la CPU de nuestro Arduino a través del software.

Cuando hablamos de uso de sistemas IoT en el campo, la batería es algo muy importante ya que no siempre vamos a poder cargarla, es por ello que es crucial prestar atención a este punto. Si queremos optimizar nuestra batería para poder usar nuestra estación de control basada en Arduino de forma que no tengamos que preocuparnos, puedes seguir leyendo.

## Problema
Cuando queremos alimentar nuestro Arduino y tenemos uno que funciona a 5v, hemos de elegir batería y no hay muchas opciones que nos permitan usar una única batería sin step-up para llegar a 5v. Usar una batería tiene la ventaja de que si usamos un cargador solar, el diseño es mucho más simple, más reducido, en general son todo ventajas cuando hablamos del campo.

## Solución
La solución, o una de las soluciones es usar una batería a 3.7v y disminuir la frecuencia de la CPU de Arduino. Aunque con un Arduino a 5v podemos funcionar en la práctica con una batería de 3.7v, podemos tener problemas al estar un poco al límite de la especificación.

Arduino monta normalmente un microcontrolador ATMega356 y para hacer el campo podemos de dos maneras, a través de hardware cambiando el oscilador externo por uno con menos frecuenca o bien mediante software como vamos a ver a continuación. 

Para cambiar la frecuencia operativa de nuestro Arduino a través de software hemos de cambiar el factor de división del CLKPR, el registro de escalado del reloj. Inicialmente este registro contendrá el valor 0, lo que nos dará una frecuencia de 16Mhz. Podemos verlo en la siguiente tabla:

<table>
<tbody>
<tr>
<th>Valor CLKPR</th>
<th>Factor de división</th>
<th>Frecuencia</th>
<th>Parámetro de clock_prescale_set()</th>
</tr>

<tr>
<td>0</td>
<td>1</td>
<td>16000000</td>
<td>clock_div_1</td>
</tr>

<tr>
<td>1</td>
<td>2</td>
<td>8000000</td>
<td>clock_div_2</td>
</tr>

<tr>
<td>2</td>
<td>4</td>
<td>4000000</td>
<td>clock_div_4</td>
</tr>

<tr>
<td>3</td>
<td>8</td>
<td>2000000</td>
<td>clock_div_8</td>
</tr>

<tr>
<td>4</td>
<td>16</td>
<td>1000000</td>
<td>clock_div_16</td>
</tr>

<tr>
<td>5</td>
<td>32</td>
<td>500000</td>
<td>clock_div_32</td>
</tr>

<tr>
<td>6</td>
<td>64</td>
<td>250000</td>
<td>clock_div_64</td>

</tr>

<tr>
<td>7</td>
<td>128</td>
<td>125000</td>
<td>clock_div_128</td>

</tr>
<tr>
<td>8</td>
<td>256</td>
<td>62500</td>
<td>clock_div_256</td>
</tr>

</tbody>
</table>

## Actualizar el valor de la CPU a 8Mhz
Si tomamos los valores de la tabla anterior para que nuestro Arduino trabaje a 8Mhz, tendremos que el valor del factor de división del CLKPR será 1. Para actualizar este registro hemos de escribir primero todos los valores a 0 menos el primer bit que recibe el nombre de CLKPCE que hemos de escribir a 1, indicando que empezamos la secuencia.

Vamos a usar el operador de desplazamiento izquierdo de bytes de C *<<*, que moverá un bit a la izquierda todos los bites que tenemos en el registro. Por ejemplo:

{% highlight C++ linenos %}
5 is (00000101)
five=5
{% endhighlight %}

{% highlight C++ linenos %}
10 is (00001010)
ten = five<<1
{% endhighlight %}

Partiendo de la base de que el registro CLKPR contiene todo 0 inicialmente, lo que hacemos es añadir un 1 a la derecha (recordemos que en binario leemos de derecha a izquierda).

El código nos quedará del siguiente modo:

{% highlight C++ linenos %}
void setup() {
  Serial.begin(9600);
  Serial.println("Changing CPU speed to 8Mhz");

  noInterrupts(); // deshabilitamos las interrupciones
  CLKPR = 1<<CLKPCE; // empezamos la secuencia de escritura
  CLKPR = 1; // seleccionamos el divisor desado, en nuestro caso el 1
  interrupts(); // habilitamos las interrupciones
}

void loop() {
  // Este código se ejecutará a 8Mhz
  Serial.println("Working!");
  delay(1000);
}
{% endhighlight %}

## Problemas
Puede suceder que tu puerto de serie no funcione inicialmente y no veamos en el monitor los *print* que hemos puesto, sino un montón de caracteres, si esto te sucede puedes cambiar el baudrate a justo el anterior (la mitad), en nuestro ejemplo si tenemos 9600, pues 4800.

Esto sucede porque la configuración de nuestro IDE dice que Arduino Uno ha de trabajar a 18Mhz, pero le estamos forzando a trabajar a menos velocidad, por lo que hay que hacer este apaño. 

También hay opción de cambiar la configuración de la placa y decirle que Arduino Uno trabaja a 8Mhz, para no tener que hacer estos trucos, para ello procedemos del siguiente modo.
Hay que localizar el fichero *boards.txt*, lo más sencillo es hacer el el terminal un *find / -name boards.txt* y suele estar en el path *hardware/arduino/avr/boards.txt*

Localizamos la configuración de nuestro Arduino y cambiamos el valor, en mi caso es Arduino Nano:
{% highlight C %}
nano.build.f_cpu=16000000L
{% endhighlight %}

por el siguiente

{% highlight C %}
nano.build.f_cpu=8000000L
{% endhighlight %}

Reiniciamos nuestro IDE para que cargue la configuración, y ya lo tenemos.

## Conclusiones
Hay que tener en cuenta que los dispositivos conectados a Arduino pueden ver afectada su comunicación al trabajar a estas frecuencias. Simplemente hay que verificar que son compatibles, aunque la mayoría suelen serlo. Lo mismo ocurre con el voltaje, ya que no vamos a trabajar a 5v.

Sin embargo, esto no va a afectar al puerto de serie que tenemos conectado a nuestro ordenador (si es que programamos con el IDE) con el cual programamos, ya que seguirá funcionando perfectamente y podemos comunicarnos a baud rates normales como siempre.

**Con este pequeño cambio podemos reducir el consumo de nuestra batería de forma considerable y nos da pie a usar baterías de 3.7v.**