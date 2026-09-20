---
layout: post
current: post
cover: assets/images/2022-02-12-mofset-switch/design.png
navigation: True
title: "Notas: MOFSETs como switch"
date: 2022-02-12 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: true
---

En este post persigo guardar las notas que me serán útiles para entender el diseño que he llevado a cabo de un circuito switch con MOFSETs.

## Notas para la creación de un controlador de electroválvula
Este controlador va a alimentarse con una batería de 12V. Yo voy a usar la que acabo de cambiar de mi moto, ya que para este tipo de trabajos vale perfectamente.

Además, tengo una electroválvula de 12V que es la que voy a abrir y cerrar con el controlador. Para ello, voy a usar un circuito basado en MOFSET canal N que trabaja a nivel lógico: IRLZ44N y cualquier MOFSET de canal P, en este caso voy a usar los IRF5210 que los tengo a mano.

La idea es usar el canal N como switch del de canal P, de forma que los 3.3V de Arduino abrirán el circuito que hará que el voltaje en el MOFSET de canal P sea 0V en el Gate, por lo que se mantendrán abiertos (normalmente abiertos).

Sin embargo, cuando el MOFSET de canal N se cierre, con la resistencia pull-up del canal P, tendremos el MOFSET cerrado, es decir, con un voltaje de unos 12V en su Gate.

## Resistencia pull-down

Considero que el LOW máximo es 0.3v
Vin=3.3V
VR5=3.3V - 0.3V = 3V
Intensidad max Arduino = 20mA, pero limito a 10nA por seguridad
Dada la ley de Ohm, V=I*R, R5=3/10*10^-6 = 30000Ω = 30kΩ. Voy a usar una de 10k que es más común y tendremos el mismo orden de intensidad en nano-amperios.

## Resistencia para proteger Arduino
Aplico la misma lógica para R3, dado que no quiero que la corriente de carga inicial del MOFSET supere 10mA. Para ello voy a usar una resistencia de 270Ω.

## Resistencia pull-up
Cuando el IRLZ44N está ON, R4 está directamente conectada a GND, es como un circuito cerrado.

Vamos a poner una intensidad mucho más baja para evitar una gran caída de voltaje con resistencias del orden de cientos de amperios. Por ejemplo 10nA

Como las resistencias en los Gate de los MOFSET son casi infinitas, el circuito actúa como si estuviera cerrado, luego no hay corriente entre R4 y el Gate.

Considero que el HIGH mínimo es 11.9
Vin=12V
VR5=12V - 11.9V = 0.1V
Dada la ley de Ohm, V=I*R, R4=0.1/10*10^-6 = 10000Ω = 10kΩ

## Diseño
En el diseño he usado como ejemplo un Arduino de 5V y un MOFSET IRFZ44N, pero aplica igual para el que he usado realmente, solo que cambiamos el voltaje por el de un Arduino de 3.3V.

La fuente de alimentación de 5V representa la salida digital de Arduino.

![Diseño con CicuitLab del circuito](assets/images/2022-02-12-mofset-switch/design.png "Diseño con CircuitLab del circuito")
