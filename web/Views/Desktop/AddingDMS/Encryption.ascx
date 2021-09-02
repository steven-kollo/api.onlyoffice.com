<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingdms/") %>"></a>
    <span class="hdr">Encryption</span>
</h1>


<p>Starting from version 5.6, ONLYOFFICE Desktop Editors offers support for Private Rooms, secure workspace where every symbol you type is encrypted end-to-end even 
    if you co-edit documents in real time. Using ONLYOFFICE Desktop Editors makes it possible to encrypt and decrypt the data on the client, ensuring endpoint security.</p>

<p>To check if the desktop app supports encryption, call the following command:</p>
<pre>
typeof window.AscDesktopEditor.cloudCryptoCommand === "function"
</pre>

<h2>How it works</h2>
<p>The steps below explain the process of document encryption in ONLYOFFICE.</p>   

<ol>
    <li>
        <p>Log in to the cloud and pass the <b>Encryption</b> plugin ID:</p>
        <pre>
window.AscDesktopEditor.execCommand("portal:login", JSON.stringify({
    "encryptionKeys": {
        "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"
    },
    ...
}));
</pre>
    </li>
    <li>
        <p>To monitor the password from the login page, send the desktop editors the <em>portal:checkpwd</em> command through the <a href="<%= Url.Action("addingdms/loginlogout") %>">execCommand</a> method. 
            Parameters are specified in the format of a string with the serialized <em>json</em> as follows:</p>
        <pre>
{
    "domain": "domain name",
    "emailInput": "user@email.addr",
    "pwdInput": "pwd"
}
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
                    <td id="domain" class="copy-link">domain</td>
                    <td>
                        Defines the cloud name and the cloud entry point.
                    </td>
                    <td>string</td>
                    <td>"https://exampledomain.com"</td>
                </tr>
                <tr class="tablerow">
                    <td id="emailInput" class="copy-link">emailInput</td>
                    <td>
                        Defines the user email entered on the login page.
                    </td>
                    <td>string</td>
                    <td>"john@example.com"</td>
                </tr>
                <tr class="tablerow">
                    <td id="pwdInput" class="copy-link">pwdInput</td>
                    <td>
                        Defines the password entered on the login page.
                    </td>
                    <td>string</td>
                    <td>"123456"</td>
                </tr>
            </tbody>
        </table>
        
        <div class="header-gray">Example</div>
        <pre>
window.AscDesktopEditor.execCommand("portal:checkpwd", JSON.stringify({
    "domain": "https://exampledomain.com",
    "emailInput": "john@example.com",
    "pwdInput": "123456"
}));                   
</pre>
        <p>When the command is sent, the DMS provider transfers the information about the password from the login page to the desktop app. 
            ONLYOFFICE Desktop Editors remembers the password and uses it for the key encryption and decryption.</p>
    </li>
    <li>
        <p>Pass the encrypted private and public keys with the login from the DMS provider to the desktop application with the following parameters:</p>
        <pre>
"encryptionKeys": {
    "cryptoEngineId": "guid",
    "privateKeyEnc": "private key",
    "publicKey": "public key"
}
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
                    <td id="cryptoEngineId" class="copy-link">cryptoEngineId</td>
                    <td>
                        Defines the <b>Encryption</b> plugin ID.
                    </td>
                    <td>string</td>
                    <td>"{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"</td>
                </tr>
                <tr class="tablerow">
                    <td id="privateKeyEnc" class="copy-link">privateKeyEnc</td>
                    <td>
                        Defines the encrypted private key.
                    </td>
                    <td>string</td>
                    <td>"xxx"</td>
                </tr>
                <tr class="tablerow">
                    <td id="publicKey" class="copy-link">publicKey</td>
                    <td>
                        Defines the public key.
                    </td>
                    <td>string</td>
                    <td>"yyy"</td>
                </tr>
            </tbody>
        </table>

        <div class="header-gray">Example</div>
        <pre>
window.AscDesktopEditor.execCommand("portal:login", JSON.stringify({
    "encryptionKeys": {
        "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
        "privateKeyEnc": "xxx",
        "publicKey": "yyy"
    },
    ...
}));                              
</pre>

        <p>You can also do it in the editor initialization config:</p>
        <pre>
new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "encryptionKeys": {
            "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
            "privateKeyEnc": "xxx",
            "publicKey": "yyy"
        },
        ...
    },
    ...
});
</pre>
    </li>
    <li>
        <p>If there are no keys in the DMS, then the desktop application generates them with the <b>Encryption</b> plugin. 
            To generate the RSA keys, the <em>NSOpenSSL::RSA_GenerateKeys</em> method is used:</p>
        <pre>
if (info.PrivateKeyEnc.empty() && info.PublicKey.empty())
{
    unsigned char* publicKey = NULL;
    unsigned char* privateKey = NULL;
    NSOpenSSL::RSA_GenerateKeys(publicKey, privateKey);
    ...
}
</pre>
    </li>
    <li>
        <p>To encrypt the private key before saving it to the database, ONLYOFFICE uses the <em>NSOpenSSL::AES_Encrypt_desktop</em> algorithm based on AES 256 Cipher Block Chaining:</p>
        <pre>
std::string privateEnc;
NSOpenSSL::AES_Encrypt_desktop(U_TO_UTF8(tmpInfo->m_sPassword), sPrivate, privateEnc, CAscRendererProcessParams::getInstance().GetProperty("user"));
info.PrivateKeyEnc = NSFile::CUtf8Converter::GetUnicodeFromCharPtr(privateEnc);
</pre>
    </li>
    <li>
        <p>Send the generated keys to the cloud through the <em>cloudCryptoCommand</em> method with the <em>encryptionKeys</em> type:</p>
        <pre>
