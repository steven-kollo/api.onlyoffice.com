<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<string>"
%>

<% var data = Model as string; %>

<h4 class="header-gray" id="CreateBlipFill">CreateBlipFill(sImageUrl, sBlipFillType) &rarr; {<a href="<%= Url.Action(data + "/apifill") %>">ApiFill</a>}</h4>
<p class="dscr">
    Create a blip fill which allows to fill the object using a selected image as the object background.
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
            <td><em>sImageUrl</em></td>
            <td>
                <em>string</em>
            </td>
            <td>The path to the image used for the blip fill (currently only internet URL or Base64 encoded images are supported).</td>
        </tr>
        <tr class="tablerow">
            <td><em>sBlipFillType</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#BlipFillType">BlipFillType</a>
            </td>
            <td>The type of the fill used for the blip fill (<em>tile</em> or <em>stretch</em>).</td>
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