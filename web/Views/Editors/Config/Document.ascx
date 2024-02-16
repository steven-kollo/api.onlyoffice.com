<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">文档</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">文档部分允许更改与文档有关的所有参数（标题、url、文件类型等）。</p>

<div class="header-gray">示例</div>
<p>
    <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
    请参阅<a href="<%= Url.Action("howitworks") %>">工作原理</a>部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
</p>

<div id="controlFields">
    <div id="viewedit" class="control-panel">
        <div class="line input_line" style="margin-top: 0;">
            <label for="document_file_type">File type</label>
            <select class="select" id="document_file_type" name="document_file_type">
                <option disabled>xlsx</option>
                <option value="xlsx" selected>xlsx</option>
                <option value="csv">csv</option>
                <option value="xls">xls</option>
            </select>
        </div>
        <div class="line input_line">
            <label for="document_key">Key</label>
            <input type="text" id="document_key" name="document_key" value="Khirz6zTPdfd7">
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="document_reference_data" name="document_reference_data" hidden="hidden" checked>
                <span></span>
                <label for="document_reference_data">Reference data</label>
            </label>
        </div>
        <div class="config_object_holder" id="holder_document_reference_data">
            <div class="config_nested_group">
                <div class="line input_line">
                    <label for="document_file_key">File key</label>
                    <input type="text" id="document_file_key" name="document_file_key" value="BCFA2CED">
                </div>
                <div class="line input_line">
                     <label for="document_instance_id">Instance Id</label>
                    <input type="text" id="document_instance_id" name="document_instance_id" value="https://example.com">
                </div>
            </div>
        </div>
        <div class="line input_line">
            <label for="document_title">Title</label>
            <input type="text" id="document_title" name="document_title" value="Example Title">
        </div>
        <div class="line input_line" style="margin-bottom: 0;">
            <label for="document_url">URL</label>
            <input type="text" id="document_url" name="document_url" value="https://example.com/url-to-example-document.xlsx">
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
            <td id="fileType" class="copy-link">fileType<span class="required">*</span></td>
            <td>
                定义查看或编辑的源文档的文件类型。
                必须是小写。
                以下文件类型可用：<em>.csv、.djvu、.doc、.docm、.docx、.docxf、.dot、.dotm、.dotx、.epub、.fb2、.fodp、.fods、.fodt、. htm、.html、.mht、.odp、.ods、.odt、.oform、.otp、.ots、.ott、.oxps、.pdf、.pot、.potm、.potx、.pps、.ppsm、 .ppsx、.ppt、.pptm、.pptx、.rtf、.txt、.xls、.xlsb、.xlsm、.xlsx、.xlt、.xltm、.xltx、.xml、.xps</em>。
            </td>
            <td>string</td>
            <td>"docx"</td>
        </tr>
        <tr>
            <td id="key" class="copy-link">key<span class="required">*</span></td>
            <td>
                定义服务用来识别文档的唯一文档标识符。
                如果发送了已知key，则将从缓存中获取文档。
                每次编辑和保存文档时，都必须重新生成key。
                文档 url 可以用作 <b>key</b>，但不能使用特殊字符，长度限制为 128 个符号。
            </td>
            <td>string</td>
            <td>"Khirz6zTPdfd7"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">可以使用的关键字符：<b>0-9</b>、 <b>az</b>、 <b>AZ</b>、 <b>-._=</b>。
                最大密钥长度为 <b>128</b> 个字符。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="referenceData" class="copy-link">referenceData</td>
            <td>
               定义一个由集成商生成的对象，用于唯一标识其系统中的文件：
                <ul>
                    <li>
                        <b>fileKey</b> - 服务用来获取文件链接的唯一文档标识符。
                        在编辑和保存文档时不得更改（即它不等于 <a href="#key">document.key</a> 参数），
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>:  "BCFA2CED";
                    </li>
                    <li>
                        <b>instanceId</b> - 唯一的系统标识符。如果数据从一个系统上的文件复制并插入到另一个系统的文件中，则通过链接粘贴将不可用，
                        并且上下文菜单中没有相应的按钮，
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>:  "https://example.com";
                    </li>
                    <li>
                        <b>key</b> - 定义服务用于从共同编辑会话获取数据的唯一文档标识符。
                         如果发送已知密钥，将从缓存中获取文档。
                         每次编辑并保存文档时，都必须重新生成密钥。
                         文档 url 可以用作<b>key</b>，但不能包含特殊字符，且长度限制为 128 个字符,
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>:  "Khirz6zTPdfd7".
                    </li>
                </ul>
            <td>object</td>
            <td>{
    "fileKey": "BCFA2CED",
    "instanceId": "https://example.com",
    "key": "Khirz6zTPdfd7"
}</td>
        </tr>
        <tr class="tablerow">
            <td id="title" class="copy-link">title<span class="required">*</span></td>
            <td>
                为查看或编辑的文档定义所需的文件名，该文件名也将在下载文档时用作文件名。
                长度限制为 128 个符号。
            </td>
            <td>string</td>
            <td>"Example Document Title.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="url" class="copy-link">url<span class="required">*</span></td>
            <td>定义存储查看或编辑的源文档的绝对 URL。
                使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                否则会出现错误。
            </td>
            <td>string</td>
            <td>"https://example.com/url-to-example-document.docx"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<span class="required-descr"><span class="required">*</span><em> - 必填字段</em></span>

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
    var config_csv = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "csv",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title",
                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "csv",
                Info = new Config.DocumentConfig.InfoConfig()
            },
        DocumentType = "cell",
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

    var config_xlsx = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "xlsx",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title",
                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "xlsx",
                Info = new Config.DocumentConfig.InfoConfig()
            },
        DocumentType = "cell",
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
    var config = config_xlsx;
    window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig(this.id);
    });

    $("#document_reference_data").change(showHideConfigObject);

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }
    function updateConfig(id) {
        var referenceData = `
        "referenceData": {
            "fileKey": ${getFieldValue("document_file_key")},
            "instanceId": ${getFieldValue("document_instance_id")},
            "key": ${getFieldValue("document_key")}
        },`;
        if (!document.getElementById('document_reference_data').checked) {
            referenceData = "";
        }
        var document_string = `{
        "fileType": ${getFieldValue("document_file_type")},
        "key": ${getFieldValue("document_key")},${referenceData}
        "title": ${getFieldValue("document_title") },
        "url": ${getFieldValue("document_url")}
    }`;
        var config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": ${document_string},
    ...
});
`;
        var fakeFields = ['document_key', 'document_reference_data', 'document_file_key', 'document_instance_id', 'document_url'];
        if (!fakeFields.includes(id)) {
            var document_object = JSON.parse(document_string);
            if (document_object.fileType == 'csv') {
                config = config_csv;
            } else {
                config = config_xlsx;
            }
            config.document.title = document_object.title;
            window.docEditor.destroyEditor();
            window.docEditor = new DocsAPI.DocEditor("placeholder", config);
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