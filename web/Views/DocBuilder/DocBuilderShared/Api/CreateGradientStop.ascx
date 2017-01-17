<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateGradientStop">CreateGradientStop(oUniColor, nPos) &rarr; {<a href="<%= Url.Action(data + "/apigradientstop") %>">ApiGradientStop</a>}</h4>
    
<p class="dscr">
Create a gradient stop used for different types of gradients.
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
            <td>The color used for the gradient stop.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nPos</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PositivePercentage">PositivePercentage</a>
            </td>
            <td>The position of the gradient stop measured in 1000th of percent.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apigradientstop") %>">ApiGradientStop</a>
    </dd>
</dl>