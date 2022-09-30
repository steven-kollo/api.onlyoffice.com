<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        使用WOPI</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="wopi_1">
    <dt>如何启用WOPI？</dt>
    <dd>
        <p>要启用 WOPI，请将Document Server 配置中的 <em>wopi.enable</em> 参数设置为 <b>true</b>。</p>
        <div class="header-gray">参数</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>名称</td>
                    <td>描述</td>
                    <td>类型</td>
                    <td>示例</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>wopi.enable</td>
                    <td>定义是否启用 WOPI。默认值为 <b>false</b>。</td>
                    <td>boolean</td>
                    <td>true</td>
                </tr>
            </tbody>
        </table>

        <div class="header-gray">示例</div>
        <pre>
{
    "wopi": {
        "enable": true
    }
}
</pre>
    </dd>
</dl>
<dl class="faq_block" id="wopi_2">
    <dt>如何将文档服务器配置为仅接受来自受信任的集成商的 WOPI 请求？</dt>
    <dd>
        <p>此类可信集成商的 IP 地址必须包含在 <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/build-test-ship/settings#wopi-domain-allow-list" target="_blank">WOPI 域允许列表</a>中。
        同时，必须拒绝所有其他集成商的访问。</p>
        <p>按照 <a href="<%= Url.Action("wopi/") %>#ip-filter">此章节中</a> 的步骤配置文件服务器 IP 过滤器。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_3">
    <dt>为什么我需要discovery XML 以及如何获取它？</dt>
    <dd>
        <p><a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/discovery" target="_blank">WOPI 发现</a> 是通过从在线办公室请求discovery XML 来帮助 WOPI 服务器发现 WOPI 客户端的过程。
            WOPI 主机使用discovery XML 来指定如何与在线办公室进行交互。discovery XML的 <b>action</b> 元素表示：</p>
        <ul>
            <li>在线办公室中可用的文档操作，</li>
            <li>支持的文件格式（扩展名）。</li>
        </ul>
        <p>请求被发送到 <span class="fakelink">https://documentserver/hosting/discovery</span> 地址，其中 <b>documentserver</b> 是安装了 ONLYOFFICE Docs 的服务器的名称。</p>
        <p>有关 WOPI discovery的更多信息，请参见 <a href="<%= Url.Action("wopi/discovery") %>">此处</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_4">
    <dt>如何通过 WOPI 自定义编辑器行为？</dt>
    <dd>
        <p>每个 WOPI 发现操作都有两个属性：</p>
        <div class="header-gray">属性</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>名称</td>
                    <td>描述</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>requires</td>
                    <td>使用操作所需的 WOPI REST 端点。</td>
                </tr>
                <tr>
                    <td>urlsrc</td>
                    <td>为了对特定文件调用操作而导航到的 URL。</td>
                </tr>
            </tbody>
        </table>

        <div class="header-gray">示例</div>
        <pre>
&lt;action name="edit" ext="docx" requires="locks,update"
    urlsrc="https://word-edit.officeapps.live.com/we/wordeditorframe.aspx?
