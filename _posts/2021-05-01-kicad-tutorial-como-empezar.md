---
layout: post
current: post
cover: assets/images/2021-05-01-kicad-tutorial-como-empezar/cover.jpg
navigation: True
title: "KiCAD"
date: 2021-05-01 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: true
---

KiCAD, que se pronuncia "Key CAD) es una herramienta open source que te permite diseñar circuitos. Me la ha recomendado un compañero del trabajo y voy a probarla.

Yo lo que voy a hacer es diseñar una PCB para un Arduino Nano, de forma que luego pueda soldarla.

Normalmente he usado las típicas PCB que ya vienen perforadas y simplemente pues usas los agujeros que quieres, como por ejemplo estas ![PCB perforadas](assets/images/2021-05-01-kicad-tutorial-como-empezar/pcb.jpg "PCB perforadas")

Lo bueno que tiene el diseñarlo es que luego lo mandaré a imprimir y recibiré exactamente el diseño que he hecho.

## Instalación
KiCAD pesa bastante, lo puedes descargar de la su [propia web](https://www.kicad.org/download/) y está disponible para todos los SO más usados.

Yo voy a trabajar con la versión 5.1.9 para OX.

## Creando el proyecto
Voy a seguir [este tutorial](https://forum.kicad.info/t/tutorial-introduction-to-pcb-design-with-kicad-version-5-1-getting-started/20600/2), que parece bastante completo.

Le doy a `File > New Project` y lo guardo con un nombre, en este caso *weather_station*.

Me genera dos ficheros, uno `.pcb`y otro `. sch`. Supongo que el PCB será para imprimir, ahora lo veré.

Siguiendo el tutorial, voy a abrir el fichero `sch` que contiene el esquema del circuito.

## Crear el diseño de un led.
Para empezar voy a probar con un led simplemente.

Le doy a `Place Symbol` en el menú de la derecha, y busco `led`. 

Ahora selecciono el primero, `LED`, sinceramente hay muchos más pero no tengo ni idea, así que vamos con el primero.

A esto que acabamos de seleccionar lo llaman footprint.

<blockquote>
  <p>El footprint es lo que define la interfaz de comunicación con cada elemento, es decir, donde vendrán los zócalos para soldar entre otras cosas.</p>
</blockquote>

Cuando ya aparece el footprint del LED en el esquema, el tutorial dice que hay unos círculos en al lado de cada número que me permitirán hacer conexiones y que puedo unir.

A continuación, justo debajo del botón de `Place Symbol`está el botón para añadir alimentación, por lo que voy a añadir una toma de tierra GND y una fuente de 5V. Ahora simplemente los conecto (bien, voy a buscar en Google cómo, porque no sé qué pare es la positiva y la negativa en el símbolo).

<blockquote>
  <p>
Repasando que es un LED, el ánodo es la parte positiva (suele ser la pata más larga del LED) y el cátodo es la negativa. Voy a imaginarme un gato (cato) enfadado, y ya está, memorizado para siempre: el gato enfadado es negativo.

Las flechas parece como que indican el sentido de la corriente, por lo que es sencillo conectarlo. La punta de la flecha es el cátodo.
</p>
</blockquote>

Voy a conectar, ahora sí, el LED. Para ello voy selecciono el icono de la línea verde de la derecha que dice `Place wire`.

Voy a parar por ahora!
