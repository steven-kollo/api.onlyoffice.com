<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a spreadsheet</span>
</h1>

<p>A spreadsheet document has a more simple structure than that of a text document, most of the spreadsheet elements are nested within the <span class="description_element_label">worksheet</span> element with all the other elements placed on it.</p>
<p>The <span class="description_element_label">cells</span> can be given various values, some of the cell text properties can also be changed.</p>
<p>Some drawn objects - <span class="description_element_label">images</span>, <span class="description_element_label">shapes</span>, <span class="description_element_label">charts</span> - can be placed directly to the <span class="description_element_label">worksheet</span>.</p>
<p>The text that does not pertain to the cell values, can be grouped to <span class="description_element_label">paragraphs</span> and added to the <span class="description_element_label">shapes</span>. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called <span class="description_element_label">runs</span>. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.</p>
<p>Thus any spreadsheet document structure with <b>ONLYOFFICE Document Builder</b> API used to create it can be outlined like this:</p>
