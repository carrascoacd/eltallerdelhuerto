---
layout: post
current: post
cover: assets/images/2020-05-05-modulo-gsm-gprs-sim800-sim800l/cover.jpg
navigation: True
title: "Enviar datos con SIM800L. Experiencias"
date: 2020-05-05 10:00:00
tags: [tecnologia]
class: post-template
subclass: 'post tag-tecnologia'
author: eltallerdelhuerto
comments: true
published: false
---

Si queremos enviar datos de campo para leerlos en remoto, SIM800L es una alternativa que tenemos que valorar allá donde no haya WiFi.

## Propiedades
Nombrar los mensajes de texto como alternativa

## Esquema

## Alimentación de SIM800L
Necesita una batería de 3,7V que sea capaz de sacar hasta 2A en picos, por lo que las baterías LiPo son las ideales. Directamente las conectamos. Hay que tener en cuenta que la longitud de los cables ha de ser la mínima ya que de lo contrario, corremos el riesgo de ejercer demasiada resistencia (describir cómo se mide la resistencia), y por tanto el módulo no funcionará.

No funcionará si:
- Conectas el módulo a Arduino. Además lo quemarás como yo hice con dos.
- Conectas el módulo a una LiPo de 3,7V con jumpers.
- Conectas el módulo a una Litio de 3,7 como una 18650 que no de suficiente descarga.

## Conexión

## Código y mi librería

## Peticiones HTTP

## Peticiones FTP

## Bajo consumo

## Como quemé dos módulos
Los conecté a Arduino y al escribir por canal el RX, el módulo dejó de funcionar. Por lo que no hagáis esto. Lo mejor es hacer uso de un conversor lógico (poner link) o bien hacer un divisor de voltaje como he explicado en el apartado anterior.

## Conclusión
Es un módulo muy potente, pero tiene un contra y es el consumo que necesita cuando está en funcionamiento.
Esto hace que los diseños hayan de contemplar una batería extra a la de nuestro microcontrolador, por lo que son más complejos de mantener.
En otro post hablaremos de cómo cargar las baterías para despreocuparnos cuando las tengamos al aire libre y que sea 100% automático.