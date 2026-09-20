---
layout: post
current: post
cover: assets/images/2020-05-01-tarjeta-sd-en-arduino/cover.jpg
navigation: True
title: "Tarjeta SD en Arduino"
date: 2020-02-04 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: false
---

Cómo una tarjeta SD se puede convertir en un problema en cuanto a consumo de recursos se refiere

Una tarjeta SD nos permite almacenar de forma permanentemente datos.

## Problema
Una tarjeta SD está diseñada para manejar cantidades "grandes" de datos. 
Se escriben en bloques de 512bytes, por lo que cuando hablamos de incorporarla a un micro controlador tenemos el primer problema, memoria SRAM.

Además, cuanto más capacidad tienen (comprobar esto) más corriente van a consumir, ya que la paginación va a ser más costosa y por ello tenemos el segundo problema, el consumo.

## Cuidado con las baratas
Las placas baratas que implementan en hardware para acceder a una tarjeta SD normalmente ocupan todo el bus SPI (comprobar esto), por lo que si queremos conectar otro dispositivo en el mismo BUS, no vamos a poder. Por ello en este caso, si vamos a tener más de un dispositivo, vamos a tener que invertir un poco más en una de calidad.

## Alternativas
Enviar los datos a la nube
Otras placas más potentes

## Solución final
En mi solución al final descarté el uso de una tarjeta SD, mejorando la cantidad de bytes que enviaba al subir imagenes a través de FTP usando mi [librería](https://github.com/carrascoacd/ArduinoSIM800L) con SIM800L.

Con ello pude incrementar el tamaño de cada FTPPUT a 512 desde 64 bytes en un Arduino Nano, por lo que el envío fue un 800% más rápido y, por lo tanto, menos propenso a errores, puesto que se realizaban muchas menos.