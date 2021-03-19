<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("OnEncryption", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows encrypting the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("OnEncryption", [obj]);
</pre>
<p>Where <em>obj</em> is a JSON object of the following form (JSON):</p>
<pre>
{
    "type" : "string",
    "password" : "string",
    "data" : "string",
    "check" : boolean,
    "docinfo" : "string",
    "hash" : "string",
    "error" : "string"
}
</pre>
<p>The <em>obj</em> object can have the following values:</p>
<ul>
    <li>"type" (e.g. <em>{"type": "encryptData"}</em>) specifies the type of encrypting operation 
    (<em>generatePassword</em> - generates a password for the document, <em>getPasswordByFile</em> - sends the password when opening the document, 
    <em>setPasswordByFile</em> - sets a password to the document, <em>encryptData</em> - encrypts changes when co-editing, <em>decryptData</em> - decrypts changes when co-editing);</li>
    <li>"password" (e.g. <em>{"password": "password"}</em>) is a string value specifying the password to access the document;</li>
    <li>"data" (e.g. <em>{"data": "{data}"}</em>) is encrypted/decrypted changes;</li>
    <li>"check" (e.g. <em>{"check": true}</em>) checks if the encryption/decryption operation is successful or not (used only for encryptData/decryptData types);</li>
    <li>"docinfo" (e.g. <em>{"docinfo": "{docinfo}"}</em>) is an unencrypted part of an encrypted file;</li>
    <li>"hash" (e.g. <em>{"hash": "sha256"}</em>) is a string value specifying a file hash ("sha256" by default);</li>
    <li>"error" (e.g. <em>{"error": "no_build"}</em>) is a string value specifying the error that occurs (the "" value means that the operation is successful).</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns the <em>obj</em> object.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("OnEncryption", [{"type": "getPasswordByFile", "hash": "sha256", "docinfo": "{docinfo}"}]);
</pre>
