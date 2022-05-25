<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Signature</span>
</h1>
<p class="dscr">ONLYOFFICE Document Server <a href="<%= Url.Action("security") %>">uses</a> <b>tokens</b> generated using the JSON Web Tokens standard.</p>

<div class="note">This feature is used in <b>Document Server</b> starting with version 4.2</div>

<p>For the validation setup it is necessary to edit the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#SecretKey" target="_blank">secret key</a> and <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#Token" target="_blank">token</a> parameters in the configuration file which can be found (or created) at the following path:</p>
<div>For Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>.</div>
<div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>.</div>

<div class="note">
    The default values are available in the <em>default.json</em> configuration file, which is available in the folders above (for Linux and Windows).
    Please do not edit the contents of the <em>default.json</em> file directly.
    The default values will be restored each time you restart Docker container or upgrade <b>Document Server</b> to a new version and all your changes will be lost.
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
            <td>services.CoAuthoring.secret.browser.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> to ONLYOFFICE Docs.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.inbox.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the <a href="<%= Url.Action("signature/request") %>#incoming">incoming HTTP requests</a> with the commands from the <b>document storage service</b> to the <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b>.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the <a href="<%= Url.Action("signature/request") %>#outgoing">outgoing HTTP requests</a> to the <em>callbackUrl</em> address by <b>document editing service</b>.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>Defines if a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>Defines if a token in the <a href="<%= Url.Action("signature/request") %>#incoming">incoming HTTP requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>Defines if a token in the <a href="<%= Url.Action("signature/request") %>#outgoing">outgoing HTTP requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>


<div class="header-gray">Sample local.json configuration</div>
<pre>
{
    "services": {
        "CoAuthoring": {
            "secret": {
                "browser": {
                    "string": "secret"
                },
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
