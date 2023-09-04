<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        集成问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="integrating_1">
    <dt>在哪里可以找到 ONLYOFFICE 文档服务器的集成示例？</dt>
    <dd>
        <p>可以在 <a href="<%= Url.Action("demopreview") %>">此处</a>找到将文档服务器与您自己的网站集成的示例。您可以在不同的 Web 开发编程语言中进行选择：</p>
        <ul class="columns-2">
            <li><a href="<%= Url.Action("example/csharp") %>">.Net (C#) / .Net (C# MVC)</a></li>
            <li><a href="<%= Url.Action("example/java") %>">Java</a></li>
            <li><a href="<%= Url.Action("example/javaspring") %>">Java Spring</a></li>
            <li><a href="<%= Url.Action("example/nodejs") %>">Node.js</a></li>
            <li><a href="<%= Url.Action("example/php") %>">PHP</a></li>
            <li><a href="<%= Url.Action("example/python") %>">Python</a></li>
            <li><a href="<%= Url.Action("example/ruby") %>">Ruby</a></li>
        </ul>
        <p>这些示例将显示从何处获取源代码，如何安装和设置工作示例，以便将文档服务器集成到您的网站中，它们是用其中一个编程语言编写的。</p>
        <p>如果您想将文档服务器连接到现有的文档管理服务之一，您可以查看以下服务的现成连接器：</p>
        <ul class="columns-2">
            <li><a href="<%= Url.Action("alfresco") %>">Alfresco</a></li>
            <li><a href="<%= Url.Action("chamilo") %>">Chamilo</a></li>
            <li><a href="<%= Url.Action("confluence") %>">Confluence</a></li>
            <li><a href="<%= Url.Action("drupal") %>">Drupal</a></li>
            <li><a href="<%= Url.Action("humhub") %>">HumHub</a></li>
            <li><a href="<%= Url.Action("liferay") %>">Liferay</a></li>
            <li><a href="<%= Url.Action("mattermost") %>">Mattermost</a></li>
            <li><a href="<%= Url.Action("moodle") %>">Moodle</a></li>
            <li><a href="<%= Url.Action("nextcloud") %>">Nextcloud</a></li>
            <li><a href="<%= Url.Action("nuxeo") %>">Nuxeo</a></li>
            <li><a href="<%= Url.Action("odoo") %>">Odoo</a></li>
            <li><a href="<%= Url.Action("owncloud") %>">ownCloud</a></li>
            <li><a href="<%= Url.Action("plone") %>">Plone</a></li>
            <li><a href="<%= Url.Action("redmine") %>">Redmine</a></li>
            <li><a href="<%= Url.Action("sharepoint") %>">SharePoint</a></li>
            <li><a href="<%= Url.Action("strapi") %>">Strapi</a></li>
            <li><a href="<%= Url.Action("suitecrm") %>">SuiteCRM</a></li>
            <li><a href="<%= Url.Action("wordpress") %>">WordPress</a></li>
        </ul>
        <p>大多数连接器可从相应的服务应用程序商店获得，并且易于安装。只需按照 <a href="<%= Url.Action("plugins") %>">连接器页面</a> 上的分步说明将文档服务器连接到您的服务。</p>
    </dd>
</dl>
<dl class="faq_block" id="integrating_2">
    <dt>在将文档服务器与我的网站集成时，我应该指定哪些路径？</dt>
    <dd>
        <p>下载并解压用于将文档服务器与您的网站集成的示例后，您需要打开源代码并将 <b>https://documentserver/</b> 字符串的所有实例替换为您安装的文档服务器的实际地址。</p>
    </dd>
</dl>
<dl class="faq_block" id="integrating_3">
    <dt>通过本地和公共网络将 ONLYOFFICE 连接到 ownClowd/Nextcloud 时应该使用哪些设置？</dt>
    <dd>
        <p>将 ownCloud/Nextcloud安装连接到文档服务器时，您需要确保 Internet 浏览器和 ownCloud/Nextcloud 安装都可以访问安装了文档服务器的服务器，即一台可以向它发送请求，也可以接受来自它的响应的安装了文档服务器的计算机，。</p>
        <p>ownCloud 安装和文档服务器之间的交互方案可在 <a href="<%= Url.Action("owncloud") %>#settings">此处</a>获得。如果您使用 Nextcloud，请访问 <a href="<%= Url.Action("nextcloud") %>#settings">此页面</a> 以了解如何正确设置服务器。</p>
    </dd>
</dl>