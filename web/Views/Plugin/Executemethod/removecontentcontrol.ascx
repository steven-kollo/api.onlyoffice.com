<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("RemoveContentControl", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows removing the currently selected content control retaining all its contents. 
The content control where the mouse cursor is currently positioned will be removed.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("RemoveContentControl");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.buttonIDChangeState_click = undefined;
    if (null == returnValue) {
        window.Asc.plugin.executeMethod("AddContentControl", [1, {"Id" : 7, "Lock" : 0, "Tag" : "{some text}"}]);
    }
    else {
        window.Asc.plugin.executeMethod("RemoveContentControl", [returnValue]);
    }
</pre>
