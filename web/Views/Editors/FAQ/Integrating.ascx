<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        Integrating questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="integrating_1">
    <dt>Where can I find integration examples for ONLYOFFICE Document Server?</dt>
    <dd>
        <p>The examples of integration of Document Server with your own website can be found <a href="<%= Url.Action("demopreview") %>">here</a>. You can choose among different web development programming languages:</p>
        <ul>
            <li><a href="<%= Url.Action("example/csharp") %>">.Net (C#)</a></li>
            <li><a href="<%= Url.Action("example/java") %>">Java</a></li>
            <li><a href="<%= Url.Action("example/nodejs") %>">Node.js</a></li>
            <li><a href="<%= Url.Action("example/php") %>">PHP</a></li>
            <li><a href="<%= Url.Action("example/ruby") %>">Ruby</a></li>
        </ul>
        <p>The examples will show where to get the source codes, how to install and set up the working examples for integrating Document Server into your website written with the help of one of these programming languages.</p>
        <p>If you want to connect Document Server to one of the existing document management services, you can see the ready-made connectors for the following services:</p>
        <ul>
            <li><a href="<%= Url.Action("example/alfresco") %>">Alfresco</a></li>
            <li><a href="<%= Url.Action("example/confluence") %>">Confluence</a></li>
            <li><a href="<%= Url.Action("example/nextcloud") %>">Nextcloud</a></li>
            <li><a href="<%= Url.Action("example/owncloud") %>">ownCloud</a></li>
            <li><a href="<%= Url.Action("example/sharepoint") %>">SharePoint</a></li>
        </ul>
        <p>Most of the connectors are available from the corresponding service application store and are easy to install. Just follow the step-by-step instructions at the connector page and connect Document Server to your service.</p>
    </dd>
</dl>
<dl class="faq_block" id="integrating_2">
    <dt>Which paths should I specify when integrating Document Server with my website?</dt>
    <dd>
        <p></p>
    </dd>
</dl>
<dl class="faq_block" id="integrating_3">
    <dt>What settings should be used when connecting ONLYOFFICE to ownClowd/Nextcloud via a local and public network?</dt>
    <dd>
        <p></p>
    </dd>
</dl>