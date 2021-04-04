---
layout: post
excerpt_separator: <!-- more -->
title: "Box sizing explicado en dos minutos"
tldr: "Diferencias entre border-box y content-box"
tags: css
---

La propiedad ```box-sizing``` en CSS define cómo se calcula el ancho y alto total de un elemento. Sus valores posibles son ```content box``` y ```border box```, siendo el primero el *default*.

Empecemos por entender qué significa cada uno de estos valores. Imaginemos un elemento con *border* y *padding* aplicados:

![Ilustración que muestra la caja del contenido y la caja del borde en un elemento](/assets/img/posts/box-sizing-example.png)

Como podemos ver, **content box** se refiere al área que ocupa el contenido del elemento, y **border box** se refiere al tamaño completo del elemento, incluyendo su padding y borde.

Cuando definimos la propiedad ```box-sizing```, le decimos al browser a cuál de estas cajas debe aplicar las propiedades ```width``` y ```height``` de nuestra regla de estilo.

Si tenemos un elemento con ```width``` de 500px y ```padding``` de 50px, con ```box-sizing: content-box``` este tendrá 600px de ancho (500px + 50px + 50px), mientras que con ```border-box``` su ancho será de 500px **incluyendo** su padding.

![Comparativa entre brder-box y content-box](/assets/img/posts/box-sizing-example-2.png)

No hay una propiedad más correcta que otra, sin embargo ```box-sizing: border-box``` es la preferida por la mayoría de los que desarrollamos sitios y aplicaciones web porque el tamaño que definamos en la propiedad width será el tamaño total del elemento, y no tenemos que estar descontando los tamaños de padding y el border a la hora de escribir nuestro CSS.
