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

<p>The method returns the data in the following form (JSON):</p>
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
