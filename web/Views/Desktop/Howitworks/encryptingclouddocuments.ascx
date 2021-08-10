<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Encrypting cloud documents</span>
</h1>

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
