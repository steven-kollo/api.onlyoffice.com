<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetSelectedText", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the selected text from the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetSelectedText", [numbering]);
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
            <td>numbering</td>
            <td>
                Defines the resulting string display properties:
                <ul>
                    <li>
                        <b>NewLine</b> - defines if the resulting string will include line boundaries or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                        <br />
                    </li>
                    <li>
                        <b>NewLineParagraph</b> - defines if the resulting string will include paragraph line boundaries or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                        <br />
                    </li>
                    <li>
                        <b>Numbering</b> - defines if the resulting string will include numbering or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                        <br />
                    </li>
                </ul>
            </td>
            <td>array of objects</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the selected text in the <em>string</em> format.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("GetSelectedText", [{"NewLine": true, "NewLineParagraph": true, "Numbering": true}], function(sText) {
    CorrectText(sText);
})
</pre>