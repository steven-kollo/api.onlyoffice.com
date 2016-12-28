<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="GetClassType">GetClassType() &rarr; {"uniColor"}</h4>
<p class="dscr">
Get the type of the class based on this base class.
</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>"presetColor"</em> | <em>"rgbColor"</em> | <em>"schemeColor"</em>
    </dd>
</dl>
