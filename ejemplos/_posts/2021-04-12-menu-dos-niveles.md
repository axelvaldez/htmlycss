---
layout: post
excerpt_separator: <!-- more -->
title: "Menú de dos niveles sólo con CSS"
tldr: "Un menú de dos niveles sin usar JavaScript, y con sólo unas cuantas líneas de CSS."
tags: html css
---

Cuando necesitamos hacer un menú de dos niveles, es muy común recurrir a alguna librería de JavaScript que haga la mayor parte del trabajo pesado por nosotros, sin embargo hacerlo solo con CSS no solo es mucho más simple, sino que de paso elimina casi todos los puntos potenciales de falla.

## El HTML

Empezamos con una lista no ordenada (```UL```) para el primer nivel, y otra lista no ordenada dentro de cada LI que va a tener un sub-menu.

{% codeblock %}
<ul class="menu">
  <li>
    <a href="#">Homepage</a>
  </li>
  <li>
    <span>Categorías</span>
    <ul>
      <li><a href="#">Artículos</a></li>
      <li><a href="#">Notas</a></li>
      <li><a href="#">Páginas</a></li>
    </ul>
  </li>
  <li>
    <span>Archivo</span>
    <ul>
      <li><a href="#">Meses</a></li>
      <li><a href="#">Años</a></li>
      <li><a href="#">Archivo completo</a></li>
    </ul>
  </li>
  <li>
    <a href="#">Contacto</a>
  </li>
</ul>
---
{% endcodeblock %}
Los títulos en los elementos que tienen un menú secundario no son links (```a```), sino ```span```, porque el click no es necesario en estos elementos.

Nota: Este es el unico HTML que tendremos durante el resto del ejemplo, asi que en los siguientes bloques sólo pondré el el CSS y el resultado.

## Primer nivel

Para crear el menú de primer nivel, ocultamos los ul internos y volvemos ```.menu``` un elemento Flex con los items al centro. Si necesitas saber qué rollo con esto [acá hay una introducción a Flexbox](/notas/2021/flex-ejes/).

También le quitamos el estilo de lista a ```.menu``` y ```.menu ul``` con ```list-style: none```.

{% codeblocknohtml %}
<ul class="menu">
  <li>
    <a href="#">Homepage</a>
  </li>
  <li>
    <span>Categorías</span>
    <ul>
      <li><a href="#">Artículos</a></li>
      <li><a href="#">Notas</a></li>
      <li><a href="#">Páginas</a></li>
    </ul>
  </li>
  <li>
    <span>Archivo</span>
    <ul>
      <li><a href="#">Meses</a></li>
      <li><a href="#">Años</a></li>
      <li><a href="#">Archivo completo</a></li>
    </ul>
  </li>
  <li>
    <a href="#">Contacto</a>
  </li>
</ul>
---
& .menu{
  display: flex;
  justify-content: center;
  list-style: none;
}

& .menu ul{
  display: none;
  list-style: none;
}
{% endcodeblocknohtml %}

### Ajuste de estilo

Normalizamos la apariencia de los links y los spans, y les agregamos padding a los lados:

{% codeblocknohtml %}
<ul class="menu">
  <li>
    <a href="#">Homepage</a>
  </li>
  <li>
    <span>Categorías</span>
    <ul>
      <li><a href="#">Artículos</a></li>
      <li><a href="#">Notas</a></li>
      <li><a href="#">Páginas</a></li>
    </ul>
  </li>
  <li>
    <span>Archivo</span>
    <ul>
      <li><a href="#">Meses</a></li>
      <li><a href="#">Años</a></li>
      <li><a href="#">Archivo completo</a></li>
    </ul>
  </li>
  <li>
    <a href="#">Contacto</a>
  </li>
</ul>
---
& .menu{
  display: flex;
  justify-content: center;
  list-style: none;
}

& .menu ul{
  display: none;
  list-style: none;
}

