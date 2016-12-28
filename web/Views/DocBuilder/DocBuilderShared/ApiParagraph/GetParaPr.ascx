<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetParaPr">GetParaPr() &rarr; {<a href="<%= Url.Action(data + "/apiparapr") %>">ApiParaPr</a>}</h4>
<p class="dscr">
Get paragraph properties.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apiparapr") %>">ApiParaPr</a>
    </dd>
</dl>

