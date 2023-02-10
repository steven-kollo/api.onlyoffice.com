<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    前端框架
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">前端框架</span>
    </h1>

    <p class="dscr">
        ONLYOFFICE 文档可以使用组件与一些现有的前端框架集成。
        这些组件提供随时可用的代码模块、标准化的前端技术和可重用的接口块，使构建用户界面的过程更快、更容易。
    </p>

    <p>目前，可以使用以下框架：</p>
    <ul>
        <li><a href="<%= Url.Action("angular") %>">Angular</a></li>
        <li><a href="<%= Url.Action("react") %>">React</a></li>
        <li><a href="<%= Url.Action("vue") %>">Vue</a></li>
    </ul>

    <br />
    <p>如果您有任何其他问题，请通过 <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com与我们联系</a>。</p>

</asp:Content>
