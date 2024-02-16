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

<div class="header-gray">示例</div>
<p>
    <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
    请参阅<a href="<%= Url.Action("howitworks") %>">工作原理</a>部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
</p>
<div id="controlFields">
    <div id="info" class="control-panel">
        <div class="line input_line" style="margin-top: 0;">
            <label for="editorConfig_actionLink">Action Link</label>
            <input type="text" id="editorConfig_actionLink" name="editorConfig_actionLink" value="ACTION_DATA">
        </div>
        <div class="line input_line">
            <label for="editorConfig_callbackUrl">Callback Url</label>
            <input type="text" id="editorConfig_callbackUrl" name="editorConfig_callbackUrl" value="https://example.com/url-to-callback.ashx">
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_coEditing" name="editorConfig_coEditing" hidden="hidden">
                <span></span>
                <label for="editorConfig_coEditing">coEditing</label>
            </label>
        </div>
        <div id="holder_editorConfig_coEditing" class="config_object_holder" hidden>
            <div class="config_nested_group">
                <div class="line input_line">
                    <label for="editorConfig_coEditing_mode">Mode</label>
                    <select class="select" id="editorConfig_coEditing_mode" name="editorConfig_coEditing_mode">
                        <option disabled>fast</option>
                        <option value="fast">fast</option>
                        <option value="strict">strict </option>
                    </select>
                </div>
                <div class="line">
                    <label class="dataItemSpan">
                        <input type="checkbox" id="editorConfig_coEditing_change" name="editorConfig_coEditing_change" hidden="hidden" checked>
                        <span></span>
                        <label for="editorConfig_coEditing_change">Change</label>
                    </label>
                </div>
            </div>
        </div>
        <div class="line input_line">
            <label for="editorConfig_createUrl">Create Url</label>
            <input type="text" id="editorConfig_createUrl" name="editorConfig_createUrl" value="https://example.com/url-to-create-document/">
        </div>
        <div class="line input_line">
            <label for="editorConfig_lang">Lang</label>
            <select class="select" id="editorConfig_lang" name="editorConfig_lang">
                <option disabled>en</option>
                <option value="az">az</option>
                <option value="be">be</option>
                <option value="bg">bg</option>
                <option value="ca">ca</option>
                <option value="cs">cs</option>
                <option value="da">da</option>
                <option value="de">de</option>
                <option value="el">el</option>
                <option value="en">en</option>
                <option value="es">es</option>
                <option value="eu">eu</option>
                <option value="fi">fi</option>
                <option value="fr">fr</option>
                <option value="gl">gl</option>
                <option value="hu">hu</option>
                <option value="hy">hy</option>
                <option value="id">id</option>
                <option value="it">it</option>
                <option value="ja">ja</option>
                <option value="ko">ko</option>
                <option value="lo">lo</option>
                <option value="lv">lv</option>
                <option value="ms">ms</option>
                <option value="nl">nl</option>
                <option value="no">no</option>
                <option value="pl">pl</option>
                <option value="pt">pt</option>
                <option value="pt-PT">pt-PT</option>
                <option value="ro">ro</option>
                <option value="ru">ru</option>
                <option value="si">si</option>
                <option value="sk">sk</option>
                <option value="sl">sl</option>
                <option value="sv">sv</option>
                <option value="tr">tr</option>
                <option value="uk">uk</option>
                <option value="vi">vi</option>
                <option value="zh">zh</option>
                <option value="zh-TW">zh-TW</option>
            </select>
        </div>
        <div class="line input_line">
            <label for="editorConfig_location">Location</label>
            <input type="text" id="editorConfig_location" name="editorConfig_location" value="">
        </div>
        <div class="line input_line">
            <label for="editorConfig_mode">Mode</label>
            <select class="select" id="editorConfig_mode" name="editorConfig_mode">
                <option disabled>edit</option>
                <option value="edit">edit</option>
                <option value="view">view </option>
            </select>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_recent" name="editorConfig_recent" hidden="hidden">
                <span></span>
                <label for="editorConfig_recent">Recent</label>
            </label>
        </div>
        <div id="holder_editorConfig_recent" class="config_object_holder" hidden>
            <div id="holder_editorConfig_recent_0" class="editorConfig_recentItem config_nested_group">
                <div class="line input_line">
                    <label for="editorConfig_recent_folder_0">Folder</label>
                    <input type="text" id="editorConfig_recent_folder_0" name="editorConfig_recent_folder_0" value="Example Folder">
                </div>
                <div class="line input_line">
                    <label for="editorConfig_recent_title_0">Title</label>
                    <input type="text" id="editorConfig_recent_title_0" name="editorConfig_recent_title_0" value="exampledocument1.docx">
                </div>
               <div class="line input_line">
                    <label for="editorConfig_recent_url_0">Url</label>
                    <input type="text" id="editorConfig_recent_url_0" name="editorConfig_recent_url_0" value="https://example.com/exampledocument1.docx">
                </div>
            </div> 
        </div>
        <div style="padding-left: 24px;">
            <button id="addButton_editorConfig_recent" class="add-button" hidden>+</button>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_templates" name="editorConfig_templates" hidden="hidden">
                <span></span>
                <label for="editorConfig_templates">Templates</label>
            </label>
        </div>
        <div id="holder_editorConfig_templates" class="config_object_holder"hidden>
            <div id="holder_editorConfig_templates_0" class="editorConfig_templatesItem config_nested_group">
                <div class="line input_line">
                    <label for="editorConfig_templates_image_0">Image</label>
                    <input type="text" id="editorConfig_templates_image_0" name="editorConfig_templates_image_0" value="https://example.com/exampletemplate1.png">
                </div>
                <div class="line input_line">
                    <label for="editorConfig_templates_title_0">Title</label>
                    <input type="text" id="editorConfig_templates_title_0" name="editorConfig_templates_title_0" value="exampledocument1.docx">
                </div>
               <div class="line input_line">
                    <label for="editorConfig_templates_url_0">Url</label>
                    <input type="text" id="editorConfig_templates_url_0" name="editorConfig_templates_url_0" value="https://example.com/url-to-create-template1">
                </div>
            </div> 
        </div>
        <div style="padding-left: 24px; margin-bottom: 18px;">
            <button id="addButton_editorConfig_templates" class="add-button" hidden>+</button>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_user" name="editorConfig_user" hidden="hidden">
                <span></span>
                <label for="editorConfig_user">User</label>
            </label>
        </div>
        <div class="config_nested_group" style="margin-bottom: 0;">
            <div id="holder_editorConfig_user" class="config_object_holder" hidden>
                <div class="line input_line">
                    <label for="editorConfig_user_group">Group</label>
                    <input type="text" id="editorConfig_user_group" name="editorConfig_user_group" value="Group1">
                </div>
                <div class="line input_line">
                    <label for="editorConfig_user_id">Id</label>
                    <input type="text" id="editorConfig_user_id" name="editorConfig_user_id" value="78e1e841">
                </div>
                <div class="line input_line">
                    <label for="editorConfig_user_image">Image</label>
                    <input type="text" id="editorConfig_user_image" name="editorConfig_user_image" value="https://api.onlyoffice.com/content/img/docbuilder/examples/blue_cloud.png">
                </div>
                <div class="line input_line">
                    <label for="editorConfig_user_name">Name</label>
                    <input type="text" id="editorConfig_user_name" name="editorConfig_user_name" value="John Smith">
                </div>
            </div>
        </div>
    </div>
