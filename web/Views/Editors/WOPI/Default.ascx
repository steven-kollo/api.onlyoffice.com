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
