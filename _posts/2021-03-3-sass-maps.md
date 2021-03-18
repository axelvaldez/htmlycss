---
layout: post
excerpt_separator: <!-- more -->
title: "Sass Maps para variables de color"
tldr: "Definiendo variables de color y clases de HTML al mismo tiempo utilizando Sass"
---

Hace algunos años empecé a usar SASS. Lo primero que me convenció fueron las variables. En una época en la que las variables o *custom properties* de CSS aún no existían, esto representaba una ventaja gigante a la hora de escribir CSS fácil de mantener.

Como para la mayoría, mi primer caso de uso para las variables fueron los colores. ¿Definir una paleta de colores y usarla a lo largo de la hoja de estilos, para luego hacer cambios en un sólo lugar y que toda la hoja de estilos se actualice? ¿Dónde firmo?.

Pero la cosa, como siempre, no es tan simple.

Cuando estás desarrollando o manteniendo un sitio de mediano a grande, estar modificando el CSS a cada rato eventualmente causará algún conflicto. Lo ideal es tener una base de CSS lo suficientemente robusta como para aplicar cualquier patrón o característica directamente en el HTML.

Mantengámonos en el ejemplo de los colores. ¿Qué hacemos para aplicar colores en nuestras páginas sin necesidad de estar modificando el CSS?

Clases, claro.

Supongamos que tenemos estas variables de color:

```SCSS
$color-primary: #ff5400;
$color-secondary: #46424C;
$color-text: #060713;
```

Esos valores los utilizamos en nuestras reglas dentro del CSS, y para poder utilizarlos en el HTML, usualmente hacemos una serie de clases como estas:

```SCSS
.color-primary{ color: $color-primary; }
.color-secondary{ color: $color-secondary; }
.color-text{ color: $color-text; }

.bg-primary{ color: $color-primary; }
.bg-secondary{ color: $color-secondary; }
.bg-text{ color: $color-text; }
```

Hasta ahora todo bien. El problema es que mientras más variaciones de color vayamos agregando, más engorroso es mantener sincronizadas las clases con las variables de color. En algunos proyectos he tenido 20-30 variaciones de color. Eso es demasiado CSS que escribir y mantener manualmente.

¡Fácil, iteramos sobre las variables y generamos clases que hagan referencia a esas variables!

Nope, en SASS no podemos tener una lista de variables sobre la cual iterar, ni se pueden interpolar los nombres de variables. Es decir, no podemos generar código que contenga nombres de variables en su resultado.

### SASS Maps.

Lo que sí podemos hacer es utilizar un SASS Map en lugar de variables para los colores. Un SASS Map es basicamente una lista de pares tipo *key, value*. Su sintaxis es:

```SCSS
$map: ( key1: value1, key2: value2, key3: value3 )
```

Convirtiendo nuestras variables de color a un SASS Map, tendríamos:

```SCSS
$colors: (
	"primary": #ff5400,
	"secondary": #46424C,
	"text": #060713
)
```

Y de paso creamos una funcion de búsqueda para acceder a los colores a partir de su nombre, es decir, de su *key*:

```SCSS
@function color($search) {
  @return map-get($colors, $search);
}
```

Ahora si. Nuestro problema inicial era que queríamos hacer dos cosas:

### 1. Utilizar las variables de color en las propiedades de nuestra hoja de estilo.

Cuando queramos utilizar una de nuestras nuevas "variables" en una regla de estilo, en lugar de ```color: $color-primary``` utilizamos nuestra función de búsqueda:

```SCSS
color: color("primary");
```

### 2. Tener clases para utilizar cualquier color como color de texto o de fondo directamente en nuestro HTML.

Ahora si podemos iterar sobre nuestro SASS Map para generar las clases de color necesarias:

```SCSS
/* the colors */
@each $key, $value in $colors {
  .color-#{$key}{ color: #{$value}; }
  .bg-#{$key}{ background-color: #{$value}; }
}
```

Esto generará el siguiente CSS:

```CSS
.color-primary{ color: #ff5400; }
.bg-primary{ background-color: #ff5400; }
.color-secondary{ color: #46424C; }
.bg-secondary{ color: #46424C; }
.color-text{ color: #060713; }
.bg-text{ color: #060713; }
```


Y cada vez que edites o agregues un nuevo color a tu SASS Map, las clases se generarán solitas y estarás listo para usar ese color tanto en tu CSS como en tu HTML.


