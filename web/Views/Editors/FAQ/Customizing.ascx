<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        定制问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="customizing_1">
    <dt>如何对 ONLYOFFICE 文档服务器进行白标？</dt>
    <dd>
        <p>可以编辑以下选项来为您的文档服务器版本添加白标签，更改显示在 <b>关于</b> 页面上并对所有编辑器用户可见的信息。</p>
        <div class="note">请注意，更改这些选项仅适用于 <a target="_blank" href="https://www.onlyoffice.com/zh/developer-edition-prices.aspx">ONLYOFFICE 开发者版</a> 用户。</div>
        <ul>
            <li><em>editorConfig.customization.customer</em> 选项：
                <ul>
                    <li><em>editorConfig.customization.customer.address</em> 用于指定公司或个人的邮政地址；</li>
                    <li><em>editorConfig.customization.customer.info</em> 用于提供有关公司或个人的一些附加信息；</li>
                    <li><em>editorConfig.customization.customer.logo</em> 用于指定logo图片的路径；</li>
                    <li><em>editorConfig.customization.customer.logoDark</em> 用于指定深色主题的logo图片路径；</li>
                    <li><em>editorConfig.customization.customer.mail</em> 用于指定公司或个人的电子邮件地址；</li>
                    <li><em>editorConfig.customization.customer.name</em> 用于指定授予编辑或编辑作者访问权限的公司或个人的名称；</li>
                    <li><em>editorConfig.customization.customer.www</em> 用于指定公司或个人的主页地址。</li>
                </ul>
            </li>
            <li><em>editorConfig.customization.logo</em> 选项：
                <ul>
                    <li><em>editorConfig.customization.logo.image</em> 用于指定图像文件的路径，该图像在普通工作模式（即所有编辑器的查看和编辑模式）或嵌入模式下显示；</li>
                    <li><em>editorConfig.customization.logo.imageDark</em> 用于指定用于深色主题的图像文件的路径；</li>
                    <li><em>editorConfig.customization.logo.url</em> 用于指定当有人单击徽标图像时将使用的绝对 URL（您可以保留为空字符串或 null 以使徽标不可点击）。</li>
                </ul>
            </li>
        </ul>
        <p>填写所有上述字段后， <em>定制</em> 配置将如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "customer": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "logoDark": "https://example.com/dark-logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "www": "example.com"
            },
            "logo": {
                "image": "https://example.com/logo.png",
                "imageDark": "https://example.com/dark-logo.png",
                "url": "https://www.onlyoffice.com/zh/"
            },
            ...
        },
        ...
    },
    ...
});</pre>
        <p>有关定制的更多信息，请参见 <a href="<%= Url.Action("config/editor/customization") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_2">
    <dt>如何更改文档服务器界面的默认语言？</dt>
    <dd>
        <p>如果界面语言出现在 <a target="_blank" href="https://helpcenter.onlyoffice.com/server/document/available-languages.aspx">可用的文档服务器语言列表</a>中，您可以简单地使用配置文件中的 <em>editorConfig.lang</em> 属性将其设置为必要的语言环境，如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "lang": "de",
        ...
    },
    ...
});</pre>
        <p>如果该语言不可用并且您想要将其翻译或已经将其翻译成您自己的语言，请参阅 <a target="_blank" href="https://helpcenter.onlyoffice.com/server/docker/document/add-interface-language.aspx">此文</a> 以了解如何将其安装到您的文档服务器。</p>
        <p>有关语言设置的更多信息，请参见 <a href="<%= Url.Action("config/editor") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_3">
    <dt>如何启用或禁用编辑器中的聊天和/或评论面板？</dt>
    <dd>
        <p>默认情况下聊天和评论是被启用的。要禁用它们，请使用 <em>document.permissions.comment</em> 和 <em>document.permissions.chat</em> 参数，并在配置文件中将它们的值分别设置为 <b>false</b> ：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "chat": false,
            "comment": false,
            ...
        },
        ...
    },
    ...
});</pre>
        <p>这将禁用 <b>聊天</b> 和 <b>评论</b> 按钮及其功能。</p>
        <p>有关定制的更多信息，请参见 <a href="<%= Url.Action("config/editor/customization") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_4">
    <dt>如何自定义编辑器界面，例如调整顶部工具栏视图？</dt>
    <dd>
        <p>您可以显示完整的顶部工具栏或其紧凑版本。为了控制这一点，使用 <em>editorConfig.customization.compactToolbar</em> 参数。使用默认的 <b>false</b> 值，顶部工具栏将具有其通常的视图。如果要显示其紧凑型变体，则配置必须如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "compactToolbar": true,
            ...
        },
        ...
    },
    ...
});</pre>
        <p>有关定制的更多信息，请参见 <a href="<%= Url.Action("config/editor/customization") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_5">
    <dt>如何查看和更改文档的附加参数，例如其所有者或上传日期？</dt>
    <dd>
        <p>文档所有者和上传日期分别受 <em>document.info.owner</em> 和 <em>document.info.uploaded</em> 参数影响。您可以通过以下方式将这些设置从您的某个数据库传递到文档配置文件：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": {
            "owner": "John Smith",
            "uploaded": "2010-07-07 3:46 PM",
        },
        ...
    },
    ...
});</pre>
        <p>该值将显示在 <b>文件</b> > <b>文档信息...</b> 菜单选项中。</p>
        <p>有关这些设置的更多信息，请参见 <a href="<%= Url.Action("config/document/info") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_6">
    <dt>如何优化桌面计算机、移动设备或嵌入网页的编辑器的外观？</dt>
    <dd>
        <p>编辑器有三种主要外观，针对不同用途进行了优化：</p>
        <ul>
            <li>
                <b>desktop</b>，针对桌面计算机浏览器中的显示进行了优化:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "desktop",
    ...
});</pre>
            </li>
            <li>
                <b>mobile</b>，针对移动设备浏览器中的显示进行了优化:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "mobile",
    ...
});</pre>
            </li>
            <li>
                <b>embedded</b>，针对将文档嵌入到网页进行了优化:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "type": "embedded",
    ...
});</pre>
            </li>
        </ul>
        <p>您可以为移动设备使用任何外观或将文档嵌入到您的网页中，但使用特定的显示类型更符合逻辑。</p>
        <p>有关显示类型的更多信息，请参见 <a href="<%= Url.Action("config") %>#type">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="customizing_7">
    <dt>如何将插件连接到文档服务器以便所有编辑器用户都可以看到它们？</dt>
    <dd>
        <p>要为所有文档服务器用户启用插件，您需要参考以下内容：</p>
        <ul>
            <li>获取插件（这可以使用我们在 <a target="_blank" href="https://github.com/ONLYOFFICE/sdkjs-plugins">GitHub</a> 上的插件存储库来完成，或者您可以编写自己的插件）。</li>
            <li>将插件放到文档编辑器可访问的文件夹中。</li>
            <li>通过以下方式更改配置文件：</li>
        </ul>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "plugins": {
             "autostart": [
                 "asc.{0616AE85-5DBE-4B6B-A0A9-455C4F1503AD}",
                 "asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}",
                 ...
             ],
             "pluginsData": [
                 "https://example.com/plugin1/config.json",
                 "https://example.com/plugin2/config.json",
                 ...
             ]
        },
        ...
    },
    ...
});</pre>
        <p>其中 <em>editorConfig.plugins.autostart</em> 是您希望在 文档服务器启动时自动启动的插件的 GUID 数组（在插件 <a href="<%= Url.Action("config", "plugin") %>#guid">config.json</a> 文件中定义）， <em>editorConfig.plugins.pluginsData</em> 是您希望文档服务器用户可以使用的所有插件的 <b>config.json</b> 配置文件数组。</p>
        <p>有关启用 文档服务器插件的更多信息，请参见 <a href="<%= Url.Action("config/editor/plugins") %>">此页面</a>。</p>
    </dd>
</dl>