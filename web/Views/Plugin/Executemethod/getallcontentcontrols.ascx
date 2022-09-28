<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetAllContentControls", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting information about all the content controls that have been added to the page.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetAllContentControls");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns an array of content control objects:</p>
<pre>
[
    {
        "Tag": "Document",
        "Id": 0,
        "Lock": 0,
        "InternalId": "1_713"
    }
]
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
            <td>Tag</td>
            <td>A tag assigned to the content control. The same tag can be assigned to several content controls so that it is possible to make reference to them in the code.</td>
            <td>string</td>
            <td>"{tag}"</td>
        </tr>
        <tr class="tablerow">
            <td>Id</td>
            <td>A unique identifier of the content control. It can be used to search for a certain content control and make reference to it in the code.</td>
            <td>integer</td>
            <td>2</td>
        </tr>
        <tr class="tablerow">
            <td>Lock</td>
            <td>A value which defines if it is possible to delete and/or edit the content control or not.</td>
            <td>integer</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>InternalId</td>
            <td>A unique internal identifier of the content control.</td>
            <td>string</td>
            <td>"1_713"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
var flagInit = false;
window.Asc.plugin.init = function (text) {
    if (!flagInit) {
        this.executeMethod ("GetAllContentControls", null, function(data) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].Tag == 11) {
                    this.Asc.plugin.executeMethod("SelectContentControl",[data[i].InternalId]);
                    break;
                }
            }
        });
        flagInit = true;
        ...
    }
};
</pre>
