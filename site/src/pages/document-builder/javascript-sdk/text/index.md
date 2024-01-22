---
title: Text Document
layout: page/page.webc
permalink: /document-builder/javascript-sdk/text/index.html
order: -3
---
Although a text document consists of various elements, most of them are nested in each other and three main elements can be outlined: paragraph, table and block content control. All the other elements are a part of these three larger ones.

The text itself can be added directly to a paragraph, block content control, inline text content control, range or table cell, which is a part of a table structure. But, for the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called runs. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.

The text runs, in their turn, have text itself and other elements which can be a part of text: images, shapes, charts.

Besides the text runs, paragraphs can also contain inline text content controls and hyperlinks.

A table has a little bit more complex structure, as it comprises table rows, which in their turn include table cells within their structure. Table cells can have the whole paragraph, table or block content control structure inside them.

A block content control can also contain the paragraph, table or another block content control inside it.