ui=en-us&thm=1&"/&gt;
</pre>
        <p>语言、主题或聊天等编辑器行为可以通过 <b>发现查询参数</b> 进行自定义，
        这些参数是可以通过文件存储在 <em>urlsrc</em> 属性中公开的参数。</p>
        <p>所有可用的发现查询参数都可以在 <a href="<%= Url.Action("wopi/discovery") %>#wopi-standart">这里</a>找到。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_5">
    <dt>如何在应用程序中创建在线办公会话？</dt>
    <dd>
        <p>为了在您的应用程序中创建在线办公会话，主机必须创建一个 HTML 页面，
    该页面将在其中托管一个指向特定 <a href="<%= Url.Action("wopi/discovery") %>#actions">WOPI 操作 URL</a>的 iframe 元素。</p>

        <p>主机页面必须包含以下元素：</p>
        <ul>
            <li>出于安全目的，主机必须通过该 <em>form</em> 元素将 <em>access_token</em> 和 <em>access_token_ttl</em> 参数 <em>POST</em> 到在线办公室 iframe。</li>
            <li>使用 <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>与在线办公室 iframe 交互的 JavaScript 代码。</li>
            <li>body元素和在线office的特定 CSS 样式，以避免视觉包。此外，
            主机页面应使用 <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>中提供的网站图标 URL 为页面设置适当的网站图标。</li>
            <li>用于避免移动端浏览器的视觉和功能问题的 <em>viewport</em> 元标签。</li>
        </ul>
        <p>可以在 <a href="<%= Url.Action("wopi/hostpage") %>">此页面</a>上找到主机页面代码的示例。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_6">
    <dt>如何通过 WOPI 限制公众对数据的访问？</dt>
    <dd>
        <p>要限制公众访问您的数据，必须配置在线办公室和集成商之间的安全请求交换。</p>

        <p>集成商必须检查是否从 ONLYOFFICE Docs 收到请求。它为此目的使用 <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/scenarios/proofkeys" target="_blank">证明密钥</a>。
        文档服务器使用私钥对请求进行签名。相应的公钥写在 <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery XML</a>的 proof-key 元素中。
        集成商使用公钥检查私钥。签名随 <b>X-WOPI-Proof</b> 和 <b>X-WOPI-ProofOld</b> HTTP 标头中的每个请求一起发送。</p>
        <p>有关证明密钥的更多信息，请参见 <a href="<%= Url.Action("wopi/proofkeys") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_7">
    <dt>我在哪里可以找到可能的 WOPI 错误代码及其描述？</dt>
    <dd>
        <p>您可以在 <a href="<%= Url.Action("wopi/restapi") %>">此页面</a>上找到可能的 WOPI 错误代码及其描述。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_8">
    <dt>ONLYOFFICE Docs 支持哪些 WOPI REST API 操作？</dt>
    <dd>
        <p>ONLYOFFICE Docs 使用以下 WOPI 操作：<a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">CheckFileInfo</a>,
        <a href="<%= Url.Action("wopi/restapi/getfile") %>">GetFile</a>, <a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a>,
        <a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a>, <a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a>,
        <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a>, <a href="<%= Url.Action("wopi/restapi/renamefile") %>">RenameFile</a>。
        有关这些操作的更多信息，请参见相应页面。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_9">
    <dt>如何通过WOPI限制访问ONLYOFFICE服务器的使用？</dt>
    <dd>
        <p>您不能通过 WOPI 限制对 ONLYOFFICE 服务器的使用。编辑访问控制只能通过 ONLYOFFICE Docs API 并基于 JWT 签名。
        生成 <a href="<%= Url.Action("signature/browser") %>">文件打开请求</a>需要密钥。</p>
        <p>更多关于签名的信息可以在 <a href="<%= Url.Action("signature") %>">这里</a>找到。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_10">
    <dt>如何通过 WOPI 获取有关文件属性、访问权限和编辑器设置的信息？</dt>
    <dd>
        <p>要获取有关文件属性、访问权限和编辑器设置的信息，请使用 <b>CheckFileInfo</b> 方法。
        您可以在 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">此页面</a>上找到所有可用参数。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_11">
    <dt>WOPI 支持哪些操作？</dt>
    <dd>
        <p>除了查看、编辑和共同编辑的基本操作，您还可以关闭编辑器，从查看切换到编辑模式，重命名文件，
        打开共享访问设置对话框，打开文档版本历史记录，插入存储中的图像。</p>
        <p>在 <a href="<%= Url.Action("wopi/postmessage") %>">此页面</a>上了解有关其他通过事件处理的操作的更多信息。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_12">
    <dt>我可以通过 WOPI 对文档设置哪些访问权限？</dt>
    <dd>
        <p>您可以设置查看、编辑、重命名、审阅和打印的访问权限。</p>
        <p>在 <a href="<%= Url.Action("wopi/postmessage") %>">此页面</a>上了解有关访问权限的更多信息。</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_13">
    <dt>ONLYOFFICE Docs API 和 WOPI 有什么区别？</dt>
    <dd>
        <p>您可以使用 API 或 WOPI 将 <a href="https://www.onlyoffice.com/zh/office-suite.aspx" target="_blank">ONLYOFFICE Docs</a> 与任何云服务集成。</p>
        <p><a href="<%= Url.Action("wopi/apivswopi") %>">此页面上</a> 的表格将帮助您找出这些选项之间的区别。</p>
    </dd>
</dl>
