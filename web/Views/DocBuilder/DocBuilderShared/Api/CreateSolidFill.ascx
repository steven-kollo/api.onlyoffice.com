<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateSolidFill">CreateSolidFill(oUniColor) &rarr; {<a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
Create a solid fill which allows to fill the object using a selected solid color as the object background.
</p>
    
<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>oUniColor</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apiunicolor") %>">ApiUniColor</a>
            </td>
            <td>The color used for the element fill.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
    </dd>
</dl>
