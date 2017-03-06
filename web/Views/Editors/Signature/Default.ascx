<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Signature</span>
</h1>
<p class="dscr">ONLYOFFICE Document Server <a href="<%= Url.Action("security") %>">uses</a> <b>tokens</b> generated using the JSON Web Tokens standard.</p>

<div class="note">This feature is used in <b>Document Server</b> starting with version 4.2</div>

<p>For the validation setup it is necessary to edit the configuration file which can be found at the following path:</p>
<div>For Linux - <em>/etc/onlyoffice/documentserver/<b>default.json</b></em></div>
<div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>default.json</b></em></div>

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
            <td><em>secret key</em> to generate the token in the <a href="<%= Url.Action("signature/browser") %>">browser</a> for the <b>document editor</b> opening and calling the methods and the <a href="<%= Url.Action("signature/request") %>">requests</a> to the <b>document command service</b> and <b>document conversion service</b></td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td><em>secret key</em> to generate the token in the <a href="<%= Url.Action("signature/request") %>">requests</a> by <b>document editing service</b> to "callbackUrl" address</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>specifies the enabling the token validation in the <a href="<%= Url.Action("signature/browser") %>">config</a> for the <b>document editor</b> opening and calling the methods</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>specifies the enabling the token validation in the <a href="<%= Url.Action("signature/request") %>">requests</a> to the <b>document command service</b> and <b>document conversion service</b></td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>specifies the enabling the token validation in the <a href="<%= Url.Action("signature/request") %>">requests</a> by <b>document editing service</b> to "callbackUrl" address</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
    </tbody>
</table>


<div class="header-gray">Sample default.json configuration</div>
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
