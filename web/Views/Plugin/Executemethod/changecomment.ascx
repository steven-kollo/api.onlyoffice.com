<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("ChangeComment", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows changing the specified comment.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("ChangeComment", [sId, oCommentData]);
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
            <td>sId</td>
            <td>The comment id.</td>
            <td>string</td>
            <td>"id"</td>
        </tr>
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
                        <b>example</b>: "John Smith".
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("ChangeComment", ["id", {"comment": "comment", "author": "John Smith"}]);
</pre>
