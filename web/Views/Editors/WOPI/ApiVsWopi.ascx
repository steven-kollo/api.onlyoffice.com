<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE 文档 API 与 WOPI</span>
</h1>

    <p class="dscr">您可以使用 API 或 WOPI 将 <a href="https://www.onlyoffice.com/zh/office-suite.aspx" target="_blank">ONLYOFFICE Docs</a> 与任何云服务集成。</p>
    <p>下表将帮助您找出这些选项之间的区别。</p>

    <table class="table">
        <colgroup>
            <col />
            <col style="width: 300px;" />
            <col style="width: 290px;" />
        </colgroup>
        <thead style="background-color: #ebebeb">
            <tr class="tablerow">
                <td class="borders"></td>
                <td style="text-align: center" class="borders"><h2>API</h2></td>
                <td style="text-align: center" class="borders"><h2>WOPI</h2></td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="general-info" class="table-header-gray borders copy-link table-style"><h2>基本信息</h2></td>
                <td class="borders">
                    <p>应用程序编程接口：描述允许您与不同的 ONLYOFFICE 组件（包括编辑器）交互的主要方法，
                        从而使您能够以编程方式访问它。</p>
                    <p><a href="<%= Url.Action("basic") %>">了解更多</a></p>
                </td>
                <td class="borders">
                    <p>Web 应用程序开放平台接口：Microsoft 的基于 REST 的协议，它定义了一组操作，
                        使客户端能够访问和更改服务器存储的文件。</p>
                    <p><a href="<%= Url.Action("wopi/") %>">了解更多</a></p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="integration" class="table-header-gray borders copy-link table-style"><h2>与 sync&share 和 DMS 解决方案集成</h2></td>
                <td class="borders">
                    <p>通过 ONLYOFFICE 或其合作伙伴开发的即用型连接器进行集成。</p>
                    <p><a href="https://www.onlyoffice.com/zh/all-connectors.aspx" target="_blank">检查所有集成</a></p>
                </td>
                <td class="borders">
                    <p>通过 WOPI 连接器/通用 WOPI 客户端集成。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="collaboration" class="table-header-gray borders copy-link table-style"><h2>协作（模式）</h2></td>
                <td class="borders">
                    <p>在实时和段落锁定共同编辑模式之间切换。</p>
                </td>
                <td class="borders">
                    <p>只有实时协同编辑，模式之间的切换在界面中是不可用的。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="customization" class="table-header-gray borders copy-link table-style"><h2>定制</h2></td>
                <td class="borders">
                    <ul>
                        <li>指定编辑器界面 <a href="<%= Url.Action("config/editor") %>#lang">语言</a></li>
                        <li>指定编辑器界面 <a href="<%= Url.Action("config/editor/customization") %>#uiTheme">主题</a></li>
                        <li>通过 <b>聊天</b> 菜单按钮禁用 <a href="<%= Url.Action("config/editor/customization") %>#chat">聊天</a> 功能</li>
                        <li>在编辑器 <b>关于</b> 部分中显示 <a href="<%= Url.Action("config/editor/customization") %>#customer">客户</a> 信息</li>
                        <li>编辑器 <a href="<%= Url.Action("config/editor/customization") %>">定制</a>
                        可通过用于控制工具栏外观和隐藏它们的参数、品牌</li>
                        <li>传递 <a href="<%= Url.Action("config/editor") %>#templates">模板</a> 以创建新文件</li>
                        <li>传递 <a href="<%= Url.Action("config/editor") %>#recent">最近打开的文件</a>列表</li>
                        <li>连接 <a href="<%= Url.Action("config/editor/plugins") %>">插件</a></li>
                    </ul>
                </td>
                <td class="borders">
                    <ul>
                        <li>指定编辑器界面 <a href="<%= Url.Action("wopi/discovery") %>#ui">语言</a></li>
                        <li>指定编辑器界面 <a href="<%= Url.Action("wopi/discovery") %>#thm">主题</a></li>
                        <li>通过 <b>聊天</b> 菜单按钮禁用 <a href="<%= Url.Action("wopi/discovery") %>#dchat">聊天</a> 功能</li>
                        <li>在编辑器 <b>关于</b> 部分中显示 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#BreadcrumbBrandUrl">客户</a> 信息</li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="denying-requests" class="table-header-gray borders copy-link table-style"><h2>拒绝资源请求</h2></td>
                <td class="borders">
                    <p>配置请求 ONLYOFFICE Docs 可以接受的 <a href="<%= Url.Action("wopi/") %>#ip-filter">可信集成商</a> 的 IP（白名单）。</p>
                </td>
                <td class="borders">
                    <p>配置请求 ONLYOFFICE Docs 可以接受的 <a href="<%= Url.Action("wopi/") %>#ip-filter">可信集成商</a> 的 IP（白名单）。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="access-to-server" class="table-header-gray borders copy-link table-style"><h2>限制访问使用 ONLYOFFICE 服务器</h2></td>
                <td class="borders">
                    <p>编辑访问控制是基于 JWT 签名的。生成 <a href="<%= Url.Action("signature/browser") %>">文件打开请求</a>需要密钥。</p>
                </td>
                <td class="borders">
                    <p>没有限制</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="access-to-data" class="table-header-gray borders copy-link table-style"><h2>限制对数据的访问</h2></td>
                <td class="borders">
                    <p>ONLYOFFICE 服务器的请求验证是基于 JWT 签名的。
                        该请求使用密钥进行 <a href="<%= Url.Action("signature/request") %>#callbackUrl">签名</a>，
                        这样可以确保它不被第三方执行。</p>
                </td>
                <td class="borders">
                    <p>来自 ONLYOFFICE 服务器的请求验证是基于签名请求的私钥和写在
                    <a href="<%= Url.Action("wopi/discovery") %>">LWOPI 发现 XML中</a>的
                    <a href="<%= Url.Action("wopi/proofkeys") %>">proof-key</a> 元素中的公钥的。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="basic-actions" class="table-header-gray borders copy-link table-style"><h2>基本操作</h2></td>
                <td class="borders">
                    <p>支持查看、编辑、协同编辑、移动查看编辑、嵌入式文档查看等基本动作。</p>
                </td>
                <td class="borders">
                    <p>支持查看、编辑和共同编辑的基本操作。</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="methods" class="table-header-gray borders copy-link table-style"><h2>通过方法调用的附加操作</h2></td>
                <td class="borders">
                    <ul>
                        <li>以不同格式<a href="<%= Url.Action("methods") %>#downloadAs">下载</a> 请求</li>
                        <li>设置 <a href="<%= Url.Action("methods") %>#setFavorite">收藏夹</a> 状态</li>
                        <li>显示带有 <a href="<%= Url.Action("methods") %>#showMessage">消息</a>的工具提示</li>
                    </ul>
                </td>
                <td class="borders">
                    <p>没有附加的操作</p>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="events" class="table-header-gray borders copy-link table-style"><h2>通过事件处理的附加操作</h2></td>
                <td class="borders">
                    <ul>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestClose">关闭</a> 编辑器</li>
                        <li><a href="<%= Url.Action("config/editor/customization") %>#goback">转到</a> 文件夹</li>
                        <li>从查看模式<a href="<%= Url.Action("config/events") %>#onRequestEditRights">切换</a> 到编辑模式</li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestRename">重命名</a> 文件</li>
                        <li>打开 <a href="<%= Url.Action("config/events") %>#onRequestSharingSettings">共享访问</a> 设置对话框</li>
                        <li>打开文档 <a href="<%= Url.Action("config/events") %>#onRequestHistory">版本历史</a></li>
                        <li>从存储中<a href="<%= Url.Action("config/events") %>#onRequestInsertImage">插入图像</a></li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestMailMergeRecipients">邮件合并</a></li>
                        <li>与存储的文档进行<a href="<%= Url.Action("config/events") %>#onRequestCompareFile">比较</a></li>
                        <li>获取 <a href="<%= Url.Action("config/events") %>#onMakeActionLink">操作链接</a></li>
                        <li>请求以其他格式 <a href="<%= Url.Action("config/events") %>#onRequestSaveAs">保存</a> 文件</li>
                        <li>获取要 <a href="<%= Url.Action("config/events") %>#onRequestUsers">提及</a>的用户列表</li>
                        <li><a href="<%= Url.Action("config/events") %>#onRequestCreateNew">创建</a> 一个新文件</li>
                    </ul>
                </td>
                <td class="borders">
                    <ul>
                        <li><a href="<%= Url.Action("wopi/postmessage") %>#UI_Close">关闭</a> 编辑器</li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#BreadcrumbFolderUrl">转到</a> 文件夹</li>
                        <li>从查看模式<a href="<%= Url.Action("wopi/postmessage") %>#UI_Edit">切换</a> 到编辑模式</li>
                        <li><a href="<%= Url.Action("wopi/postmessage") %>#File_Rename">重命名</a> 文件</li>
                        <li>打开 <a href="<%= Url.Action("wopi/postmessage") %>#UI_Sharing">共享访问</a> 设置对话框</li>
                        <li>打开文档 <a href="<%= Url.Action("wopi/postmessage") %>#UI_FileVersions">版本历史</a></li>
                        <li>从存储中<a href="<%= Url.Action("wopi/postmessage") %>#UI_InsertGraphic">插入图像</a></li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="file-lock" class="table-header-gray borders copy-link table-style"><h2>文件锁</h2></td>
                <td class="borders">
                    <p>获取带有 <a href="<%= Url.Action("callback") %>#status">文档状态</a> 的消息，通知有关打开文件进行编辑、关闭未更改的文件或关闭编辑后准备保存的文件。</p>
                </td>
                <td class="borders">
                    <ul>
                        <li>由请求锁定的online office<a href="<%= Url.Action("wopi/restapi/lock") %>">锁定</a> 文件编辑</li>
                        <li>通过将文件的自动到期计时器重置为 30 分钟来<a href="<%= Url.Action("wopi/restapi/refreshlock") %>">刷新文件的锁定</a> </li>
                        <li>允许 <a href="<%= Url.Action("wopi/restapi/unlock") %>">文件编辑</a></li>
                    </ul>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="file-access-rights" class="table-header-gray borders copy-link table-style"><h2>文件访问权限
</h2></td>
                <td class="borders">
                    <ul>
                        <li>查看</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#edit">编辑</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#review">审阅</a> （仅适用于文本文档）</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#comment">评论</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#fillForms">填写表单</a> （仅适用于表单）</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#modifyContentControl">修改内容控件</a> （仅适用于文本文档）</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#modifyFilter">修改过滤器</a> （仅适用于电子表格）</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#copy">复制</a> 到剪贴板</li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#download">下载</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#print">打印</a></li>
                        <li><a href="<%= Url.Action("config/document/permissions") %>#rename">重命名</a></li>
                    </ul>
                </td>
                <td class="borders">
                    <ul>
                        <li>查看</li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanWrite">编辑</a></li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanReview">审阅</a> （仅适用于文本文档）</li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HidePrintOption">打印</a></li>
                        <li><a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanRename">重命名</a></li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
