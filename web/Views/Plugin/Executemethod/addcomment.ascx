<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("AddComment", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding a comment to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("AddComment", [oCommentData]);
</pre>
<div class="header-gray">Parameters</div>
<div id="mobile-content"></div>
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
            <td>oCommentData</td>
            <td>
                An object which contains the comment data:
                <ul>
                    <li>
                        <b>comment</b> - the comment text,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "comment";
                        <br />
                    </li>
                    <li>
                        <b>author</b> - the comment author,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "John Smith";
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Returns</div>

<p>The method returns the comment id in the <em>string</em> format or <em>null</em> if the comment cannot be added.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("AddComment", [{"comment": "comment", "author": "John Smith"}]);
</pre>
