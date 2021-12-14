<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">Overview</span>
    </h1>

    <p class="dscr">
        Starting from version 6.4, ONLYOFFICE Docs offers support for the <b>Web Application Open Platform Interface Protocol (WOPI)</b> - a REST-based protocol 
        that is used to integrate your application with an online office. WOPI operations allow you to open files stored on a server, edit and save them. 
    </p>
    <p>This documentation describes:</p>
    <ul>
        <li>file properties that can be specified via <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>;</li>
        <li>a <a href="<%= Url.Action("wopi/hostpage") %>">host page</a> that must be built to create an iframe element within the online office;</li>
        <li><a href="<%= Url.Action("wopi/proofkeys") %>">proof keys</a> which are used to check that the request is received from the online office;</li>
        <li>supported <a href="<%= Url.Action("wopi/restapi") %>">WOPI REST API</a> functions;</li>
        <li>available messages that can be posted via <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>.</li>
    </ul>

    <p>For further information on the WOPI protocol, please read the <a href="https://wopi.readthedocs.io/en/latest/" target="_blank">WOPI documentation</a>.</p>

    <h2 id="enable" class="copy-link">Enabling WOPI</h2>
    <p>To enable WOPI, set the <em>wopi.enable</em> parameter in the Document Server config to <b>true</b>.</p>

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
            <tr>
                <td>wopi.enable</td>
                <td>Defines if WOPI is enabled or not. The default value is <b>false</b>.</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>
    <pre>
{
    "wopi": {
        "enable": true
    }
}
</pre>

    <h2 id="ip-filter" class="copy-link">IP filter</h2>
    <p>ONLYOFFICE Docs can accept WOPI requests only from the trusted integrator. 
        The IP address of such an integrator must be included in the <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/build-test-ship/settings#wopi-domain-allow-list" target="_blank">WOPI domain allow list</a>. 
        At the same time, access for all the other integrators must be denied.</p>
    <note>By default, all the IP addresses are considered trusted.</note>
    <p>Follow the steps below to configure the Document Server IP filter:</p>
    <ol>
        <li>
            <p>Open the <em>/etc/onlyoffice/documentserver/default.json</em> file using any available text editor:</p>
            <pre>
"ipfilter": {
    "rules": [
        {
            "address": "ip_address",
            "allowed": true
        },
        {
            "address": "*",
            "allowed": false
        }
    ],
    "useforrequest": true,
    "errorcode": 403
}
</pre>
        </li>
        <li>
            <p>Change the following default settings. Enter your <em>"ip_address"</em> that can contain:</p>
            <ul>
                <li>IP in the X.X.X.X format for ipv4,</li>
                <li>IP in the xxxx.xxxx.xxxx.xxxx.xxxx.xxxx.xxxx.xxxx format for ipv6,</li>
                <li>dns-name,</li>
                <li>* wildcard to replace any symbol/symbols.</li>
            </ul>
            </ul>
        </li>
        <li>Change the <em>"allowed"</em> rule that can be <b>true</b> or <b>false</b>.</li>
        <li>
            <p>Restart the services for the config changes to take effect:</p>
            <pre>
supervisorctl restart all
</pre>
        </li>
    </ol>
