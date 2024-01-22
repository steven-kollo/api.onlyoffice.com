---
title: Presentation
layout: page/page.webc
permalink: /document-builder/javascript-sdk/presentation/index.html
order: -1
---
A presentation document has a more simple structure than that of a text document, most of the presentation elements are nested within the slide element with all the other elements placed on it. The single or multiple slide elements are a part of the presentation element.

If you need all the slides to contain the same fonts and images, the slide master should be used. It consists of the same elements as the slide.

The layout can be added to the slide to specify its structure. Also some drawn objects - images, shapes, charts - can be placed directly to the slide or slide layout. The placeholder element can be added to the shape.

The text cannot be placed directly to the slide, it can be only grouped to paragraphs and added to the shapes or tables. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called runs. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.
