<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">嵌入式</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">
    嵌入部分仅适用于 <b>嵌入</b> 文档类型（请参阅 <a href="<%= Url.Action("config/") %>#type">配置</a> 部分以了解如何定义 <b>嵌入</b> 文档类型）。
    它允许更改定义嵌入模式中按钮行为的设置。
</p>

<div class="header-gray">示例</div>
<p>
    <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
    请参阅<a href="<%= Url.Action("howitworks") %>">工作原理</a>部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
</p>
<div id="controlFields">
    <div id="embedded" class="control-panel">
        <div class="line input_line" style="margin-top: 0px;">
            <label for="editorConfig_embedded_embedUrl">Embed Url</label>
            <input type="text" id="editorConfig_embedded_embedUrl" name="editorConfig_embedded_embedUrl" value="https://example.com/embedded?doc=exampledocument1.docx">
        </div>
        <div class="line input_line">
            <label for="editorConfig_embedded_fullscreenUrl">Fullscreen Url</label>
            <input type="text" id="editorConfig_embedded_fullscreenUrl" name="editorConfig_embedded_fullscreenUrl" value="https://example.com/embedded?doc=exampledocument1.docx#fullscreen">
        </div>
        <div class="line input_line">
            <label for="editorConfig_embedded_saveUrl">Save Url</label>
            <input type="text" id="editorConfig_embedded_saveUrl" name="editorConfig_embedded_saveUrl" value="https://example.com/download?doc=exampledocument1.docx">
        </div>
        <div class="line input_line">
            <label for="editorConfig_embedded_shareUrl">Share Url</label>
            <input type="text" id="editorConfig_embedded_shareUrl" name="editorConfig_embedded_shareUrl" value="https://example.com/view?doc=exampledocument1.docx">
        </div>
        <div class="line input_line">
            <label for="editorConfig_embedded_toolbarDocked">Toolbar Docked</label>
            <select class="select" id="editorConfig_embedded_toolbarDocked" name="editorConfig_embedded_toolbarDocked">
                <option value="top" disabled>top</option>
                <option value="top" selected>top</option>
                <option value="bottom">bottom</option>
            </select>
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
            <td id="embedUrl" class="copy-link">embedUrl</td>
            <td>定义文档的绝对 URL，作为嵌入网页的文档的源文件。</td>
            <td>string</td>
            <td>"https://example.com/embedded?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="fullscreenUrl" class="copy-link">fullscreenUrl</td>
            <td>定义将以全屏模式打开的文档的绝对 URL。</td>
            <td>string</td>
            <td>"https://example.com/embedded?doc=exampledocument1.docx#fullscreen"</td>
        </tr>
        <tr class="tablerow">
            <td id="saveUrl" class="copy-link">saveUrl</td>
            <td>定义允许将文档保存到用户个人计算机上的绝对 URL。</td>
            <td>string</td>
            <td>"https://example.com/download?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="shareUrl" class="copy-link">shareUrl</td>
            <td>定义允许其他用户共享此文档的绝对 URL。</td>
            <td>string</td>
            <td>"https://example.com/view?doc=exampledocument1.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="toolbarDocked" class="copy-link">toolbarDocked</td>
            <td>定义嵌入式查看器工具栏的位置，可以是 <b>top</b> 或 <b>bottom</b>。</td>
            <td>string</td>
            <td>"top"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/embedded.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

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
                },
                Lang = "zh"
            },
        Height = "550px",
        Width = "100%"
    }) %>;
    config.type = "embedded";
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig();
    });

    function updateConfig() {
        var embedded = `{
            "embedUrl": ${getFieldValue("editorConfig_embedded_embedUrl")},
            "fullscreenUrl": ${getFieldValue("editorConfig_embedded_fullscreenUrl")},
            "saveUrl": ${getFieldValue("editorConfig_embedded_saveUrl")},
            "shareUrl": ${getFieldValue("editorConfig_embedded_shareUrl")},
            "toolbarDocked": ${getFieldValue("editorConfig_embedded_toolbarDocked")}
        }`;
        var config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "embedded": ${embedded}
        ,
        ...
    },
    ...
});
`;

        var embedded_object = JSON.parse(embedded);
        config.editorConfig.embedded = embedded_object;
        if (window.docEditor) {
            window.docEditor.destroyEditor();
        }
        window.docEditor = new DocsAPI.DocEditor("placeholder", config);

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