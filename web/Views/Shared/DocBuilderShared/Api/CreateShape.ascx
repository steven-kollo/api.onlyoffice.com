<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateShape">CreateShape(sType<sub>opt</sub>, nWidth, nHeight, oFill, oStroke) &rarr; {<a href="<%= Url.Action(data + "/apishape") %>">ApiShape</a>}</h4>
<p class="dscr">
Create a shape with the parameters specified.
</p>
    
<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#ShapeType">ShapeType</a>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>"rect"</td>
            <td>The shape type which specifies the preset shape geometry.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nWidth</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td></td>
            <td></td>
            <td>The shape width in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nHeight</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#EMU">EMU</a>
            </td>
            <td></td>
            <td></td>
            <td>The shape height in English measure units.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oFill</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>
            </td>
            <td></td>
            <td></td>
            <td>The color or pattern used to fill the shape.</td>
        </tr>
        <tr class="tablerow">
            <td><em>oStroke</em></td>
            <td>
                <a href="<%= Url.Action(data + "/apistroke") %>">ApiStroke</a>
            </td>
            <td></td>
            <td></td>
            <td>The stroke used to create the element shadow.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apishape") %>">ApiShape</a>
    </dd>
</dl>