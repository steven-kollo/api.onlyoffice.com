<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("wopi/restapi") %>"></a>
    <span class="hdr">检查文件信息</span>
</h1>

    <div class="header-gray"><b>GET /wopi/files/<i>(file_id)</i></b></div>
    <p class="dscr">返回有关文件属性、访问权限和编辑器设置的信息。</p>

    <div class="header-gray">参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>file_id</td>
                <td>必须是 URL 安全的文件 ID。</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">查询参数</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>access_token</td>
                <td>访问令牌主机将用它来确定请求是否被授权。</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">请求标头</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>名称</td>
                <td>描述</td>
                <td>类型</td>
                <td>出现</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>X-WOPI-SessionContext</td>
                <td>会话上下文（如果在初始 WOPI 操作 URL 上提供）。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">必需的响应属性</div>
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
                <td id="BaseFileName" class="copy-link">BaseFileName</td>
                <td>不带路径的文件名，显示在用户界面 (UI) 中并确定文件扩展名。</td>
                <td>string</td>
                <td>"Example File Name.docx"</td>
            </tr>
            <tr>
                <td id="Version" class="copy-link">Version</td>
                <td>The current version of the file based on the server file version schema. Every time the document is edited and saved, the version must be changed.
                The version values must never repeat for a given file.</td>
                <td>string</td>
                <td>"Khirz6zTPdfd7"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">面包屑导航属性</div>
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
                <td id="BreadcrumbBrandName" class="copy-link">BreadcrumbBrandName</td>
                <td>WOPI 客户端向用户显示的名称，用于指示 WOPI 服务器的品牌名称。</td>
                <td>string</td>
                <td>"Example Brand Name"</td>
            </tr>
            <tr>
                <td id="BreadcrumbBrandUrl" class="copy-link">BreadcrumbBrandUrl</td>
                <td>当用户单击显示 <a href="#BreadcrumbBrandName">BreadcrumbBrandName</a>的 UI 时，WOPI 客户端导航到的网页的 URL。</td>
                <td>string</td>
                <td>"https://example.com/url-to-breadcrumb-brand-page.com"</td>
            </tr>
            <tr>
                <td id="BreadcrumbDocName" class="copy-link">BreadcrumbDocName</td>
                <td>WOPI 客户端向用户显示的文件名。如果未指定此参数，则使用 <a href="#BaseFileName">BaseFileName</a> 参数。</td>
                <td>string</td>
                <td>"Example Breadcrumb File Name.docx"</td>
            </tr>
            <tr>
                <td id="BreadcrumbFolderName" class="copy-link">BreadcrumbFolderName</td>
                <td>WOPI 客户端向用户显示的名称，指示文件所在的文件夹的名称。</td>
                <td>string</td>
                <td>"Example Folder Name"</td>
            </tr>
            <tr>
                <td id="BreadcrumbFolderUrl" class="copy-link">BreadcrumbFolderUrl</td>
                <td>当用户单击显示 <a href="#BreadcrumbFolderName">BreadcrumbFolderName</a>的 UI 时，WOPI 客户端导航到的网页的 URL。</td>
                <td>string</td>
                <td>"https://example.com/url-to-breadcrumb-brand-folder"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">PostMessage 属性</div>
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
                <td id="ClosePostMessage" class="copy-link">ClosePostMessage</td>
                <td>指定如果用户关闭当前使用此文件的正在渲染或编辑的客户端，WOPI客户端是否应通知WOPI服务器。
                    当online office的 <em>Close</em> UI 被激活时，主机期望收到 <a href="<%= Url.Action("wopi/postmessage") %>#UI_Close">UI_Close</a> PostMessage。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="EditModePostMessage" class="copy-link">EditModePostMessage</td>
                <td>指定如果用户尝试编辑文件，WOPI 客户端是否应通知 WOPI 服务器。
                    当online office的 <em>Edit</em> UI被激活时，主机期望收到 <a href="<%= Url.Action("wopi/postmessage") %>#UI_Edit">UI_Edit</a> PostMessage。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="EditNotificationPostMessage" class="copy-link">EditNotificationPostMessage</td>
                <td>指定如果用户尝试编辑文件，WOPI 客户端是否应通知 WOPI 服务器。
                    主机希望收到 <a href="<%= Url.Action("wopi/postmessage") %>#Edit_Notification">Edit_Notification</a> PostMessage。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="FileSharingPostMessage" class="copy-link">FileSharingPostMessage</td>
                <td>指定如果用户尝试共享文件，WOPI 客户端是否应通知 WOPI 服务器。
                    当online office中的 <em>Share</em> UI 被激活时，主机期望收到 <a href="<%= Url.Action("wopi/postmessage") %>#UI_Sharing">UI_Sharing</a> PostMessage。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="FileVersionPostMessage" class="copy-link">FileVersionPostMessage</td>
                <td>指定如果用户尝试导航到以前的文件版本，WOPI 客户端是否将通知 WOPI 服务器。
                    当online office中的 <em>Previous Versions</em> UI 被激活时，主机期望收到 <a href="<%= Url.Action("wopi/postmessage") %>#UI_FileVersions">UI_FileVersions</a> PostMessage。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="PostMessageOrigin" class="copy-link">PostMessageOrigin</td>
                <td>WOPI 客户端在发送消息时必须使用的域作为 <a href="<%= Url.Action("wopi/postmessage") %>#targetOrigin">targetOrigin</a> 参数，如 <a href="https://html.spec.whatwg.org/multipage/web-messaging.html#posting-messages" target="_blank">[W3C-HTML5WEBMSG]</a>中所述。</td>
                <td>string</td>
                <td>"https://exampledomain.com"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">文件 URL 属性</div>
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
                <td id="CloseUrl" class="copy-link">CloseUrl</td>
                <td>当用户关闭当前使用此文件的正在渲染或编辑的客户端时，实现者认为对用户有用的网页的URL。</td>
                <td>string</td>
                <td>"https://example.com/url-to-close-page.com"</td>
            </tr>
            <tr>
                <td id="FileSharingUrl" class="copy-link">FileSharingUrl</td>
                <td>允许用户共享文件的位置的 URL。</td>
                <td>string</td>
                <td>"https://example.com/url-to-sharing-page.com"</td>
            </tr>
            <tr>
                <td id="FileVersionUrl" class="copy-link">FileVersionUrl</td>
                <td>允许用户查看先前文件版本的位置的 URL。</td>
                <td>string</td>
                <td>"https://example.com/url-to-previous-version-page.com"</td>
            </tr>
            <tr>
                <td id="HostEditUrl" class="copy-link">HostEditUrl</td>
                <td>可以使用 WOPI 客户端编辑文件的网页的 URL。</td>
                <td>string</td>
                <td>"https://example.com/url-to-host-page.com"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">其他杂项属性</div>
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
                <td id="DisablePrint" class="copy-link">DisablePrint</td>
                <td>指定 WOPI 客户端是否必须禁用其控制下的任何打印功能。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="FileExtension" class="copy-link">FileExtension</td>
                <td>必须以"."开头的文件扩展名。</td>
                <td>string</td>
                <td>".docx"</td>
            </tr>
            <tr>
                <td id="FileNameMaxLength" class="copy-link">FileNameMaxLength</td>
                <td>WOPI服务器支持的文件名的最大长度，包括文件扩展名。</td>
                <td>integer</td>
                <td>20</td>
            </tr>
            <tr>
                <td id="LastModifiedTime" class="copy-link">LastModifiedTime</td>
                <td>The last time when the file was modified. This time must always be a UTC time, and must be formatted in ISO 8601 round-trip format.
                This property can be specified as an alternative to the <a href="#Version">Version</a> property.</td>
                <td>string</td>
                <td>"2009-06-15T13:45:30.0000000Z"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">用户元数据属性</div>
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
                <td id="IsAnonymousUser" class="copy-link">IsAnonymousUser</td>
                <td>指定用户是否匿名。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserFriendlyName" class="copy-link">UserFriendlyName</td>
                <td>一个用户名。如果未定义，则 WOPI 客户端可能被配置为在某些情况下使用占位符字符串，或者根本不显示名称。</td>
                <td>string</td>
                <td>"John Smith"</td>
            </tr>
            <tr>
                <td id="UserId" class="copy-link">UserId</td>
                <td>由 WOPI 服务器指定的唯一用户标识符。</td>
                <td>string</td>
                <td>"uid-1"</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">用户权限属性</div>
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
                <td id="ReadOnly" class="copy-link">ReadOnly</td>
                <td>指定当前用户是否不能更改文件。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserCanRename" class="copy-link">UserCanRename</td>
                <td>指定用户是否有权重命名文件。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserCanReview" class="copy-link">UserCanReview</td>
                <td>指定用户是否有权审阅文件。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="UserCanWrite" class="copy-link">UserCanWrite</td>
                <td>指定用户是否有权编辑文件。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">WOPI 主机功能属性</div>
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
                <td id="SupportsRename" class="copy-link">SupportsRename</td>
                <td>指定 WOPI 服务器是否支持重命名权限。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr>
                <td id="SupportsReviewing" class="copy-link">SupportsReviewing</td>
                <td>指定 WOPI 服务器是否支持审阅权限。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Nextcloud/Collabora/Seafile properties</div>
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
                <td id="HidePrintOption" class="copy-link">HidePrintOption</td>
                <td>指定 WOPI 服务器是否从 UI 的文件菜单栏中隐藏打印选项。</td>
                <td>boolean</td>
                <td>false</td>
            </tr>
        </tbody>
    </table>
