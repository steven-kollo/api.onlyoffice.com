<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    即用型连接器
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">即用型连接器</span>
    </h1>

    <p class="dscr">
        ONLYOFFICE 文档可以使用插件集成到一些现有的文档管理系统中。
        这些插件将文档编辑功能快速轻松地添加到您使用的文档管理系统中，而无需编写自己的代码。
    </p>

    <p>目前，可以使用以下插件：</p>
    <ul>
        <li><a href="<%= Url.Action("alfresco") %>">ONLYOFFICE Alfresco 模块包</a></li>
        <li><a href="<%= Url.Action("chamilo") %>">Chamilo ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("confluence") %>">Confluence ONLYOFFICE 集成应用</a></li>
        <li><a href="<%= Url.Action("drupal") %>">Drupal ONLYOFFICE 连接器模块</a></li>
        <li><a href="<%= Url.Action("humhub") %>">HumHub ONLYOFFICE 连接器</a></li>
        <li><a href="<%= Url.Action("jira") %>">Jira ONLYOFFICE 集成应用</a></li>
        <li><a href="<%= Url.Action("liferay") %>">Liferay ONLYOFFICE 连接器</a></li>
        <li><a href="<%= Url.Action("mattermost") %>">Mattermost ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("moodle") %>">Moodle ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("nextcloud") %>">Nextcloud ONLYOFFICE 集成应用</a></li>
        <li><a href="<%= Url.Action("nuxeo") %>">Nuxeo ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("odoo") %>">Odoo ONLYOFFICE integration app</a></li>
        <li><a href="<%= Url.Action("owncloud") %>">ownCloud ONLYOFFICE 集成应用</a></li>
        <li><a href="<%= Url.Action("plone") %>">Plone ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("redmine") %>">Redmine ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("sharepoint") %>">SharePoint ONLYOFFICE 集成解决方案</a></li>
        <li><a href="<%= Url.Action("strapi") %>">Strapi ONLYOFFICE 集成插件</a></li>
        <li><a href="<%= Url.Action("wordpress") %>">WordPress ONLYOFFICE 集成插件</a></li>
    </ul>

    <br />
    <p>
        如果您有任何其他问题，请通过
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com与我们联系</a>。
    </p>

</asp:Content>
