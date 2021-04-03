---
layout: post
excerpt_separator: <!-- more -->
title: "Unidades de medida en CSS"
tldr: "Lee esto para que no te confundas con px, em, rem, vh, vw, vmin, vmax... etcétera."
tags: css
category: notas
---

Las unidades de medida son súper importantes en CSS, con ellas controlamos el tamaño de cualquier elemento custom en nuestras páginas. Sin embargo, fuera de ```px``` y ```em```, muchas siguen siendo desconocidas para la mayoría de quienes empiezan en CSS.

## Unidades absolutas

Las unidades absolutas son fijas, es decir, se pueden considerar siempre del mismo tamaño. Casi todas las heredamos del mundo de la impresión, de donde vienen también conceptos como "página" o "*fold*", porque en su momento se consideraba que diseñar para la web era más o menos igual que diseñar para impresión.

| Unidad | Nombre | Descripción |
|---|---|---|
| cm | Centímetros | 1cm = Un centímetro |
| mm | Milímetros | 1mm = Un milímetro |
| Q | Cuarto de milímetro | 1Q = .25 milímetros |
| in | Pulgadas | 1in = Una pulgada o 2.54 centímetros |
| pc | Picas | 1pc = 1/6 de una pulgada |
| pt | Puntos | 1pt = 1/72 de una pulgada |
| px | Pixels | 1px = 1 pixel de la pantalla |

A menos que estés haciendo hojas de estilo para impresión, ninguna de estas unidades te será útil, excepto ```px```, que es la única que se basa en una medida relacionada con la pantalla, lo que la vuelve predecible.

## Unidades Relativas, el pan de cada día

Algunas más conocidas que otras, estas son las que realmente usamos a la hora de crear hojas de estilo, porque se relacionan directamente con el tamaño de la pantalla, viewport o de otros elementos en nuestras páginas.

| Unidad | Descripción |
|---|---|
| em | Tamaño de fuente del elemento padre, en caso de aplicar a propiedades tipográficas<br>Tamaño de fuente del mismo elemento cuando se aplica a propiedades de tamaño como ```width``` o ```height``` |
| rem | Tamaño de fuente del elemento raíz, es decir, el elemento ```html``` |
| ex | La altura del caracter "x" del elemento |
| ch | El ancho del caracter "0" del elemento |
| lh | La altura de linea (```line-height```) del elemento |
| vw | 1% del ancho del *viewport* |
| vh | 1% de la altura del *viewport* |
| vmin | 1% de la dimensión más pequeña del *viewport* (ancho o altura) |
| vmax | 1% de la dimensión más grande del *viewport* (ancho o altura) |