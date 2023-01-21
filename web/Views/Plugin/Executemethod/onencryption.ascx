<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("OnEncryption", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows encrypting the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("OnEncryption", [obj]);
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
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>obj</td>
            <td>
                The encryption properties. This object can have the following values:
                <ul>
                    <li>
                        <b>type</b> - the type of encrypting operation (<em>generatePassword</em> - generates a password for the document, 
                        <em>getPasswordByFile</em> - sends the password when opening the document, <em>setPasswordByFile</em> - sets a password to the document, 
                        <em>encryptData</em> - encrypts changes when co-editing, <em>decryptData</em> - decrypts changes when co-editing),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "encryptData";
                        <br />
                    </li>
                    <li>
                        <b>password</b> - a string value specifying the password to access the document,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "password";
                        <br />
                    </li>
                    <li>
                        <b>data</b> - encrypted/decrypted changes,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{data}";
                        <br />
                    </li>
                    <li>
                        <b>check</b> - checks if the encryption/decryption operation is successful or not (used only for <em>encryptData</em>/<em>decryptData</em> types),
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                        <br />
                    </li>
                    <li>
                        <b>docinfo</b> - an unencrypted part of the encrypted file,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{docinfo}";
                        <br />
                    </li>
                    <li>
                        <b>hash</b> - a string value specifying a file hash (<em>sha256</em> by default),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "sha256";
                        <br />
                    </li>
                    <li>
                        <b>error</b> - a string value specifying an error that occurs (the "" value means that the operation is successful),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "no_build".
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
window.Asc.plugin.executeMethod("OnEncryption", [{"type": "getPasswordByFile", "hash": "sha256", "docinfo": "{docinfo}"}]);
</pre>
