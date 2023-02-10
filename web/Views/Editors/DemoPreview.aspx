<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<List<string>>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    特定语言示例
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">特定语言示例</span>
    </h1>

    <p>使用 ONLYOFFICE 文档，任何协作解决方案都可以通过文档编辑和共同编辑来增强。
        在本节中，您将学习如何将 ONLYOFFICE 文档集成到您自己的网站中。</p>


    <p>每个 ONLYOFFICE 文档实例都包括用于文本文档、电子表格、演示文稿和可填写表单的在线编辑器，以及一个测试示例。</p>
    <p>测试示例是简单的文档管理系统，可以内置到您的应用程序中进行测试。
        默认包含的测试示例是用 Node.js 编写的。默认情况下，它处于禁用状态。要启用它，请按照开始屏幕上的说明进行操作。</p>

    <div class="note">
        集成示例用于演示文档编辑器功能以及将 <b>文档服务器</b> 与您自己的应用程序相连接的方法。
        <b>不要在没有正确修改代码</b> 的情况下在您自己的服务器上使用这些示例<b></b>！
        如果您启用了任何测试示例，请在发布产品之前将其禁用。
    </div>

    <h2 id="security" class="copy-link">重要安全信息</h2>
    <p>在使用测试示例时，请记住以下几方面的安全事项：</p>
    <ul>
        <li>由于不需要授权，因此无法保护存储免受未经授权的访问。</li>
        <li>没有检查链接中的参数替换，因为参数是由代码根据预先安排的脚本生成的。</li>
        <li>在编辑后保存文件的请求中没有数据检查，因为每个测试示例仅适用于来自 ONLYOFFICE 文档服务器的请求。</li>
        <li>没有禁止使用来自其他站点的测试示例，因为它们用于与来自另一个域的 ONLYOFFICE 文档服务器进行交互。</li>
    </ul>

    <h2>要开始将文档编辑器集成到您自己的网站中，您需要执行以下操作：</h2>

    <ol>
        <li>
            <p>下载 文档服务器安装文件并在您的本地服务器上进行设置：</p>
            <div class="list-buttons">
                <a class="button" href="https://www.onlyoffice.com/zh/developer-edition-request.aspx?from=api.onlyoffice.com" target="_blank">获取ONLYOFFICE编辑器
                </a>
            </div>
        </li>

        <li>
            <p>选择编程语言并将在线编辑器集成示例的代码下载到您的网站：
                <% if (Model != null && Model.Count > 0)
           { %>
            </p>
            <ul class="list-buttons">
                <% foreach (var example in Model)
                   { %>
                <li>
                    <a class="button" href="<%= Url.Content("~/app_data/editor/" + example.Replace("#", "%23")) %>" target="_blank">
                        <%= example.TrimEnd(".zip".ToCharArray()) %>
                    </a>
                </li>
                <% } %>
            </ul>
            <p>
                或查找源代码
        <% } %>
                <a href="https://github.com/ONLYOFFICE/document-server-integration" target="_blank">集成示例</a>。
            </p>
        </li>

        <li><a href="<%= Url.Action("advanced") %>">编辑示例中的配置文件</a>，将配置文件的默认路径更改为在步骤 1 中安装的编辑器，修改可用于编辑器配置的其他高级参数。</li>

        <li>如果示例和文档服务器安装在不同的计算机上，请确保安装了示例的服务器可以访问您指定地址的文档服务器，而不是配置文件中的 <b>documentserver</b>。
            并且您还必须确保文档服务器能够访问安装了示例的服务器，该示例使用您指定的地址而不是配置文件中的 <b>example.com</b>。
        </li>
    </ol>

    <p>结果应该类似于下面的演示预览。</p>

    <h2 id="DemoPreview" class="copy-link">演示预览</h2>
    <table class="demo-tab-panel">
        <tr>
            <td>
                <a class="<%= Request["type"] != "spreadsheet" && Request["type"] != "presentation"  ? "active" : "" %>" href="<%= Url.Action("demopreview") %>?type=text#DemoPreview">演示文档编辑器</a>
            </td>
            <td>
                <a class="<%= Request["type"] == "spreadsheet" ? "active" : "" %> demo-tab-center" href="<%= Url.Action("demopreview") %>?type=spreadsheet#DemoPreview">演示电子表格编辑器</a>
            </td>
            <td>
                <a class="<%= Request["type"] == "presentation" ? "active" : "" %>" href="<%= Url.Action("demopreview") %>?type=presentation#DemoPreview">演示演示文稿编辑器</a>
            </td>
        </tr>
    </table>

    <div class="demo-block">
        <div id="placeholder"></div>
    </div>

    <p>
        如果您有任何其他问题，请通过
        <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com与我们联系</a>。
    </p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">

    <script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

    <%
        var documentType = "word";
        var ext = "docx";
        if (Request["type"] == "spreadsheet")
        {
            documentType = "cell";
            ext = "xlsx";
        }
        else if (Request["type"] == "presentation")
        {
            documentType = "slide";
            ext = "pptx";
        }
    %>
    <script type="text/javascript">
        window.docEditor = new DocsAPI.DocEditor("placeholder",
            <%= Config.Serialize(
                new Config
                    {
                        Document = new Config.DocumentConfig
                            {
                                FileType = ext,
                                Key = "apiwh" + Guid.NewGuid(),
                                Title = "Example Title." + ext,
                                Url = ConfigurationManager.AppSettings["storage_demo_url_zh"] + "demo." + ext,
                                Permissions = new Config.DocumentConfig.PermissionsConfig
                                    {
                                        Download = false,
                                        Print = false
                                    }
                            },
                        DocumentType = documentType,
                        EditorConfig = new Config.EditorConfigConfiguration
                            {
                                CallbackUrl = Url.Action("callback", null, null, Request.Url.Scheme),
                                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                                    {
                                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                                            {
                                                Request = false
                                            },
                                        CompactHeader = true,
                                        CompactToolbar = true,
                                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                                            {
                                                Visible = true
                                            },
                                        HideRightMenu = true,
                                        HideRulers = true,
                                        IntegrationMode = "embed",
                                        ToolbarHideFileName = true,
                                        ToolbarNoTabs = true
                                    },
                                Lang = "zh"
                            },
                        Height = "550px",
                        Width = "100%"
                    }) %>
            );
    </script>

</asp:Content>
