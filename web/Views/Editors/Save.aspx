<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    保存文件
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">保存文件</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE 文档服务器中保存文档的过程。</p>
    <img alt="打开文件" src="<%= Url.Content("~/content/img/editor/saving.jpg") %>" />
    <ol>
        <li>用户在 <b>文档编辑器</b>中编辑文档。</li>
        <li><b>文档编辑器</b> 将更改发送到 <b>文档编辑服务</b>。</li>
        <li>用户关闭 <b>文档编辑器</b>。</li>
        <li><b>文档编辑服务</b> 监视文档工作的结束，并将 <b>文档编辑器</b> 发送的更改收集到一个文档中。</li>
        <li>
            <b>文档编辑服务</b> 使用来自 <a href="<%= Url.Action("basic") %>">JavaScript API</a> 的 <em>callbackUrl</em> 通知 <b>文档存储服务</b> 文档编辑结束，并返回修改后文档的链接。
            <div class="note">
                请注意，从 5.5 版本开始，根据请求的 <a href="<%= Url.Action("callback") %>#status">status</a> 选择 <a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>。
                从 4.4 到 5.5 版本， <em>callbackUrl</em> 是从最后一个加入共同编辑的用户开始使用的。
                在 4.4 之前的版本中，在共同编辑时， <em>callbackUrl</em> 来自第一次打开文件进行编辑的用户。
            </div>
        </li>
        <li><b>文档存储服务</b> 从 <b>文档编辑服务</b> 下载所有已保存更改的文档文件并将其存储。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
    <ol>
        <li>创建一个 <a href="<%= Url.Action("callback") %>">回调处理程序</a> 以保存来自 <b>文档编辑服务</b>的文档。</li>
        <li>创建一个 <em>html</em> 文件来 <a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
        <li>在文档编辑器初始化的配置脚本中，使用 <a href="<%= Url.Action("config/editor") %>#callbackUrl">参数行</a>中的 <em>回调处理程序</em> 指定文件的 URL。
            <pre>
