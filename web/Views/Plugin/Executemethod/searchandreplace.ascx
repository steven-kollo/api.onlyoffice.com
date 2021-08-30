<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("SearchAndReplace", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows finding and replacing the text.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("SearchAndReplace", [oProperties]);
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
            <td>oProperties</td>
            <td>
                An object which contains the search and replacement strings:
                <ul>
                    <li>
                        <b>searchString</b> - the search string,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "text1";
                        <br />
                    </li>
                    <li>
                        <b>replaceString</b> - the replacement string,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "text2";
                        <br />
                    </li>
                    <li>
                        <b>matchCase</b> - case sensitive or not,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                        <br />
                    </li>
                </ul>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("SearchAndReplace", ["searchString": "text1", "replaceString": "text2", "matchCase": true]);
</pre>