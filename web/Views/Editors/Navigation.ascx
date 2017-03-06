<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("try") %>">Try now</a>
    </li>
    <li>
        <a href="<%= Url.Action("demopreview") %>">Integration examples</a>
        <ul>
            <li>
                <a href="<%= Url.Action("example/csharp") %>">.Net (C#) example</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/java") %>">Java example</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/nodejs") %>">Node.js example</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/php") %>">PHP example</a>
            </li>
            <li>
                <a href="<%= Url.Action("example/ruby") %>">Ruby example</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("plugins") %>">Integration connectors</a>
        <ul>
            <li>
                <a href="<%= Url.Action("alfresco") %>">Alfresco integration</a>
            </li>
            <li>
                <a href="<%= Url.Action("confluence") %>">Confluence integration</a>
            </li>
            <li>
                <a href="<%= Url.Action("owncloud") %>">ownCloud/Nextcloud integration</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("howitworks") %>">How it works</a>
        <ul>
            <li>
                <a href="<%= Url.Action("open") %>">Opening file</a>
            </li>
            <li>
                <a href="<%= Url.Action("save") %>">Saving file</a>
            </li>
            <li>
                <a href="<%= Url.Action("coedit") %>">Co-editing</a>
            </li>
            <li>
                <a href="<%= Url.Action("conversion") %>">Converting and downloading file</a>
            </li>
            <li>
                <a href="<%= Url.Action("history") %>">Document history</a>
            </li>
            <li>
                <a href="<%= Url.Action("security") %>">Security</a>
            </li>
        </ul>
    </li>
</ul>

<div class="treeheader">Documentation</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("advanced") %>">Advanced parameters</a>
    </li>
    <li>
        <a href="<%= Url.Action("config/") %>">Config</a>
        <ul>
            <li>
                <a href="<%= Url.Action("config/document") %>">Document</a>
                <ul class="">
                    <li>
                        <a href="<%= Url.Action("config/document/info") %>">Info</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("config/document/permissions") %>">Permissions</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("config/editor") %>">Editor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("config/editor/customization") %>">Customization</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("config/editor/embedded") %>">Embedded</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("config/editor/plugins") %>">Plugins</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("config/events") %>">Events</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("methods") %>">Methods</a>
    </li>
    <li>
        <a href="<%= Url.Action("callback") %>">Callback handler</a>
    </li>
    <li>
        <a href="<%= Url.Action("command") %>">Command service</a>
    </li>
    <li>
        <a href="<%= Url.Action("conversionapi") %>">Conversion API</a>
    </li>
    <li>
        <a href="<%= Url.Action("signature/") %>">Signature</a>
        <ul>
            <li>
                <a href="<%= Url.Action("signature/browser") %>">browser</a>
            </li>
            <li>
                <a href="<%= Url.Action("signature/request") %>">request</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("troubleshooting") %>">Troubleshooting</a>
    </li>
</ul>
