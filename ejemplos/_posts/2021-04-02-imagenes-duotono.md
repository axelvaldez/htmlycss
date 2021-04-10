---
layout: post
excerpt_separator: <!-- more -->
title: "Imágenes monotono y duotono con CSS"
tldr: "Aplicando efectos de color a tus imágenes sólo con CSS, sin tocar Photoshop"
tags: css color
---

Es común utilizar imágenes estilizadas de acuerdo al tema visual de nuestros sitios web. El camino usual es editarlas en Photoshop o algúna aplicación similar, exportarlas como jpg o png e insertarlas en el HTML.

Una desventaja de seguir este proceso tradicional es que si después queremos cambiar la imagen, sea por que los colores del sitio han cambiado o por cualquier otra razón, tenemos que volver a hacer todo el proceso de nuevo.

En este ejemplo vamos a ver una alternativa que es especialmente útil para crear imágenes monotono y duotono utilizando solo CSS.

### ¿Qué es Monotono y Duotono?

Las imágenes monotono son similares a imágenes en escala de grises, pero los tonos de la "tinta" negra se cambian por otro color.

En las imágenes duotono también se cambia el color blanco de la imagen, resultando en una imagen que varía entre dos colores en lugar de variar de negro a blanco como en una imagen en escala de grises.

![Ejemplo de imagenes regular, monotono y duotono](/assets/img/posts/monotone-duotone-example.png)

En la imagen anterior podemos ver la imagen original a la izquierda, la imagen en monotono al centro, y la imagen en duotono a la derecha.

## Creando el efecto

Empecemos por el efecto duotono. Primero insertamos la imagen en el HTML y la envolvemos en un contenedor con la clase ```.duotono```.

### 1. La imagen

{% codeblock %}
<div class="duotono">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
{% endcodeblock %}

### 2. Aplicar escala de grises

Esto descarta toda la información de color de la imagen original, pues solo necesitamos la información de blanco y negro.

{% codeblock %}
<div class="duotono">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .duotono img{
    filter: saturate(0);
}
{% endcodeblock %}

### 3. Pseudoelementos ::before y ::after

Creamos ambos pseudoelementos **en el contenedor**, y los posicionamos encima de la imagen utilizando posicionamiento absoluto y ```z-index```. Para esto tenemos que hacer que el contenedor tenga posicionamiento relativo.

{% codeblock %}
<div class="duotono">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .duotono{
    position: relative;
}

& .duotono::before,
& .duotono::after{
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
}

& .duotono img{
    filter: saturate(0);
}
{% endcodeblock %}

Nota que en este momento, aunque los pseudoelementos están encima de la imagen, no son visibles porque no tienen ningún contenido ni color de fondo.

### 4. Agregar color

Para colorear la imagen necesitamos dos colores. Yo seleccioné #FF005C para los tonos oscuros y #FFE600 para los tonos claros.

Agregamos el fondo claro al pseudoelemento ::before y el fondo oscuro al pseudoelemento ::after.

{% codeblock %}
<div class="duotono">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .duotono{
    position: relative;
}

& .duotono::before,
& .duotono::after{
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
}

& .duotono::before{
    background: #FFE600;
}

& .duotono::after{
    background: #FF005C;
}

& .duotono img{
    filter: saturate(0);
}
{% endcodeblock %}

Como puedes ver, ahora la imagen está totalmente cubierta por los pseudoelementos, que son opacos. Ya solo queda un paso:

### 5 Aplicar blend modes

Aplicamos ```mix-blend-mode``` a los pseudoelementos. Los valores son ```darken``` para el color claro y ```lighten``` para el color oscuro. Suena como que está al revés, pero no es así :)

{% codeblock %}
<div class="duotono">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .duotono{
    position: relative;
}

& .duotono::before,
& .duotono::after{
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
}

& .duotono::before{
    background: #FFE600;
    mix-blend-mode: darken;
}

& .duotono::after{
    background: #FF005C;
    mix-blend-mode: lighten;
}

& .duotono img{
    filter: saturate(0);
}
{% endcodeblock %}

¡Y listo! Ya tenemos nuestra imagen duotono terminada.

## Imagen Monotono

Una vez hecho todo lo anterior, aplicar monotono a una imagen es super simple: solo omite el pseudoelemento ::before, todo lo demás queda igual.

{% codeblock %}
<div class="monotono">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .monotono{
    position: relative;
}

& .monotono::after{
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
    background: #FF005C;
    mix-blend-mode: lighten;
}

& .monotono img{
    filter: saturate(0);
}
{% endcodeblock %}

## Variaciones

Puedes utilizar esta técnica con gradients. Aunque las imágenes no serán técnicamente monotonos o duotonos, el resultado es super bueno:

{% codeblock %}
<div class="grad">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .grad{
    position: relative;
}

& .grad::after{
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
    background: linear-gradient(45deg, #4158D0, #C850C0, #FF005C);
    mix-blend-mode: lighten;
}

& .grad img{
    filter: saturate(0);
}
{% endcodeblock %}

## Un detalle final

Al aplicar este efecto, tus usuarios no pueden interactuar con la imagen, pues los pseudoelementos están encima de ella. Para solucionar esto solamente agrega ```pointer-events: none``` a tus pseudoelementos:

{% codeblock %}
<div class="grad">
    <img src="/assets/img/posts/cyberpunk.jpg">
</div>
---
& .grad{
    position: relative;
}

& .grad::after{
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
    background: linear-gradient(45deg, #4158D0, #C850C0, #FF005C);
    mix-blend-mode: lighten;
    pointer-events: none;
}

& .grad img{
    filter: saturate(0);
}
{% endcodeblock %}

Y listo, ahora la imagen puede ser arrastrada y acepta click secundario sin problemas.

<hr class="separator">

Y eso es todo. Puedes experimentar con otros *blend modes* y lograr muchos efectos distintos sin siquiera tocar photoshop.