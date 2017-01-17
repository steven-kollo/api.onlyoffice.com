<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateParagraph">CreateParagraph() &rarr; {<a href="<%= Url.Action(data + "/apiparagraph") %>">ApiParagraph</a>}</h4>
<p class="dscr">
Create a new paragraph.
</p>
    

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apiparagraph") %>">ApiParagraph</a>
    </dd>
</dl>