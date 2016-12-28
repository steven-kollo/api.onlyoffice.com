<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateBullet">CreateBullet(sBullet) &rarr; {<a href="<%= Url.Action(data + "/apibullet") %>">ApiBullet</a>}</h4>
<p class="dscr">
Create a bullet for a paragraph with the character or symbol specified with the <em>sBullet</em> parameter.
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
            <td><em>sBullet</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The character or symbol which will be used to create the bullet for the paragraph.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action(data + "/apibullet") %>">ApiBullet</a>
    </dd>
</dl>