</div>
<div id="configPreHolder">
    <pre id="configPre"></pre>
</div>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

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

<script>
    $('.select').each(function () {
        const _this = $(this),
            selectOption = _this.find('option'),
            selectOptionLength = selectOption.length,
            selectedOption = selectOption.filter(':selected'),
            duration = 120;

        _this.hide();
        _this.wrap('<div class="select"></div>');
        $('<div>', {
            class: 'new-select',
            text: _this.children('option:disabled').text()
        }).insertAfter(_this);

        const selectHead = _this.next('.new-select');
        $('<div>', {
            class: 'new-select__list'
        }).insertAfter(selectHead);

        const selectList = selectHead.next('.new-select__list');
        for (let i = 1; i < selectOptionLength; i++) {
            $('<div>', {
                class: 'new-select__item',
                html: $('<span>', {
                    text: selectOption.eq(i).text()
                })
            })
                .attr('data-value', selectOption.eq(i).val())
                .appendTo(selectList);
        }

        const selectItem = selectList.find('.new-select__item');
        selectList.slideUp(0);
        selectHead.on('click', function () {
            if (!$(this).hasClass('on')) {
                $(this).addClass('on');
                selectList.slideDown(duration);
                selectItem.on('click', function () {
                    let chooseItem = $(this).data('value');
                    $('select').val(chooseItem).attr('selected', 'selected');
                    selectHead.text($(this).find('span').text());
                    selectList.slideUp(duration);
                    selectHead.removeClass('on');
                    updateConfig();
                });
                window.addEventListener('click', function (e) {
                    if (e.target != selectList[0] && e.target != selectHead[0] && e.target != selectItem[0]) {
                        selectHead.removeClass('on');
                        selectList.slideUp(duration);
                    }
                });
            } else {
                $(this).removeClass('on');
                selectList.slideUp(duration);
            }
        });
    });
