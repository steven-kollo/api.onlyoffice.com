<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetTextPr">GetTextPr() &rarr; {<a href="<%= Url.Action(data + "/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">
Get the text properties of the current run.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apitextpr") %>">ApiTextPr</a>
    </dd>
</dl>
