<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingdms/") %>"></a>
    <span class="hdr">Encryption</span>
</h1>


<p>Starting from version 5.6, ONLYOFFICE Desktop Editors offers support for Private Rooms, secure workspace where every symbol you type is encrypted end-to-end even 
    if you co-edit documents in real time. Using ONLYOFFICE Desktop Editors makes it possible to encrypt and decrypt the data on the client, ensuring endpoint security.</p>


<h2 id="commands" class="copy-link">Processing desktop editors commands</h2>

<p>Declare the <em>cloudCryptoCommand</em> function to process messages from the desktop app:</p>
<pre>
window.cloudCryptoCommand = function (type, params, callback) 
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>
                <p>Defines the command type:</p>
                <ul>
                    <li><em>encryptionKeys</em> - to save private and public keys to the parameters,</li>
                    <li><em>relogin</em> - to re-enter the portal after unsuccessful keys decryption,</li>
                    <li><em>getsharingkeys</em> - to request for the public keys of all the users who have access to the file. The keys will be transferred via callback:</li>
                    <p>callback ({"keys": [{"userId": "78e1e841","publicKey": "yyy"}, ...]})</p>
                </ul>
            </td>
            <td>string</td>
        </tr>
        <tr class="tablerow">
            <td id="params" class="copy-link">params</td>
            <td>
                Defines the parameters that are passed to the method.
            </td>
            <td>string</td>
        </tr>
        <tr class="tablerow">
            <td id="callback" class="copy-link">callback</td>
            <td>
                Defines the result that the method returns.
            </td>
            <td>string</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>Explore the following pages to find out which commands need to be used for:</p>
<ul>
    <li><a href="<%= Url.Action("addingdms/encryption/keygeneration") %>">Key generation</a></li>
    <li><a href="<%= Url.Action("addingdms/encryption/operations") %>">Operations with encrypted files</a></li>
</ul>