</script>
<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">

    // Editor window
    var config = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "docx",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title",
                Url = ConfigurationManager.AppSettings["storage_demo_url_zh"] + "demo." + "docx",
                Info = new Config.DocumentConfig.InfoConfig()
            },
        DocumentType = "word",
        EditorConfig = new Config.EditorConfigConfiguration
            {
                CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                    {
                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                            {
                                Request = false
                            },
                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                            {
                                Visible = true
                            },
                        IntegrationMode = "embed",
                }
            },
        Height = "550px",
        Width = "100%"
    }) %>;
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig(this.id);
    });

    $("#editorConfig_coEditing").change(showHideConfigObject);
    $('#addButton_editorConfig_recent').click(addRecentItem);
    $("#editorConfig_recent").change(showHideConfigObject);
    $('#addButton_editorConfig_templates').click(addTemplatesItem);
    $("#editorConfig_templates").change(showHideConfigObject);
    $("#editorConfig_user").change(showHideConfigObject);

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    // Recent Items
    function addRecentItem() {
        var items = document.getElementsByClassName("editorConfig_recentItem");
        var i = 0;
        while (items[i] != undefined) {
            i++;
        }
        let div = document.createElement("div");
        div.innerHTML = `
        <div id="holder_editorConfig_recent_${i}" class="editorConfig_recentItem config_nested_group">
            <div class="line input_line">
                <label for="editorConfig_recent_folder_${i}">Folder</label>
                <input type="text" id="editorConfig_recent_folder_${i}" name="editorConfig_recent_folder_${i}" value="Example Folder">
            </div>
            <div class="line input_line">
                <label for="editorConfig_recent_title_${i}">Title</label>
                <input type="text" id="editorConfig_recent_title_${i}" name="editorConfig_recent_title_${i}" value="exampledocument${i+1}.docx">
            </div>
           <div class="line input_line">
                <label for="editorConfig_recent_url_${i}">Url</label>
                <input type="text" id="editorConfig_recent_url_${i}" name="editorConfig_recent_url_${i}" value="https://example.com/exampledocument${i+1}.docx">
            </div>
        </div>`;

        document.getElementById("holder_editorConfig_recent").appendChild(div);
        $("#controlFields").find("input,select").change(function () {
            updateConfig(this.id);
        });
        resizeCodeInput();
        updateConfig();
    }

    function getRecentSettings() {
        if (!getFieldValue("editorConfig_recent")) {
            return "";
        }
        var recentString = "";
        var recentElements = document.getElementsByClassName("editorConfig_recentItem");
        var i = 0;
        while (recentElements[i] != undefined) {
            var string = `
            {
                "folder": ${getFieldValue("editorConfig_recent_folder_" + i)},
                "title": ${getFieldValue("editorConfig_recent_title_" + i)},
                "url": ${getFieldValue("editorConfig_recent_url_" + i)}
            }`;
            recentString += recentString == "" ? string : "," + string;
            i++;
        }
        return recentString == "" ? "" : `,
        "recent": [${recentString}
        ]`;
    }

    // Templates Items
    function addTemplatesItem() {
        var items = document.getElementsByClassName("editorConfig_templatesItem");
        var i = 0;
        while (items[i] != undefined) {
            i++;
        }
        let div = document.createElement("div");
        div.innerHTML = `
        <div id="holder_editorConfig_templates_${i}" class="editorConfig_templatesItem config_nested_group">
            <div class="line input_line">
                <label for="editorConfig_templates_image_${i}">Image</label>
                <input type="text" id="editorConfig_templates_image_${i}" name="editorConfig_templates_image_${i}" value="https://example.com/exampletemplate${i+1}.png">
            </div>
            <div class="line input_line">
                <label for="editorConfig_templates_title_${i}">Title</label>
                <input type="text" id="editorConfig_templates_title_${i}" name="editorConfig_templates_title_${i}" value="exampledocument${i+1}.docx">
            </div>
           <div class="line input_line">
                <label for="editorConfig_templates_url_${i}">Url</label>
                <input type="text" id="editorConfig_templates_url_${i}" name="editorConfig_templates_url_${i}" value="https://example.com/url-to-create-template${i+1}">
            </div>
        </div>`;

        document.getElementById("holder_editorConfig_templates").appendChild(div);
        $("#controlFields").find("input,select").change(function () {
            updateConfig(this.id);
        });
        resizeCodeInput();
        updateConfig();
    }

    function getTemplatesSettings() {
        if (!getFieldValue("editorConfig_templates")) {
            return "";
        }
        var templatesString = "";
        var templatesElements = document.getElementsByClassName("editorConfig_templatesItem");
        var i = 0;
        while (templatesElements[i] != undefined) {
            var string = `
            {
                "image": ${getFieldValue("editorConfig_templates_image_" + i)},
                "title": ${getFieldValue("editorConfig_templates_title_" + i)},
                "url": ${getFieldValue("editorConfig_templates_url_" + i)}
            }`;
            templatesString += templatesString == "" ? string : "," + string;
            i++;
        }
        return templatesString == "" ? "" : `,
        "templates": [${templatesString}
        ]`;
    }

    function updateConfig(id) {
        var recent = "";
        var templates = "";
        if (getFieldValue("editorConfig_recent")) {
            recent = getRecentSettings();
            document.getElementById("addButton_editorConfig_recent").hidden = false;
        } else {
            document.getElementById("addButton_editorConfig_recent").hidden = true;
        }

        if (getFieldValue("editorConfig_templates")) {
            templates = getTemplatesSettings();
            document.getElementById("addButton_editorConfig_templates").hidden = false;
        } else {
            document.getElementById("addButton_editorConfig_templates").hidden = true;
        }
        
        var coEditing = !getFieldValue("editorConfig_coEditing") ? "" : `"coEditing": {
            "mode": ${getFieldValue("editorConfig_coEditing_mode")},
            "change": ${getFieldValue("editorConfig_coEditing_change")}
        },
        `;

        var user = !getFieldValue("editorConfig_user") ? "" : `,
        "user": {
            "group": ${getFieldValue("editorConfig_user_group")},
            "id": ${getFieldValue("editorConfig_user_id")},
            "image": ${getFieldValue("editorConfig_user_image")},
            "name": ${getFieldValue("editorConfig_user_name")}
        }`;

        var location = getFieldValue("editorConfig_location") == 0 ? `""` : getFieldValue("editorConfig_location");

        var editorConfig = `{
        "actionLink": ${getFieldValue("editorConfig_actionLink")},
        "callbackUrl": ${getFieldValue("editorConfig_callbackUrl")},
        ${coEditing}"createUrl": ${getFieldValue("editorConfig_createUrl")},
        "lang": ${getFieldValue("editorConfig_lang")},
        "location": ${location},
        "mode": ${getFieldValue("editorConfig_mode")}${recent}${templates}${user}
    }`;
        var config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": ${editorConfig},
    ...
});
`;
        var fakeFields = ['editorConfig_actionLink', 'editorConfig_callbackUrl'];
        if (!fakeFields.includes(id)) {
            var editorConfig_object = JSON.parse(editorConfig);
            editorConfig_object.callbackUrl = config.editorConfig.callbackUrl;
            delete editorConfig_object["actionLink"];
            config.editorConfig = editorConfig_object;
            config.editorConfig.customization = {
                "integrationMode": "embed"
            };
            if (window.docEditor) {
                window.docEditor.destroyEditor();
            }
            $.ajax({
                type: "POST",
                url: "<%= Url.Action("configcreate", null, null, Request.Url.Scheme) %>",
                data: JSON.stringify({ jsonConfig: JSON.stringify(config) }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.docEditor = new DocsAPI.DocEditor("placeholder", JSON.parse(data));
                }
            });
            //window.docEditor = new DocsAPI.DocEditor("placeholder", config);
        }

        var pre = document.getElementById("configPre");
        pre.innerHTML = config_string;
        hljs.highlightBlock(pre);
    }

    function getFieldValue(id) {
        var element = document.getElementById(id);
        if (document.getElementById(id).parentElement.className == "select") {
            return `"${document.getElementById(id).parentElement.children[1].innerText}"`;
        } else if (element.type == "checkbox") {
            return element.checked;
        } else if (`${element.value}` == ``) {
            return `""`;
        } else if (isNaN(element.value)) {
            return `"${element.value}"`;
        } else {
            return Number(element.value);
        }
    }

    function resizeCodeInput() {
        var paddingTop = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingTop.split("px")[0]);
        var paddingBottom = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingBottom.split("px")[0]);
        var borderSize = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).border.split("px")[0]);
        var controlFieldsHeight = Math.round(document.getElementById("controlFields").getBoundingClientRect().height * 100) / 100;

        var offset = paddingTop + paddingBottom + (borderSize * 2);
        var height = controlFieldsHeight - offset;

        document.getElementById("configPre").style.height = `${height}px`;
    }
</script>