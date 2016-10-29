<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a text document</span>
</h1>

<p class="dscr">Although a text document consists of various elements, most of them are nested in in each other and two main elements can be outlined: paragraph and table. All the other elements are a part of these two larger ones.</p>
<p>The text itself can be added directly to a paragraph or a table cell, which is a part of a table structure. But, for the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called runs. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.</p>
<p>The text runs, in their turn, have text itself and other elements which can be a part of text: images, shapes, charts.</p>
<p>A table has a little bit more complex structure, as it comprises table rows, which in their turn include table cells within their structure. Table cells can have the whole paragraph structure inside them.</p>
<p>Thus any text document structure with <b>ONLYOFFICE Document Builder</b> API used to create it can be outlined like this:</p>
