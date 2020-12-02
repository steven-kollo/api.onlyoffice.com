<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("OnEncryption", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows encrypting plugins.</p>

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
    <li>"type" (e.g. <em>{"type": "encryptData"}</em>) specifies the type of encrypting operation ("generatePassword", "getPasswordByFile", "setPasswordByFile", "encryptData", "decryptData");</li>
    <li>"password" (e.g. <em>{"password": "password"}</em>) is a string value specifying the password to access the plugin;</li>
    <li>"data" (e.g. <em>{"data": "{data}"}</em>) is plugin encryption data (internal format);</li>
    <li>"check" (e.g. <em>{"check": true}</em>) checks if the password is valid (true) or not (false);</li>
    <li>"docinfo" (e.g. <em>{"docinfo": "docinfo"}</em>) is the information about the document;</li>
    <li>"hash" (e.g. <em>{"hash": "md5"}</em>) is a string value specifying the hash name;</li>
    <li>"error" (e.g. <em>{"error": "no_build"}</em>) is a string value specifying the error that occurs.</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("OnEncryption", [{"type": "encryptData", "data": "{data}", "check": true}]);
</pre>
