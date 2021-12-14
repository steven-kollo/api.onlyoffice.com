<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Encrypting cloud documents</span>
</h1>

<p>Online editing and collaboration have the related gaps in file security - in real-time data transfer and authorized sharing.
Overcoming these limitations of previously existing individual document protection is the key objective of the encryption scheme in question.</p>
<p>Two-layer encryption model used in ONLYOFFICE involves:</p>
<ul>
    <li>symmetric encryption of documents using <b>AES-256 algorithm</b>;</li>
    <li><b>RSA asymmetric encryption</b> of document passwords necessary for authorized sharing and collaboration.</li>
</ul>
<p>With current model of encryption, it is possible to achieve the following:</p>
<ul>
    <li><b>Privacy of the encrypted data</b>. Unlike data encryption at rest, end-to-end document encryption in Private Rooms deals with active data of each user
    or group of users and is not subject to central administration.</li>
    <li><b>Attack-tolerance</b>. AES-256 algorithm ensures that brute force approach to password cracking will not be effective against the document security
    regardless of the applied computational power.</li>
    <li><b>Secure key sharing model</b>. Message-based principle of the RSA algorithm appears to be the most reliable model for managing authenticated access to the encrypted data
    as long the private keys are not mishandled by the users. It also allows carrying out operations with partitioned data to maintain the same level of protection
    while processing data in real time.</li>
</ul>

<h2 id="key-generation" class="copy-link">Key generation and management</h2>
<ol>
    <li>Each user obtains a pair of encryption keys, private and public, when they first log in to the system from their application instance.
    This personal pair of keys is a necessary element in the asymmetric layer of document encryption and decryption mechanisms.</li>
    <li>
        <p>If there are no keys in the DMS, they are generated with the <em>NSOpenSSL::RSA_GenerateKeys</em> method:</p>
        <pre>
if (!bIsServerPrivateKeyExist)
{
    unsigned char* publicKey = NULL;
    unsigned char* privateKey = NULL;
    NSOpenSSL::RSA_GenerateKeys(publicKey, privateKey);
    ...
}
</pre>
    </li>
    <li>
        <p>To encrypt the private key before saving it to the database, ONLYOFFICE uses the <em>NSOpenSSL::AES_Encrypt_desktop</em> algorithm based on AES-256 Cipher Block Chaining:</p>
        <pre>
std::string privateEnc;
NSOpenSSL::AES_Encrypt_desktop(U_TO_UTF8(tmpInfo->m_sPassword), sPrivate, privateEnc, CAscRendererProcessParams::getInstance().GetProperty("user"));
info.PrivateKeyEnc = NSFile::CUtf8Converter::GetUnicodeFromCharPtr(privateEnc);
</pre>
    </li>
    <li>
        <p>The private key decryption is performed when a synchronised temporary file copy needs to be decrypted when editing it.
        To decrypt the key, the <em>NSOpenSSL::AES_Decrypt_desktop</em> algorithm is used:</p>
        <pre>
std::string privateKey;
if (nServerPrivateKeyVersion == 2)
    NSOpenSSL::AES_Decrypt_desktop_GCM(U_TO_UTF8(tmpInfo->m_sPassword), privateKeyEnc, privateKey, CAscRendererProcessParams::getInstance().GetProperty("user"), nServerPrivateKeyVersionOffset);
else
    NSOpenSSL::AES_Decrypt_desktop(U_TO_UTF8(tmpInfo->m_sPassword), privateKeyEnc, privateKey, CAscRendererProcessParams::getInstance().GetProperty("user"));
info.PrivateKey = NSFile::CUtf8Converter::GetUnicodeFromCharPtr(privateKey);
</pre>
    </li>
</ol>

<h2 id="operations" class="copy-link">Operations with encrypted files</h2>
<p>To perform operations with encrypted files, including file encryption, decryption, creation, editing and sharing, ONLYOFFICE uses the individual credentials of users (RSA key pair)
and a document password (document encryption key).</p>
<p>The encrypted files, besides the ciphertext itself, contain the arrays of public keys of all users and the document passwords encrypted with these keys.
This makes it possible to establish collective access to the file, and therefore enable sharing and collaboration on the encrypted documents.</p>
<p>To encrypt the file password with each authorized user's public key, the <em>NSOpenSSL::RSA_EncryptPublic_desktop</em> algorithm is used:</p>
<pre>
std::string sKey = arguments[0]->GetStringValue().ToString();
NSStringUtils::string_replaceA(sKey, "&#xA", "\n");
std::string sMessage = arguments[1]->GetStringValue().ToString();
std::string sOut;
NSOpenSSL::RSA_EncryptPublic_desktop((unsigned char*)sKey.c_str(), sMessage, sOut);
retval = CefV8Value::CreateString(sOut);
return true;
</pre>
<p>The reverse <em>NSOpenSSL::RSA_DecryptPrivate_desktop</em> algorithm is used to decrypt the file using the user's private key:</p>
<pre>
std::string sKey = arguments[0]->GetStringValue().ToString();
std::string sMessage = arguments[1]->GetStringValue().ToString();
std::string sOut;
NSOpenSSL::RSA_DecryptPrivate_desktop((unsigned char*)sKey.c_str(), sMessage, sOut);
retval = CefV8Value::CreateString(sOut);
return true;
</pre>
<p>When accessing the encrypted file, it is first is sent to the user's machine before the application begins the decryption.</p>

<h3>Encrypted co-editing</h3>
<p>The steps below explain the process of co-editing an encrypted document in ONLYOFFICE Document Server.</p>
<ol>
    <li>User 1 and user 2 open one and the same document in <b>document editor</b>.</li>
    <li>User 1 makes changes to the opened document.</li>
    <li>The editor encrypts the changes using the <em>NSOpenSSL::AES_Encrypt_desktop</em> algorithm based on AES-256 CBC.</li>
    <li>All saved changes are sent to the portal.</li>
    <li>User 2 receives the encrypted changes and the user's machine decrypts them using the <em>NSOpenSSL::AES_Decrypt_desktop</em> method.</li>
</ol>

<h2 id="data-location" class="copy-link">Data location</h2>
<p>ONLYOFFICE leverages data storage for documents and the encrypted data between the cloud storage and the user's local storage to maintain the applied scheme.
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

<h2 id="removing-keys" class="copy-link">Removing keys</h2>

<p>The desktop application stores all the read keys. To reset them and add new ones, please do the following:</p>
<ul>
    <li>delete keys in the DMS database;</li>
    <li>delete the <em>cloud_crypto.xml</em> file from the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</li>
    <ul style="list-style: none;">
        <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
        <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
    </ul>
</ul>
