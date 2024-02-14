<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1
    ><a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">编辑器配置</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">editorConfig 部分允许更改与编辑器界面有关的参数：打开模式（查看器或编辑器）、界面语言、附加按钮等）。</p>

<ul class="columns-4" style="list-style: none;">
    <li><a href="#actionLink">actionLink</a></li>
    <li><a href="#callbackUrl">callbackUrl</a></li>
    <li><a href="#coEditing">coEditing</a></li>
    <li><a href="#createUrl">createUrl</a></li>
    <li><a href="#lang">lang</a></li>
    <li><a href="#location">location</a></li>
    <li><a href="#mode">mode</a></li>
    <li><a href="#recent">recent</a></li>
    <li><a href="#region">region</a></li>
    <li><a href="#templates">templates</a></li>
    <li><a href="#user">user</a></li>
</ul>

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
            <td id="actionLink" class="copy-link">actionLink</td>
            <td>使用 <em>data.actionLink</em> 参数中的 <a href="<%= Url.Action("config/events") %>#onMakeActionLink">onMakeActionLink</a> 事件或 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件指定从 <b>文档编辑服务</b> 接收的数据，其中包含有关将滚动到的文档中的操作的信息。</td>
            <td>object</td>
            <td>ACTION_DATA</td>
        </tr>
        <tr class="tablerow">
            <td id="callbackUrl" class="copy-link">callbackUrl<a href="#requiredDescr" class="required">*</a></td>
            <td>指定 <b>文档存储服务</b> 的绝对 URL （必须由在自己的服务器上使用 ONLYOFFICE 文档服务器的软件集成商 <a href="<%= Url.Action("callback") %>">实现</a>）。</td>
            <td>string</td>
            <td>"https://example.com/url-to-callback.ashx"</td>
        </tr>
        <tr>
            <td id="coEditing" class="copy-link">coEditing</td>
            <td>
                定义共同编辑模式（<em>Fast</em> 或 <em>Strict</em>）以及更改它的可能性。
                该对象具有以下参数：
                <ul>
                    <li>
                        <b>mode</b> - 共同编辑模式（<em>fast</em> 或 <em>strict</em>）。 默认值为<b>fast</b>,
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："fast";
                    </li>
                    <li>
                        <b>change</b> - 定义是否可以在编辑器界面中更改共同编辑模式。 默认值为 <b>false</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true。
                    </li>
                </ul>
                <p>此参数用于应用<a href="<%= Url.Action("coedit") %>#modes">共同编辑</a>和<a href="<%= Url.Action("viewing") %>">查看</a>模式</p>
             </td>
            <td>object</td>
            <td>{
    "mode": "fast",
    "change": true
}</td>
        </tr>
        <tr class="tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改 <em>mode</em> 设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.coEditing.mode</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/coediting-mode.png") %>" width="832px" alt="" />
            </td>
        </tr>
        <tr>
            <td id="createUrl" class="copy-link">createUrl</td>
            <td>
                定义将在其中创建并在创建后可用的文档的绝对 URL。
                如果未指定，将没有创建按钮。
                您可以使用 <a href="<%= Url.Action("config/events") %>#onRequestCreateNew">onRequestCreateNew</a> 事件代替此字段。
            </td>
            <td>string</td>
            <td>"https://example.com/url-to-create-document/"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/create.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="lang" class="copy-link">lang</td>
            <td>
                定义编辑器界面语言（如果存在英语以外的其他语言）。
                使用两个字母（<b>de</b>、 <b>ru</b>、 <b>it</b>等）语言代码设置。
                默认值为 <b>"en"</b>。
            </td>
            <td>string</td>
            <td>"en"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，要将编辑器界面翻译为葡萄牙语（葡萄牙）或中文（繁体，台湾）
                （这些语言是在7.2版中添加的），您需要分别使用四个字母的语言代码-<b>pt-PT</b>或<b>zh-TW</b>。
                两个字母<b>pt</b>语言代码设置葡萄牙语（巴西），<b>zh</b>代码指定汉语（中华人民共和国）。</div>
            </td>
        </tr>
        <tr>
            <td id="location" class="copy-link">location</td>
            <td>
                定义默认测量单位。
                指定 <b>us</b> 或 <b>ca</b> 以设置英寸。
                默认值为 <b>""</b>。
            </td>
            <td>string</td>
            <td>""</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，设置 <b>us</b> 或 <b>ca</b> 值时，默认测量单位为英寸。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="mode" class="copy-link">mode</td>
            <td>
                定义编辑器打开模式。
                可以是 <b>view</b> 以打开文档进行查看，也可以是 <b>edit</b> 以在编辑模式下打开文档，从而允许对文档数据进行更改。
                默认值为 <b>"edit"</b>。
            </td>
            <td>string</td>
            <td>"edit"</td>
        </tr>
        <tr>
            <td id="recent" class="copy-link">recent</td>
            <td>在 <b>打开最近..</b> 菜单选项中定义文档存在或不存在，其中可以设置以下文档参数：
                <ul>
                    <li>
                        <b>folder</b> - 存储文档的文件夹（如果文档存储在根文件夹中，可以为空），
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："Example Files";
                    </li>
                    <li>
                        <b>title</b> - 将在 <b>Open Recent...</b> 菜单选项中显示的文档标题，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>：exampledocument1.docx；
                    </li>
                    <li>
                        <b>Url</b> - 存储它的文档的绝对 URL，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："https://example.com/exampledocument1.docx".
                    </li>
                </ul>
            </td>
            <td>object数组</td>
            <td>[
    {
        "folder": "Example Files",
        "title": "exampledocument1.docx",
        "url": "https://example.com/exampledocument1.docx"
    }
]</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/recent.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="region" class="copy-link">region</td>
            <td>
                定义货币和日期和时间的默认显示格式（仅在 <b>电子表格编辑器</b> 中）。
                使用四个字母（<b>en-US</b>、 <b>fr-FR</b>等）语言代码设置。
                对于默认值，采用 <em>lang</em> 参数，或者，如果没有与 <em>lang</em> 值对应的区域设置可用，则使用 <b>en-US</b>。
            </td>
            <td>string</td>
            <td>"en-US"</td>
        </tr>
        <tr>
            <td id="templates" class="copy-link">templates</td>
            <td>在 <b>新建...</b> 菜单选项中定义模板是否存在，可以在其中设置以下文档参数：
                <ul>
                    <li>
                        <b>image</b> - 模板图像的绝对 URL，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/exampletemplate1.png"；
                    </li>
                    <li>
                        <b>title</b> - 将在 <b>Create New...</b> 菜单选项中显示的模板标题，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："exampletemplate1.docx"；
                    </li>
                    <li>
                        <b>url</b> - 将在其中创建并在创建后可用的文档的绝对 URL，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/url-to-create-template1".
                    </li>
                </ul>
            </td>
            <td>object数组</td>
            <td>[
    {
        "image": "https://example.com/exampletemplate1.png",
        "title": "exampletemplate1.docx",
        "url": "https://example.com/url-to-create-template1"
    }
]</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/templates.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="user" class="copy-link">user</td>
            <td>定义当前查看或编辑文档的用户：
                <ul>
                    <li>
                        <b>firstname</b> - 用户的名字。
                        自 4.2 版起已弃用，请改用 <em>name</em>，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："John"；
                    </li>
                    <li>
                        <b>group</b> - 用户所属的组，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："Group1"；
                    </li>
                    <li>
                        <b>id</b> - 用户的标识。
                        长度限制为 128 个符号。
                        <br />
                        此信息被存储并用于区分共同作者, 在保存和突出显示历史记录（在 <a href="<%= Url.Action("callback") %>#changeshistory">更改</a>列表中）时指出最后更改的 <a href="<%= Url.Action("callback") %>#users">作者</a>，并根据用户数量计算有权访问许可证的用户。
                        <br />
                        我们建议使用一些唯一的匿名哈希。
                        不要在此字段中使用敏感数据，例如姓名或电子邮件。
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："78e1e841"；
                    </li>
                    <li>
                        <b>image</b> - 用户头像的路径,
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>例如</b>: "https://example.com/url-to-user-avatar.png";
                    </li>
                    <li>
                        <b>lastname</b> - 用户的姓氏。
                        自 4.2 版起已弃用，请改用 <em>name</em>，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："Smith";
                    </li>
                    <li>
                        <b>name</b> - 用户的全名。
                        长度限制为 128 个符号。
                        从 4.2 版开始使用，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："John Smith"。
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "group": "Group1",
    "id": "78e1e841",
    "image": "https://example.com/url-to-user-avatar.png",
    "name": "John Smith"
}</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - 必填字段</em></span>
<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "actionLink": ACTION_DATA,
        "callbackUrl": "https://example.com/url-to-callback.ashx",
        "coEditing": {
            "mode": "fast",
            "change": true
        },
        "createUrl": "https://example.com/url-to-create-document/",
        "lang": "en",
        "location": "",
        "mode": "edit",
        "recent": [
            {
                "folder": "Example Files",
                "title": "exampledocument1.docx",
                "url": "https://example.com/exampledocument1.docx"
            },
            {
                "folder": "Example Files",
                "title": "exampledocument2.docx",
                "url": "https://example.com/exampledocument2.docx"
            },
            ...
        ],
        "region": "en-US",
        "templates": [
            {
                "image": "https://example.com/exampletemplate1.png",
                "title": "exampletemplate1.docx",
                "url": "https://example.com/url-to-create-template1"
            },
            {
                "image": "https://example.com/exampletemplate2.png",
                "title": "exampletemplate2.docx",
                "url": "https://example.com/url-to-create-template2"
            },
            ...
        ],
        "user": {
            "group": "Group1",
            "id": "78e1e841",
            "image": "https://example.com/url-to-user-avatar.png",
            "name": "John Smith"
        }
    },
    ...
});
</pre>
<p>
    其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
    有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
</p>
