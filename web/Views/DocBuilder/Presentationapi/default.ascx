<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Structure of a presentation</span>
</h1>

<p>A presentation document has a more simple structure than that of a text document, most of the presentation elements are nested within the <span class="description_element_label">slide</span> element with all the other elements placed on it. The single or multiple <span class="description_element_label">slide</span> elements are a part of the <span class="description_element_label">presentation</span> element.</p>
    <p>Some drawn objects - <span class="description_element_label">images</span>, <span class="description_element_label">shapes</span>, <span class="description_element_label">charts</span> - can be placed directly to the <span class="description_element_label">slide</span>.</p>
    <p>The text cannot be placed directly to the <span class="description_element_label">slide</span>, it can be only grouped to <span class="description_element_label">paragraphs</span> and added to the <span class="description_element_label">shapes</span>. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called <span class="description_element_label">runs</span>. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.</p>
    <p>Thus any presentation document structure with <b>ONLYOFFICE Document Builder</b> API used to create it can be outlined like this:</p>
