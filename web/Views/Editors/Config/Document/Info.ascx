<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">文档信息</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">文档信息部分允许更改文档的其他参数（文档所有者、存储文档的文件夹、上传日期、共享设置）。</p>

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
        <tr class="tablerow">
            <td id="author" class="copy-link">author</td>
            <td>
                定义文档作者/创建者的名称。
                自 5.4 版起已弃用，请改用 <a href="#owner">owner</a>。
            </td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr class="tablerow">
            <td id="created" class="copy-link">created</td>
            <td>
                定义文档创建日期。
                自 5.4 版起已弃用，请改用 <a href="#uploaded">uploaded</a>。
            </td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr>
            <td id="favorite" class="copy-link">favorite</td>
            <td>
                定义 <em>收藏</em> 图标的高亮状态。
                当用户单击图标时，将调用 <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> 事件。
                如果参数 <em>未定义</em>，则 <em>收藏</em> 图标不会显示在编辑器窗口标题处。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img width="832px" src="<%= Url.Content("~/content/img/editor/favorite.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="folder" class="copy-link">folder</td>
            <td>定义存储文档的文件夹（如果文档存储在根文件夹中，则可以为空）。</td>
            <td>string</td>
            <td>"Example Files"</td>
        </tr>
        <tr class="tablerow">
            <td id="owner" class="copy-link">owner</td>
            <td>定义文档所有者/创建者的名称。</td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr>
            <td id="sharingSettings" class="copy-link">sharingSettings</td>
            <td>显示有关允许与其他用户共享文档的设置的信息：
                <ul>
                    <li>
                        <b>isLink</b> - 将用户图标更改为链接图标，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：false；
                    </li>
                    <li>
                        <b>permissions</b> - 具有上述名称的用户的访问权限。
                        可以是 <b>完全访问</b>、 <b>只读</b> 或 <b>拒绝访问</b>,
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>：完全访问；
                    </li>
                    <li>
                        <b>user</b> - 文档将与之共享的用户的名称，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："John Smith"。
                    </li>
                </ul>
            </td>
            <td>object数组</td>
            <td>[
    {
        "permissions": "Full Access",
        "user": "John Smith"
    }
]</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/sharing_settings.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="uploaded" class="copy-link">uploaded</td>
            <td>定义文档上传日期。</td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/info.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": {
            "favorite": true,
            "folder": "Example Files",
            "owner": "John Smith",
            "sharingSettings": [
                {
                    "permissions": "Full Access",
                    "user": "John Smith"
                },
                {
                    "isLink": true,
                    "permissions": "Read Only",
                    "user": "External link"
                },
                ...
            ],
            "uploaded": "2010-07-07 3:46 PM"
        },
        ...
    },
    ...
});
</pre>
