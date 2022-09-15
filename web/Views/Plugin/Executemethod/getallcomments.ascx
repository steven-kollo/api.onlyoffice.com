<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetAllComments", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting all the comments from the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetAllComments");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns an <em>array</em> of comment objects containing the comment properties in the following form:</p>
<pre>
{
    "UserName": "John Smith",
    "Text": "comment",
    "Time": "1662737941471",
    "Solved": true,
    "Replies": [{"UserName": "Mark Potato", "Text": "reply 1", "Time": "1662740895892", "Solved": false}]
}
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>UserName</td>
            <td>The comment author.</td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr class="tablerow">
            <td>Text</td>
            <td>The comment text.</td>
            <td>string</td>
            <td>"comment"</td>
        </tr>
        <tr class="tablerow">
            <td>Time</td>
            <td>The time when the comment was posted (in milliseconds).</td>
            <td>string</td>
            <td>"1662737941471"</td>
        </tr>
        <tr class="tablerow">
            <td>Solved</td>
            <td>Specifies if the comment is resolved (<b>true</b>) or not (<b>false</b>).</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td>Replies</td>
            <td>An array containing the comment replies represented as the <em>oCommentData</em> objects.</td>
            <td>array of objects.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
