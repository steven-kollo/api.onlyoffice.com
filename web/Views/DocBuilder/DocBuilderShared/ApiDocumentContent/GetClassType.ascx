<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"documentContent"}</h4>
<p class="dscr">
Get the type of the current class.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>"documentContent"</em>
    </dd>
</dl>
