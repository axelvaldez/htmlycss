---
layout: post
excerpt_separator: <!-- more -->
title: "Centrado vertical con CSS en 2023"
tldr: "Centrar verticalmente dejó de ser un problema hace años. Pasemos a lo siguiente."
tags: css
---

Recientemente (todavía en 2022), he visto a varias personas aplicar técnicas super inconvenientes (display: table-cell) o complicadas (margin 50% + translate -50%) solo para centrar verticalmente un elemento dentro de otro.

Una vez vi a alguien importar [Materialize](https://materializecss.com) nada más para centrar verticalmente.

Es casi 2023, este asunto se solucionó hace años. Esto es todo lo que necesitas memorizar:

{% codeblocknohtml %}
---
.parent{
    display: grid;
    place-content: center;
}
{% endcodeblocknohtml %}

Pum. De nada. ¡Feliz año nuevo! ([aunque sea muy tarde para eso](https://www.youtube.com/watch?v=U4rkzyGFFo0)).