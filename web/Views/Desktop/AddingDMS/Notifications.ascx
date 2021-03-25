<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingdms/") %>"></a>
    <span class="hdr">Sending notifications</span>
</h1>


<p>
    The desktop app can send text messages to be displayed to the user. To do so, declare the function:
</p>
<pre>
window.onSystemMessage = function (e)
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
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="e.type" class="copy-link">e.type</td>
            <td>
                Checks if the message type is <em>operation</em>. If not, then no messages are displayed to the user.
            </td>
            <td>string</td>
            <td>"operation"</td>
        </tr>
        <tr class="tablerow">
            <td id="e.opMessage" class="copy-link">e.opMessage</td>
            <td>
                Defines the message that will be displayed to the user.
            </td>
            <td>string</td>
            <td>"Loading..."</td>
        </tr>
        <tr class="tablerow">
            <td id="e.opType" class="copy-link">e.opType</td>
            <td>
                Defines the message by the operation type if the <em>opMessage</em> parameter is undefined. 
                Set it to <b>0</b> to inform the user about file upload, or to <b>1</b> to inform about file encryption.
            </td>
            <td>integer</td>
            <td>1</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>
<pre>
window.onSystemMessage({"type" : "operation", "opType" : 1})                    
</pre>


<h2>Updating file status</h2>

<p>The desktop app can send notifications about file editing completion.</p>
<p>Declare the following global function:</p>
<pre>
window.DesktopUpdateFile = function ()
</pre>