& >>.menu a,
& >>.menu span{
  >>text-decoration: none;
  >>padding: 0 .5rem;
>>}
{% endcodeblocknohtml %}

## Segundo nivel

Ahora hacemos que el menú de segundo nivel (```.menu ul```) aparezca con ```display: block``` cuando el cursor esté sobre su contenedor (```li```) y lo positionamos de manera absoluta al 100% de distancia del border superior y a 0% de distancia del borde izquierdo de su contenedor.

Para lograr este posicionamiento le damos posicionamiento relativo al elemento contenedor ```li```.

{% codeblocknohtml %}
<ul class="menu">
  <li>
    <a href="#">Homepage</a>
  </li>
  <li>
    <span>Categorías</span>
    <ul>
      <li><a href="#">Artículos</a></li>
      <li><a href="#">Notas</a></li>
      <li><a href="#">Páginas</a></li>
    </ul>
  </li>
  <li>
    <span>Archivo</span>
    <ul>
      <li><a href="#">Meses</a></li>
      <li><a href="#">Años</a></li>
      <li><a href="#">Archivo completo</a></li>
    </ul>
  </li>
  <li>
    <a href="#">Contacto</a>
  </li>
</ul>
<spacer/>
---
& .menu{
  display: flex;
  justify-content: center;
  list-style: none;
}

& .menu ul{
  display: none;
  list-style: none;
  >>position: absolute;
  >>top: 100%;
  >>left: 0%;
}

& >>.menu li:hover ul{
  >>display: block;
>>}

& >>.menu li{
  >>position: relative
>>}

& .menu a,
& .menu span{
  text-decoration: none;
  padding: 0 .5rem;
}
{% endcodeblocknohtml %}

### Segundo nivel: estilo visual

Normalizamos el padding del menu de segundo nivel, y le agregamos un color de fondo y una sombra para separarlo del resto. También le damos un ancho mínimo.

{% codeblocknohtml %}
<ul class="menu">
  <li>
    <a href="#">Homepage</a>
  </li>
  <li>
    <span>Categorías</span>
    <ul>
      <li><a href="#">Artículos</a></li>
      <li><a href="#">Notas</a></li>
      <li><a href="#">Páginas</a></li>
    </ul>
  </li>
  <li>
    <span>Archivo</span>
    <ul>
      <li><a href="#">Meses</a></li>
      <li><a href="#">Años</a></li>
      <li><a href="#">Archivo completo</a></li>
    </ul>
  </li>
  <li>
    <a href="#">Contacto</a>
  </li>
</ul>
<spacer/>
---
& .menu{
  display: flex;
  justify-content: center;
  list-style: none;
}

& .menu ul{
  display: none;
  list-style: none;
  position: absolute;
  top: 100%;
  left: 0%;
  >>padding: 1rem;
  >>background: white;
  >>box-shadow: 0 2px 16px rgba(0,0,0,.25);
  >>min-width: 12rem;
}

& .menu li:hover ul{
  display: block;
}

& .menu li{
  position: relative
}

& .menu a,
& .menu span{
  text-decoration: none;
  padding: 0 .5rem;
}
{% endcodeblocknohtml %}

Y listo, con este código base ya puedes dar rienda suelta a tu creatividad y enfocarte en el estilo visual de tu menú sin necesidad de estar lidiando con librerías o funciones en JavaScript.

<hr class="separator">

Nota: este es un menú muy básico, y no toma en cuenta el funcionamiento en dispositivos sin cursor (como un teléfono o una tablet). Más adelante retomaré en un ejemplo lo necesario para que sí funcione en esos dispositivos y actualizaré este párrafo con un link a ese ejemplo.

<style>
ul.menu > li > a,
ul.menu > li > span{
  color: var(--txt);
}

ul.menu ul > li a,
ul.menu ul > li > span{
  color: var(--txt);
}

@media (prefers-color-scheme: dark){
  ul.menu ul > li a,
  ul.menu ul > li > span{
    color: var(--bg1);
  }
}

</style>