<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Signature</span>
</h1>
<p class="dscr">ONLYOFFICE Document Server <a href="<%= Url.Action("security") %>">uses</a> <b>tokens</b> generated using the JSON Web Tokens standard.</p>

<div class="note">This feature is used in <b>Document Server</b> starting with version 4.2</div>

<p>For the validation setup it is necessary to edit the configuration file which can be found (or created) at the following path:</p>
<div>For Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>.</div>
<div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>.</div>

<div class="note">
    The default values are available in the <em>default.json</em> configuration file, which is available in the folders above (for Linux and Windows).
    Please do not edit the contents of the <em>default.json</em> file directly. The default values will be restored each time you restart Docker container or upgrade <b>Document Server</b> to a new version and all your changes will be lost.
</div>

<p>Restart the services for the config changes to take effect:</p>

<pre>
supervisorctl restart all
</pre>

<div class="header-gray">Parameters</div>

<table class="table">
    <colgroup>
        <col style="width: 300px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 100px;" />
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
            <td>services.CoAuthoring.secret.inbox.string</td>
            <td>Defines the <em>secret key</em> to generate the token in the <a href="<%= Url.Action("signature/browser") %>">browser</a> for the <b>document editor</b> opening and calling the methods and the <a href="<%= Url.Action("signature/request") %>">requests</a> to the <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b>.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td>Defines the <em>secret key</em> to generate the token in the <a href="<%= Url.Action("signature/request") %>">requests</a> by <b>document editing service</b> to "callbackUrl" address.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>Specifies the enabling the token validation in the <a href="<%= Url.Action("signature/browser") %>">config</a> for the <b>document editor</b> opening and calling the methods.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>Specifies the enabling the token validation in the <a href="<%= Url.Action("signature/request") %>">requests</a> to the <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>Specifies the enabling the token generation for the <a href="<%= Url.Action("signature/request") %>">requests</a> by <b>document editing service</b> to <b>document storage service</b>.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>


<div class="header-gray">Sample local.json configuration</div>
<pre>
{
    "services": {
        "CoAuthoring": {
            "secret": {
                "inbox": {
                    "string": "secret"
                },
                "outbox": {
                    "string": "secret"
                },
            },
            "token": {
                "enable": {
                    "browser": true,
                    "request": {
                        "inbox": true,
                        "outbox": true
                    }
                }
            }
        }
    }
}
</pre>
