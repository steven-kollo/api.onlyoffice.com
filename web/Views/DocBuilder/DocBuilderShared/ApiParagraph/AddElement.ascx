<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="AddElement">AddElement(oElement, nPos<sub>opt</sub>) &rarr; {boolean}</h4>
<p class="dscr">
Add an element to the current paragraph.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>oElement</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#ParagraphContent">ParagraphContent</a>
            </td>
            <td></td>
            <td>The document element which will be added at the current position. Returns <em>false</em> if the type of <em>oElement</em> is not supported by a paragraph.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nPos</em></td>
            <td>
                <em>number</em>
            </td>
            <td>&lt;optional>
            </td>
            <td>The number of the paragraph where the current element will be added. If this value is not specified then the element will be added at the end of the current paragraph.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>boolean</em>
    </dd>
</dl>
