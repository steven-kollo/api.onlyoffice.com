<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">文档服务器常见问题解答： <br />
        共享问题</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="sharing_1">
    <dt>如何打开启用了"跟踪更改"模式的文档？</dt>
    <dd>
        <p>要在启用 <em>跟踪更改</em> 模式的情况下打开文档，请使用 <em>document.permissions</em> 参数（请参阅 <a href="<%= Url.Action("advanced") %>">此处</a>文档服务器配置对象的完整结构）。</p>
        <p>在启用 <em>跟踪更改</em> 模式的情况下，可以通过三种主要变体打开文档：</p>
        <ol>
            <li>启用审阅和编辑：如果 <em>document.permission.edit</em> 和document.permission.review参数都设置为 <b>true</b>，用户自己将能够编辑文档，接受/拒绝所做的更改并切换到审阅模式。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>仅启用审阅：如果 <em>document.permission.edit</em> 参数设置为 <b>false</b> 并且 <em>document.permission.review</em> 设置为 <b>true</b>，用户将只能在审阅模式下打开文档。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>启用审阅和评论：如果 <em>document.permission.edit</em> 参数设置为 <b>false</b>， <em>document.permission.review</em> 和 <em>document.permission.comment</em> 都设置为 <b>true</b>，用户将能够以审阅模式打开文档，并有可能评论它，但将无法编辑它。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
        </ol>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_2">
    <dt>如何打开文档并启用"评论"模式？</dt>
    <dd>
        <p>要在启用 <em>评论</em> 模式的情况下打开文档，需要使用 <em>document.permissions</em> 参数（请参阅 <a href="<%= Url.Action("advanced") %>">此处</a>了解文档服务器配置对象的完整结构）。</p>
        <p>在启用 <em>评论</em> 模式的情况下，如何打开文档有以下主要变体：</p>
        <ol>
            <li>启用评论和编辑：如果 <em>document.permission.edit</em> 和 <em>document.permission.comment</em> 参数都设置为 <b>true</b>，用户将能够编辑文档和评论。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "comment": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>仅启用评论：如果 <em>document.permission.edit</em> 参数设置为 <b>false</b> 并且document.permission.comment设置为 <b>true</b>，则文档将仅可用于评论。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>启用审阅和评论：如果 <em>document.permission.edit</em> 参数设置为 <b>false</b>， <em>document.permission.review</em> 和 <em>document.permission.comment</em> 都设置为 <b>true</b>，用户将能够以审阅模式打开文档，并有可能评论它，但将无法编辑它。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>评论只能查看：如果 <em>document.permission.edit</em> 参数设置为 <b>true</b> 并且 <em>document.permission.comment</em> 设置为 <b>false</b>，用户将只能编辑，相应的评论功能将仅供查看，评论的添加和编辑将不可用。这种情况下的配置将如下所示：
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "comment": false
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
        </ol>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_3">
    <dt>如何使用'fillForms'参数？</dt>
    <dd>
        <p>从版本 5.2 开始，文档服务器提供了填写特殊表单的功能，而无需授予用户编辑权限。这可以用在某些情形中，比如，如果您有某种文档表单，并希望用户可以访问此表单，以便他们填写文档某些字段，但无法编辑其他文档字段（例如，将名称填写在合同中但不更改合同条款，或填写其他文档中的变量字段但保持文档的其他部分不变）。</p>
        <p>要启用此模式，请使用 <em>document.permissions.fillForms</em> 参数：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": false,
            "fillForms": true,
            "comment": false
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
        <p><em>comment</em> 字段是可选的，因为只要启用了 <em>fillForms</em> 参数并禁用了 <em>edit</em> 和 <em>review</em> 参数，注释都被禁用了。</p>
        <p>通过上面的配置，文档将在启用表单填写模式并禁用所有其他模式的情况下打开，从而使有权访问它的用户只能填写特殊 <a target="_blank" href="https://helpcenter.onlyoffice.com/ONLYOFFICE-Editors/ONLYOFFICE-Document-Editor/UsageInstructions/InsertContentControls.aspx">内容控件</a>中的字段。</p>
        <p>然后由您决定下一步做什么：对可编辑字段的更改将保存到同一个文档中，或者每次新用户访问和更改原始文档时都将创建一个新文档。</p>
        <p>如果仅授予具有 <em>fillForms</em> 权限的某个用户对文档有一次访问权限，则可以使用第一种情况，然后将其与所有更改一起保存，并且其他用户无需再次填写它。</p>
        <p>第二种情况更常用，当您有一个文档模板，其中一些字段未填写，并希望将其访问权限授予更多用户（例如，将其放到您的网站上，以便用户无需每次下载就可以填写并再次上传）。在这种情况下，更合理的做法是将此文档作为模板，方便将来更改，并且在具有 <em>fillForms</em> 访问权限的用户编辑字段后，将其保存在另一个文件名下。</p>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_4">
    <dt>如何同时启用文档的编辑和评论模式？</dt>
    <dd>
        <p>要在启用 <em>编辑</em> 和 <em>评论</em> 模式的情况下打开文档，请使用 <em>document.permissions</em> 参数（请参阅 <a href="<%= Url.Action("advanced") %>">此处</a>了解文档服务器配置对象的完整结构）。</p>
        <p>您需要将 <em>document.permission.edit</em> 和document.permission.comment <em>document.permission.comment</em> 参数都设置为 <b>true</b>，以便用户能够编辑文档和评论。这种情况下的配置将如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "comment": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_5">
    <dt>权限参数是否相互影响？</dt>
    <dd>
        <p>大多数权限参数都是独立的，仅在其值设置为 <b>true</b> 时启用，在值设置为 <b>false</b>时禁用。尽管有相应的参数值，当权限启用或禁用时，仍有几种组合：</p>
        <ul>
            <li>当 <em>edit</em> 或 <em>review</em> 参数设置为 <b>true</b>时，会启用表单填写权限（即使 <em>fillForm</em> 参数设置为 <b>false</b>)）。</li>
            <li>当 <em>edit</em> 和 <em>review</em> 参数都设置为 <b>false</b>并且注释设置为true时，表单填写权限被禁用（即使 <em>fillForm</em> 参数设置为 <b>true</b> <em></em>）。</li>
            <li>当 <em>edit</em> 和 <em>review</em> 参数都被设置为 <b>false</b>而且 <em>fillForms</em> 被设置为 <b>true</b>时。 评论权限被禁用 (即使 <em>comment</em> 参数设置为 <b>true</b>)。</li>
        </ul>
        <p>当您设置必要的权限并为同一个文档组合不同的权限时，您应该牢记这一点。</p>
        <p>请参阅下面的交互表，了解不同参数和参数组合如何相互影响以及由此产生的文档权限：</p>
        <div class="table_wrapper">
            <h5>参数</h5>
            <table id="parameters" class="parameters_permissions">
                <thead>
                    <tr>
                        <th>参数</th>
                        <th colspan="2" style="text-align: center;">值</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="mode">
                        <th><p><a href="<%= Url.Action("config/editor") %>#mode">editorConfig.mode</a></th>
                        <td class="paramEdit active_param"><p>edit</p></td>
                        <td class="paramView inactive_param"><p>view</p></td>
                    </tr>
                    <tr id="edit">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#edit">document.permissions.edit</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="review">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="fillForms">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#fillForms">document.permissions.fillForms</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="comment">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a></a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="download">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#download">document.permissions.download</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="print">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#print">document.permissions.print</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_wrapper">
            <h5>产生的权限</h5>
            <table id="result" class="parameters_permissions">
                <thead>
                    <tr>
                        <th>文档操作</th>
                        <th>权限</th>
                        <th>注释</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="viewing">
                        <td class="resultAction"><p>查看</p></td>
                        <td class="resultPermission allowed"><p>允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="editing">
                        <td class="resultAction"><p>编辑</p></td>
                        <td class="resultPermission notallowed"><p>不允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="reviewing">
                        <td class="resultAction"><p>审查</p></td>
                        <td class="resultPermission notallowed"><p>不允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="formFilling">
                        <td class="resultAction"><p>表格填写</p></td>
                        <td class="resultPermission notallowed"><p>不允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="commenting">
                        <td class="resultAction"><p>评论</p></td>
                        <td class="resultPermission notallowed"><p>不允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="downloading">
                        <td class="resultAction"><p>下载</p></td>
                        <td class="resultPermission notallowed"><p>不允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="printing">
                        <td class="resultAction"><p>打印</p></td>
                        <td class="resultPermission notallowed"><p>不允许</p></td>
                        <td class="resultNote"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_6">
    <dt>如何在没有编辑选项的情况下在查看器中打开文档？</dt>
    <dd>
        <p>要在启用两种 <em>查看</em> 模式的情况下打开文档，请使用 <em>document.permissions</em> 参数（请参阅 <a href="<%= Url.Action("advanced") %>">此处</a>了解文档服务器配置对象的完整结构）。</p>
        <p>您需要将 <em>document.permission.edit</em>、 <em>document.permission.review</em> 和 <em>document.permission.fillForms</em> 参数设置为 <b>false</b>，这样用户将无法编辑、查看文档或更改其中的表单字段。如果您还想禁用文档的评论功能，请将 <em>comment</em> 参数也设置为 <b>false</b> （但现有评论将可供查看）。</p>
        <div class="note">如果您禁用所有的编辑权限，我们建议您也将 <em>document.permissions.chat</em> 设置为 <b>false</b>，这样有权访问该文档的用户就不会向文档嵌入聊天发送垃圾邮件。</div>
        <p>这种情况下的配置将如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "chat": false,
            "edit": false,
            "review": false,
            "fillForms": false,
            "comment": false
        },
        ...
    },
    ...
});</pre>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_7">
    <dt>如何禁用/启用下载文件的可能性？</dt>
    <dd>
        <p>要在禁用 <em>下载</em> 选项的情况下打开文档，请使用 <em>document.permissions</em> 参数（请参阅 <a href="<%= Url.Action("advanced") %>">此处</a>了解文档服务器配置对象的完整结构）。</p>
        <p>您需要将 <em>document.permission.download</em> 设置为 <b>false</b>，以便从文档 <b>文件</b> 菜单（如果 <em>document.permission.edit</em> 参数设置为 <b>true</b> ）或顶部工具栏中删除 <b>下载为...</b> 选项（如果 <em>document.permission.edit</em> 设置为 <b>false</b> 并且该文件仅供查看），并且用户无法从编辑器下载该文档。这种情况下的 <em>权限</em> 配置将如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "download": false
        },
        ...
    },
    ...
});</pre>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_8">
    <dt>如何防止文档被打印？</dt>
    <dd>
        <p>要在禁用 <em>打印</em> 选项的情况下打开文档，请使用 <em>document.permissions</em> 参数（请参阅 <a href="<%= Url.Action("advanced") %>">此处</a>了解文档服务器配置对象的完整结构）。</p>
        <p>您需要将 <em>document.permission.print</em> 设置为 <b>false</b>，以便从文档 <b>文件</b> 菜单（如果 <em>document.permission.edit</em> 参数设置为 <b>true</b>）或顶部工具栏（如果 <em>document.permission.edit</em> 设置为 <b>false</b> 并且该文件仅供查看）移除 <b>打印</b> 选项,并且用户无法从编辑器中打印出该文档。这种情况下的 <em>权限</em> 配置将如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "print": false
        },
        ...
    },
    ...
});</pre>
        <p>有关权限的更多信息，请参见 <a href="<%= Url.Action("config/document/permissions") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_9">
    <dt>如何查看和更改某个文档的共享设置？</dt>
    <dd>
        <p>共享设置存储在 <b>文档存储服务</b> 中，并且必须由软件集成商自己定义。文档服务器可以使用 <em>document.info.sharingSettings</em> 参数显示这些设置，其中的信息将显示在文档 <b>文件</b> -> <b>存取权限...</b> 窗口中。</p>
        <p>此参数是一个对象数组，表示用户名列表 (<em>document.info.sharingSettings.user</em>) 及其对当前文档 (<em>document.info.sharingSettings.permissions</em>) 的访问权限。</p>
        <p><em>document.info.sharingSettings.user</em> 是一个字符串参数，它可以显示从 <b>文档存储服务</b> 传递到文档服务器的任何用户名。</p>
        <p><em>document.info.sharingSettings.permissions</em> 也是一个字符串参数，它显示了与定义用户对当前文档的访问权限的规则集对应的访问权限的名称。</p>
        <div class="note">请注意，最初没有任何预定义的文档访问规则集。如果您使用 <b>ONLYOFFICE 社区服务器</b>，将使用和显示几个访问权限规则（<b>完全访问</b>、 <b>只读</b>、 <b>拒绝访问</b>）。如果您设置自己的 <b>文档存储服务</b>，您将必须定义自己的一组规则及其名称（例如， <b>只读访问</b>：将参数 <em>document.permission.edit</em>、 <em>document.permission.review</em>、 <em>document.permission.fillForms</em> 设置为 <b>false</b>; 或 <b>只下载</b> ：将所有 <em>document.permission</em> 参数设置为 <b>false</b> 并且仅 <em>document.permission.download</em> 参数设置为 <b>true</b>等），并将它们发送到 <b>文档编辑服务</b>，以便用户可以访问文档，并且这些设置显示在文档 <b>访问权限中...</b> 窗口中。</div>
        <p><em>sharingSettings</em> 配置可能如下所示：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": {
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
            ]
        },
        ...
    },
    ...
});</pre>
        <p>有关文档信息的更多信息，请参见 <a href="<%= Url.Action("config/document/info") %>">此页面</a>。</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_10">
    <dt>如何限制评论？</dt>
    <dd>
        <p>默认情况下评论是被启用的。如果您想限制评论并只允许作者编辑和/或删除他们的评论，
        您需要更改 <em>document.permissions.editCommentsAuthorOnly</em> 和/或 <em>document.permissions.deleteCommentsAuthorOnly</em> 参数：</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "comment": true,
            "editCommentsAuthorOnly": true,
            "deleteCommentsAuthorOnly": true,
        },
        ...
    },
    ...
});</pre>
    <div class="note">不要忘记将 <em>editorConfig.mode</em> 设置为 <b>edit</b>，否则任何评论功能都将被禁用。</div>
    </dd>
</dl>