new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    },
    "documentType": "word",
    "editorConfig": {
        "callbackUrl": "https://example.com/url-to-callback.ashx"
    }
});
</pre>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        </li>
        <li>在浏览器中打开您的 <em>html</em> 文件并编辑您的文档。</li>
        <li>
            关闭 <b>文档编辑器</b>。
            在大约 10 秒内查看您的文档。
            所有更改应该都被保存了，这意味着配置正确。
        </li>
    </ol>


    <h2 id="savedelay" class="copy-link">保存延迟</h2>
    <p>
        文档编辑完成后， <b>文档编辑服务</b> 会将它通知给 <b>文档存储服务</b>。
        完成之前的时间是根据编辑文件到 Office Open XML 格式的转换时间（取决于文件大小、复杂性和计算机能力，并且可以执行相当长的时间）和转换开始延迟来计算时间（默认为 5 秒）。
        在最常见的情况下，编辑完成后的时间约为 10 秒。
    </p>
    <p>
        转换开始延迟对于允许在不保存文件的情况下返回文件编辑会话是必要的，例如在打开文件进行编辑的情况下重新加载浏览器页面时。
        The default conversion start delay time is defined with the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-savetimeoutdelay" target="_blank">services.CoAuthoring.server.savetimeoutdelay</a> parameter in <b>Document Server</b> configuration file, which can be found at the following path:
    </p>
    <div>对于 Linux - <em>/etc/onlyoffice/documentserver/<b>default.json</b></em>。</div>
    <div>对于 Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>default.json</b></em>。</div>
    <p>
        如果要更改它，可以使用 <em>local.json</em> 文件，该文件应存储所有已编辑的参数。
        此文件与 <em>default.json</em> 文件位于同一目录中，并且 <b>必须保留</b> 必要参数的 <b>完整对象结构</b> （请参见下面的示例）。
    </p>
    <div class="note">
        请不要直接编辑 <em>default.json</em> 文件的内容。
        每次重新启动 Docker 容器或将 <b>文件服务器</b> 升级到新版本时都会恢复默认值，并且所有更改都将丢失。
    </div>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col style="width: 310px;" />
            <col />
            <col style="width: 100px;" />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>参数</td>
                <td>描述</td>
                <td>类型</td>
                <td>示例</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>services.CoAuthoring.server.savetimeoutdelay</td>
                <td>Defines the conversion start delay time (measured in milliseconds) after the edited file is closed.</td>
                <td>integer</td>
                <td>5000</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">示例 local.json 配置</div>
    <pre>
{
    "services": {
        "CoAuthoring": {
            "server": {
                "savetimeoutdelay": 5000
            }
        }
    }
}
</pre>


    <h2 id="forcesave" class="copy-link">强制保存</h2>

    <p>
        <b>文档编辑服务</b> 允许在编辑完成之前获取当前文档状态。
        该过程在 ONLYOFFICE 文档服务器中称为 <em>forcesave</em>。
        当 forcesave 启动时， <b>文档编辑服务</b> 向 <a href="<%= Url.Action("callback") %>">回调处理程序</a> 执行请求( <em>url</em> 参数的值为文档链接， <em>status</em> 参数的值为 <b>6</b>)。
        可以通过以下方式启动forcesave过程：
    </p>
    <ul>
        <li>通过将 <em>c</em> 参数的值设置为 <a href="<%= Url.Action("command/forcesave") %>">forcesave</a>，向 <a href="<%= Url.Action("command") %>">文档命令服务</a> 发送请求。
            将请求发送到 <b>回调处理程序</b> 时， <em>forcesavetype</em> 参数的值为 <b>0</b>。</li>
        <li>启用 <a href="<%= Url.Action("config/editor/customization") %>#forcesave">editorConfig.customization.forcesave</a> 模式，在编辑器初始化配置中将其设置为 <b>true</b>。
            在这种情况下，每次用户点击 <b>保存</b> 按钮时，forcesave 都会完成，并且当将请求发送到 <b>回调处理程序</b> 时， <em>forcesavetype</em> 参数的值为 <b>1</b>。</li>
        <li>You can enable <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#AutoAssembly" target="_blank">the repeating forcesave start</a> in the <b>Document Server</b> additional configuration file, which can be either found at (in case you have already created it) or placed to the following path:
            <div>对于 Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>。</div>
            <div>对于 Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>。</div>

            <div class="header-gray">参数</div>

            <table class="table">
                <colgroup>
                    <col style="width: 300px;" />
                    <col />
                    <col style="width: 100px;" />
                    <col style="width: 100px;" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>参数</td>
                        <td>描述</td>
                        <td>类型</td>
                        <td>示例</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>services.CoAuthoring.autoAssembly.enable</td>
                        <td>
                            Defines if the automatic forcesaving is enabled or not.
                            默认值为 <b>false</b>。
                        </td>
                        <td>boolean</td>
                        <td>false</td>
                    </tr>
                    <tr class="tablerow">
                        <td>services.CoAuthoring.autoAssembly.interval</td>
                        <td>Defines the interval time in minutes for initiating the automatic forcesaving.</td>
                        <td>string</td>
                        <td>5m</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>

            <div class="header-gray">示例 local.json 配置</div>
            <pre>
{
    "services": {
        "CoAuthoring": {
            "autoAssembly": {
                "enable": true,
                "interval": "5m"
            }
        }
    }
}
</pre>
        将请求发送到 <b>回调处理程序</b> 时， <em>forcesavetype</em> 参数的值为 <b>2</b>。</li>
    </ul>
    <note>Please note that you cannot see the document versions created with the force saving option in the document history.
        The reason is that ONLYOFFICE Docs <a href="<%= Url.Action("history") %>#apply-changes">highlights the changes</a> made from the beginning of the current document session, not from the beginning of the document version.
        And even if several document versions are created during one session, all changes from this session will be highlighted.</note>


    <h2 id="assemblyFormatAsOrigin" class="copy-link">以原始格式保存</h2>

    <p>
        从版本 7.0 开始， <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-assemblyFormatAsOrigin" target="_blank">assemblyFormatAsOrigin</a> 服务器设置默认启用，以便将组装好的文件保存为其原始格式。
        它用于将文件格式从 OOXML 更改为 ODF 或使用宏保存文件。
    </p>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col style="width: 300px;" />
            <col />
            <col style="width: 100px;" />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>参数</td>
                <td>描述</td>
                <td>类型</td>
                <td>示例</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>services.CoAuthoring.server.assemblyFormatAsOrigin</td>
                <td>
                    指定组装好的文件是否以原始格式保存。
                    默认值为<b>true</b>。
                </td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">示例 local.json 配置</div>
    <pre>
{
    "services": {
        "CoAuthoring": {
            "server": {
                "assemblyFormatAsOrigin": true
            }
        }
    }
}
</pre>
    <note>
        请记住，此设置可能会使某些未经事先转换就打开文档的集成商崩溃（例如，无法在 ONLYOFFICE Docs中保存为 <em>.doc</em> 格式）。
        如有必要，禁用此设置。
    </note>

</asp:Content>
