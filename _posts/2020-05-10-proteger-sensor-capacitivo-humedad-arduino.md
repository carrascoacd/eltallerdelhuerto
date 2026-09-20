---
layout: post
current: post
cover: assets/images/2020-05-10-proteger-sensor-capacitivo-humedad-arduino/capacitor-cover.jpg  
navigation: True
title: "Proteger el sensor capacitivo de humedad"
date: 2020-05-05 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: false
---

Unos sencillos pasos para proteger el sensor de humedad capacitivo de las inclemencias del tiempo.

Normalmente vamos a disponer el sensor de humedad en el campo, por lo que el sol, la lluvia y la humedad van a incidir sobre nuestros sensores. Aunque el sensor de ejemplo no es apropiado para despliegues profesionales, podemos darle un tiempo de vida más largo con estos consejos.

## Los circuitos están desprotegidos
Este sensor tiene los circuitos desprotegidos, por lo que si lo dejamos tal cual lo hemos comprado vamos a poder usarlo durante un tiempo muy limitado hasta que se oxide y las mediciones sean incorrectas.

## Tubo termorretráctil
Vamos a usar un tubo termoretractil de 30mm de ancho para nuestro trabajo. Teniendo en cuenta que nuestro sensor es de unos 25mm de ancho nos va a valer. 

[Este es el tubo que yo estoy usándo]()

No vamos a desoldar ningún componente, simplemente vamos a conservar el conector y a protegerlo. La aproximación que voy a tomar es basándose en los tejados de las casas. La lluvia cae de arriba hacia abajo, por lo que vamos a intentar que, al igual que los tejados, la parte superior esté completamente cubierta.

## Procedimiento
Para ello, vamos a conservar el conector que viene en el extremo que va conectado a nuestro microcontrolador. Sin embargo, el extremo que va conectado al sensor lo vamos a dejar fijo.

Primero eliminamos el conector que no queremos de los cables, el que va conectado al sensor. 
Cortamos las patillas del conector del sensor y desoldamos los restos que queden. Posteriormente soldamos los cables. Es importante que los soldemos mirando hacia abajo para que la parte superior no quede expuesta.

A continuación cortamos un trozo de tubo termoretráctil que cubra desde el estrechamiento del sensor dejando un extra que sobresalga un poco por arriba. En mi caso nos 3mm de largo. Doblamos la parte que hemos dejado sobrante para hacer el efecto tejado que hemos comentado anteriormente

Doblamos el tubo y aplicamos calor con el soldador justo en el doblez. Así uniremos las dos partes formando una especie de caperuza. Posteriormente vamos a aplicar calor en el resto del tubo.

## Conclusión
Una forma sencilla de proteger nuestro sensor con un tubo termorretráctil y que además podemos quitar y poner a nuestro antojo. Ahora bien, si lo que quieres es sensores que presenten una mejor resistencia a la intemperie te recomiendo busques sensores como el SHT10 o de succión como los de Irrometer, que van a darte un mejor rendimiento.