window.AscDesktopEditor.cloudCryptoCommand(
    "encryptionKeys",
    {
        "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
        "privateKeyEnc": "xxx",
        "publicKey": "yyy"
    },
callback)
</pre>
    </li>
</ol>


<h2>Processing desktop editors commands</h2>

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
                    <li><em>encryptionKeys</em> - to save private and public keys to the params,</li>
                    <li><em>updateEncryptionKeys</em> - to save private and public keys to the params forcely updating the existing keys with them,</li>
                    <li><em>relogin</em> - to re-enter the portal after unsuccessful keys decryption,</li>
                    <li><em>getsharingkeys</em> - to request for the public keys of all the users who have access to the file. The keys will be transferred via callback:</li>
                    <p>callback({"keys":[{"userId":"78e1e841","publicKey":"yyy"}, ...]})</p>
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


<h2>Operations with encrypted files</h2>

<p>To perform operations with encrypted files, including file encryption, decryption, creation, editing and sharing, ONLYOFFICE uses the individual credentials of users 
    (RSA key pair) and a document password (document encryption key).</p>
<p>The encrypted files, besides the ciphertext itself, contain the arrays of public keys of all users and the document passwords encrypted with these keys. 
    This makes it possible to establish collective access to the file, and therefore enable sharing and collaboration on the encrypted documents.</p>


<p><b>Uploading encrypted documents</b></p>
<p>To upload encrypted files in the desktop app, replace the standard <em>input type = file</em> call with the <em>cloudCryptoCommand</em> function with the <em>upload</em> type. 
    The <em>params</em> object has the following values:</p>

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
            <td id="cryptoEngineId" class="copy-link">cryptoEngineId</td>
            <td>
                Defines the <b>Encryption</b> plugin ID.
            </td>
            <td>string</td>
            <td>"{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"</td>
        </tr>
        <tr>
            <td id="filter" class="copy-link">filter</td>
            <td>
                Defines the document types that can be encrypted.
            </td>
            <td>string</td>
            <td>"*.docx *.xlsx *.pptx"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Currently, it is possible to encrypt only OOXML formats, which are DOCX, XLSX, and PPTX.</div>
            </td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>
<pre>
window.AscDesktopEditor.cloudCryptoCommand("upload", {
    "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
    "filter": "*.docx *.xlsx *.pptx"
},
callback)                                    
</pre>

<p>After the user chooses the files, they will be encrypted in a loop and transferred to <em>callback</em>:</p>
<pre>
callback({
    "bytes": [...],
    "name": "Example Document Title.docx",
    "isCrypto": true
})
</pre>


<p><b>Sharing encrypted documents</b></p>
<p>To share the encrypted document, call the <em>cloudCryptoCommand</em> function with the <em>share</em> type. The <em>params</em> object has the following values:</p>

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
            <td id="cryptoEngineId" class="copy-link">cryptoEngineId</td>
            <td>
                Defines the <b>Encryption</b> plugin ID.
            </td>
            <td>string</td>
            <td>"{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}"</td>
        </tr>
        <tr class="tablerow">
            <td id="file" class="copy-link">file</td>
            <td>
                Defines the absolute url to the document.
            </td>
            <td>string</td>
            <td>"https://example.com/url-to-example-document.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="keys" class="copy-link">keys</td>
            <td>
                Defines the pairs of user ids and associated public keys.
            </td>
            <td>array</td>
            <td>[{"userId":"78e1e841","publicKey":"yyy"}, ...]</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Example</div>
<pre>
window.AscDesktopEditor.cloudCryptoCommand("share",
{
    "cryptoEngineId": "{FFF0E1EB-13DB-4678-B67D-FF0A41DBBCEF}",
    "file": ["https://example.com/url-to-example-document.docx" ],
    "keys":[{"userId":"78e1e841","publicKey":"yyy"}, ...]
}, 
callback)                                        
</pre>

<p>The file is uploaded by the desktop app and encrypted. The access rights to the file are transferred to it with keys. After that, it is transmitted to <em>callback</em>:</p>
<pre>
callback({
    "bytes": [...],
    "isCrypto": true
})
</pre>


<h2>Data location</h2>

<p>ONLYOFFICE leverages data storage for documents and the encrypted data between the cloud storage and the user’s local storage to maintain the applied scheme. 
    The distribution of data looks as follows:</p>

<table class="try-now-table">
    <thead>
        <tr>
            <th>Item</th>
            <th>Location within the instance</th>
            <th>Location on device</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Private key</td>
            <td>Encrypted, in the Database</td>
            <td>-</td>
        </tr>
        <tr>
            <td>Public key</td>
            <td>Database and within encrypted files (in the file system)</td>
            <td>-</td>
        </tr>
        <tr>
            <td>File encryption key</td>
            <td>Encrypted, within the encrypted files (in the file system)</td>
            <td>-</td>
        </tr>
        <tr>
            <td>User password</td>
            <td>-</td>
            <td>-</td>
        </tr>
        <tr>
            <td>Encrypted files at rest</td>
            <td>On the server</td>
            <td>-</td>
        </tr>
        <tr>
            <td>Encrypted files when editing</td>
            <td>-</td>
            <td>On machine, in temporary folder</td>
        </tr>
    </tbody>
</table>

<h2>Removing keys</h2>

<p>The desktop application stores all the read keys. To reset them and add new ones, please do the following:</p>
<ul>
    <li>delete keys in the DMS database;</li>
    <li>delete the <em>cloud_crypto.xml</em> file from the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</li>
    <ul style="list-style: none;">
        <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
        <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
    </ul>
</ul>
