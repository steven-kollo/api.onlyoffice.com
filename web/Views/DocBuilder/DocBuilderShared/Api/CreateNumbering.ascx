<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateNumbering">CreateNumbering(sType, nStartAt) &rarr; {<a href="<%= Url.Action(data + "/apibullet") %>">ApiBullet</a>}</h4>
<p class="dscr">
Create a bullet for a paragraph with the character or symbol specified with the <em>sType</em> parameter.
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
            <td><em>sType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#BulletType">BulletType</a>
            </td>
            <td></td>
            <td>The numbering type the paragraphs will be numbered with.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nStartAt</em></td>
            <td>
                <em>number</em>
            </td>
            <td>&lt;optional></td>
            <td>The number the first numbered paragraph will start with.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a class="changeable" href="<%= Url.Action(data + "/apibullet") %>">ApiBullet</a>
    </dd>
</dl>