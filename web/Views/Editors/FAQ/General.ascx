<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        General questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="general_1">
    <dt>I am new to ONLYOFFICE Docs API. Where should I start?</dt>
    <dd>
        <p>If you do not know where to start with ONLYOFFICE Docs API, we suggest that you first read the <a href="<%= Url.Action("basic") %>">Basic concepts</a> and <a href="<%= Url.Action("howitworks") %>">How it works</a> sections to have better understanding of how ONLYOFFICE Docs API is built. Once you are familiar with the main concepts, you can visit the <a href="<%= Url.Action("try") %>">Try now</a> section to see the live examples of the main ONLYOFFICE Docs features in action.</p>
        <p>If you are interested in a specific programming language example, see the <a href="<%= Url.Action("demopreview") %>">Language-specific examples</a> which are available in several programming languages and explain how to install ONLYOFFICE Docs, where to get the example source files and how to install them and connect ONLYOFFICE Docs.</p>
        <p>The users who use some document management systems (Nextcloud, ownCloud, SharePoint etc.) and simply want to know how to connect ONLYOFFICE Docs to these systems should visit the <a href="<%= Url.Action("plugins") %>">Ready-to-use connectors</a> section where all the main plugins working with ONLYOFFICE Docs are explained.</p>
        <p>The detailed description of every API method is available in the larger <b>Documentation</b> module. All the methods are described in the appropriate sections, the list of them is available in the <a href="<%= Url.Action("advanced") %>">Advanced parameters</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="general_2">
    <dt>How to find out the current version number of ONLYOFFICE Docs?</dt>
    <dd>
        <p>The current ONLYOFFICE Docs version number can be found at the <b>About</b> page of the Document, Presentation or Spreadsheet Editor, right below the logo and the editor name.</p>
        <p>You can use the API to send a POST request to the <b><b>document command service</b></b>. Use the <em>c</em> parameter for that with the <a href="<%= Url.Action("command/version") %>">version</a> value, which is sent as a JSON object in the request body:</p>
        <pre>{
    "c": "version"
}
</pre>
        <p>The request result of version is returned in JSON form, like this:</p>
        <pre>{
    "error": 0,
    "version": "4.3.1.4"
}</pre>
        <p>More detailed information about the interaction with the <b>document command service</b> and the use of various commands to do that is available <a href="<%= Url.Action("command") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="general_3">
    <dt>I want to change some ONLYOFFICE Docs parameters from the default.json configuration file. How can I do that so that my changes were not lost after update?</dt>
    <dd>
        <p>All the main settings for ONLYOFFICE Docs are stored in the <em>default.json</em> configuration file which is available in the <em>/etc/onlyoffice/documentserver/</em> folder (for Linux) or <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\</em> (for Windows). There is also the platform-specific <em>production.json</em> file in the same folder, in which the settings relevant for Linux or Windows are stored.</p>
        <p>ONLYOFFICE Docs uses the <a target="_blank" href="https://www.npmjs.com/package/config">Node.js config module</a> to organize and structure configuration files, so the hierarchy of these files looks like this:</p>
        <pre>default.json
production.json
local.json</pre>
        <p>Where all the main settings are stored in the <em>default.json</em> file, with some of them added or overriden by ones from <em>production.json</em> file and any user/developer settings overriden by the ones from <em>local.json</em> configuration file.</p>
        <div class="note">If you change the parameters in either <em>default.json</em> or <em>production.json</em> file, all the changes will be lost after ONLYOFFICE Docs update or Docker container restart (in case you have ONLYOFFICE Docs installed using Docker).</div>
        <p>So we strongly recommend that you <b>do not</b> alter the parameters in either <em>default.json</em> or <em>production.json</em> files and use <em>local.json</em> configuration file instead. This file must be created in the same folder with the <em>default.json</em> file and the <b>whole object structure</b> for the necessary parameter <b>must be retained</b>.</p>
        <p>The examples of <em>local.json</em> use can be found in the following sections:</p>
        <ul>
            <li><a href="<%= Url.Action("save") %>#savedelay">Save delay</a></li>
            <li><a href="<%= Url.Action("save") %>#forcesave">Force saving</a></li>
            <li><a href="<%= Url.Action("signature/body") %>">Request with token in body</a></li>
            <li><a href="<%= Url.Action("wopi/") %>#enable">Enabling WOPI</a></li>
            <li><a href="<%= Url.Action("wopi/") %>#ip-filter">IP filter</a></li>
        </ul>
    </dd>
</dl>