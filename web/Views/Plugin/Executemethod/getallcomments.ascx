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

<p>The method returns an <em>array</em> of comment objects containing the comment data in the following form:</p>
<pre>
{
    "Id": "1_631",
    "Data": {
        "UserName": "John Smith",
        "Text": "comment",
        "Time": "1662737941471",
        "Solved": true,
        "Replies": [{"UserName": "Mark Potato", "Text": "reply 1", "Time": "1662740895892", "Solved": false}]
    }
}
</pre>
<div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
			<col />
			<col class="table-type" />
			<col class="table-example" />
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
                <td>Id</td>
                <td>The comment ID.</td>
                <td>string</td>
                <td>"1_631"</td>
            </tr>
            <tr class="tablerow">
                <td>Data</td>
                <td>
                    An object which contains the comment data:
                    <ul>
                        <li>
                            <b>UserName</b> - the comment author,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "John Smith";
                            <br />
                        </li>
                        <li>
                            <b>Text</b> - the comment text,
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "comment";
                            <br />
                        </li>
                        <li>
                            <b>Time</b> - the time when the comment was posted (in milliseconds),
                            <br />
                            <b>type</b>: string,
                            <br />
                            <b>example</b>: "1662737941471";
                            <br />
                        </li>
                        <li>
                            <b>Solved</b> - specifies if the comment is resolved (<b>true</b>) or not (<b>false</b>),
                            <br />
                            <b>type</b>: boolean,
                            <br />
                            <b>example</b>: true;
                            <br />
                        </li>
                        <li>
                            <b>Replies</b> - an array containing the comment replies represented as the <em>oCommentData</em> objects,
                            <br />
                            <b>type</b>: array of objects.
                        </li>
                    </ul>
                </td>
                <td>object</td>
                <td></td>
            </tr>
        </tbody>
    </table>
<div class="mobile-content"></div>
