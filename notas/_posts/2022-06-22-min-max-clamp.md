---
layout: post
excerpt_separator: <!-- more -->
title: "Min(), Max() y Clamp()"
tldr: "Tres funciones útiles para el diseño responsivo moderno"
tags: css
---

Una técnica que llegó con el diseño responsivo y la imposibilidad de saber el tamaño del viewport en el que se mostrarían nuestros sitios fue el agregar a todo elemento con un ancho (```width```) definido, un mínimo o máximo (```min-width```, ```max-width```) para que no se saliera de control.

Las funciones **min()**, **max()** y **clamp()** son un trío de soluciones más concisas a este tema en particular. Estas se pueden usar en cualquier propiedad que requiera un valor numérico.

## min(a,b)

Min() recibe como parametros dos números y devuelve el menor de ellos. Es decir, en el siguiente ejemplo la propiedad ```width``` del elemento ```.texto``` utilizará el valor menor entre el 50% del ancho del viewport (```50vw```) o 20 veces el tamaño de fuente definido en el elemento root (```20rem```).

{% codeblock %}
<div class="texto">
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente odio blanditiis perferendis tempora illo repellat at iste saepe dicta consectetur.</p>
</div>
---
& .texto{
    width: min(50vw, 20rem);
}
{% endcodeblock %}

Min() es especialmente útil en diseño responsivo al definir tamaños de elementos en porcentajes, sin permitir que se reduzcan más de lo conveniente y afecten la legibilidad o rompan el layout de la página.

## max(a,b)

Max() funciona de manera muy similar a min(), pero como su nombre lo sugiere, este devuelve el menor de los valores que le pasamos como parámetros. Es decir, en el siguiente ejemplo la propiedad ```width``` del elemento ```.texto``` será el mayor entre los valores ```35vw``` y ```20rem```.

{% codeblock %}
<div class="texto">
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente odio blanditiis perferendis tempora illo repellat at iste saepe dicta consectetur.</p>
</div>
---
& .texto{
    width: max(35vw, 20rem);
}
{% endcodeblock %}

Max() se puede utilizar para definir elementos que tomen todo el ancho disponible en su elemento contenedor, pero limitando su tamaño máximo.

## clamp(min,preferred,max)

Clamp es, en mi opinión, la funcion más útil de las tres. Recibe como parametros tres valores: el límite inferior (mínimo), el valor preferido, y el límite superior (máximo).

En palabras simples, clamp() nos permite utilizar un valor con unidades variables (porcentaje, vw, vh, etc.) de manera controlada, donde el valor siempre se mantiene entre los límites inferior y superior.

Esto se ejemplifica muy bien con la propiedad ```font-size```. En el siguiente bloque de código, el elemento ```.texto``` tiene un tamaño de fuente definido en ```2vw``` (2% del ancho total del viewport), sin embargo al reducir el ancho del viewport solo permitimos que el tamaño de fuente se reduzca hasta ```16px```, y viceversa, al agrandar el viewport la fuente no puede crecer más allá de ```24px```.

{% codeblock %}
<div class="texto">
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente odio blanditiis perferendis tempora illo repellat at iste saepe dicta consectetur.</p>
</div>
---
& .texto{
    font-size: clamp(16px, 2vw, 24px);
}
{% endcodeblock %}

Para mí lo más importante de estas funciones es la reducción que representan en el código, no solo por evitarnos utilizar varias propiedades para el mismo objetivo, sino porque nos permiten codificar comportamientos responsivos directamente en los elementos, sin necesidad de escribir variaciones de los mismos en media queries.

<style>
    .texto{
        width: 80%;
        margin: 5vh auto;
    }

</style>