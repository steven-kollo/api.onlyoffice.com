<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">配置</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">config base 部分允许更改使用的平台类型、文档显示大小（宽度和高度）和打开文档的类型。</p>

<div class="header-gray">示例</div>
<div>
    <div id="controlFields">
        <div id="info" class="control-panel">
            <div class="line input_line" style="margin-top: 0;">
                <label for="config_documentType">Document Type</label>
                <select class="select" id="config_documentType" name="config_documentType">
                    <option disabled>word</option>
                    <option value="word" selected>word</option>
                    <option value="cell">cell</option>
                    <option value="slide">slide</option>
                    <option value="pdf">pdf</option>
                </select>
            </div>
            <div class="line input_line">
                <label for="config_type">Type</label>
                <select class="select" id="config_type" name="config_type">
                    <option disabled>desktop</option>
                    <option value="desktop" selected>desktop</option>
                    <option value="mobile">mobile </option>
                </select>
            </div>
            <div class="line input_line">
                <label for="config_height">Height</label>
                <input type="text" id="config_height" name="config_height" value="550px">
            </div>
            <div class="line input_line" style="margin-bottom: 0;">
                <label for="config_width">Width</label>
                <input type="text" id="config_width" name="config_width" value="100%">
            </div>
        </div>
    </div>
    <div id="configPreHolder">
        <pre id="configPre"></pre>
    </div>
</div>

<div id="editorSpace">
    <div style="min-width: 832px; min-height: 550px;" id="placeholder"></div>
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
        <tr>
            <td id="documentType" class="copy-link">documentType</td>
            <td>定义要打开的文档类型：
                <ul>
                    <li><b>word</b> - 文本文档 （<em>.doc、.docm、.docx、.docxf、.dot、.dotm、.dotx、.epub、.fb2、.fodt、.htm、.html、.mht、.mhtml、.odt、.oform、.ott、.rtf、.stw、.sxw、.txt、.wps、.wpt、.xml</em>），</li>
                    <li><b>cell</b> - 电子表格 （<em>.csv、.et、.ett、.fods、.ods、.ots、.sxc、.xls、.xlsb、.xlsm、.xlsx、.xlt、.xltm、.xltx、.xml</em>），</li>
                    <li><b>slide</b> - 演示文稿 （<em>.dps、.dpt、.fodp、.odp、.otp、.pot、.potm、.potx、.pps、.ppsm、.ppsx、.ppt、.pptm、.pptx、.sxi</em>），</li>
                    <li><b>pdf</b> - 便携式文档格式 （<em>djvu, oxps, pdf, xps</em>）。</li>
                </ul>
            </td>
            <td>string</td>
            <td>"cell"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    自 6.1 版起，<b>text</b>, <b>spreadsheet</b>, <b>presentation</b> 这几个值已被弃用。
                    请改用新值。
                </div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="height" class="copy-link">height</td>
            <td>定义浏览器窗口中的文档高度（默认为<b>100%</b> ）。</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
        <tr class="tablerow">
            <td id="token" class="copy-link">token</td>
            <td>以 <a href="<%= Url.Action("signature/browser") %>#config">令牌</a>的形式定义添加到 <b>文档服务器</b> 配置的加密签名。</td>
            <td>string</td>
            <td>"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU"</td>
        </tr>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>
                定义用于访问文档的平台类型。
                可以是：
                <em>为从台式机或笔记本电脑访问文档而优化</em> - <b>Desktop</b>，
                <em>为从平板电脑或智能手机访问文档而优化</em> - <b>mobile</b>，
                <em>为易于嵌入网页而特别设计</em> - <b>embedded</b>。
                默认值为 <b>"desktop"</b>。
            </td>
            <td>string</td>
            <td>"desktop"</td>
        </tr>
        <tr class="tablerow">
            <td id="width" class="copy-link">width</td>
            <td>定义浏览器窗口中的文档宽度（默认为<b>100%</b>）。</td>
            <td>string</td>
            <td>"100%"</td>
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
    var config_word = <%= Config.Serialize(
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

    var config_cell = <%= Config.Serialize(
        new Config {
            Document = new Config.DocumentConfig
                {
                    FileType = "xlsx",
                    Key = "apiwh" + Guid.NewGuid(),
                    Permissions = new Config.DocumentConfig.PermissionsConfig(),
                    Title = "Example Title",
                    Url = ConfigurationManager.AppSettings["storage_demo_url_zh"] + "demo." + "xlsx",
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

    var config_slide = <%= Config.Serialize(
        new Config {
            Document = new Config.DocumentConfig
                {
                    FileType = "pptx",
                    Key = "apiwh" + Guid.NewGuid(),
                    Permissions = new Config.DocumentConfig.PermissionsConfig(),
                    Title = "Example Title",
                    Url = ConfigurationManager.AppSettings["storage_demo_url_zh"] + "demo." + "pptx",
                    Info = new Config.DocumentConfig.InfoConfig()
                },
            DocumentType = "slide",
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

    var config_pdf = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "pdf",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title",
                Url = ConfigurationManager.AppSettings["storage_demo_url_zh"] + "demo." + "pdf",
                Info = new Config.DocumentConfig.InfoConfig()
            },
        DocumentType = "pdf",
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
        updateConfig();
    });

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    function updateConfig() {
        
        var config_str = `{
            "documentType": ${getFieldValue("config_documentType")},
            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU",
            "type": ${getFieldValue("config_type")},
            "height": ${getFieldValue("config_height")},
            "width": ${getFieldValue("config_width")}     
        }`;
        config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    ${config_str}
    ...
});
`;
        var config_object = JSON.parse(config_str);
        var config = config_word;
        if (config_object.documentType == "cell") {
            config = config_cell;
        } else if (config_object.documentType == "slide") {
            config = config_slide;
        } else if (config_object.documentType == "pdf") {
            config = config_pdf;
        }

        config.documentType = config_object.documentType;
        config.type = config_object.type;
        config.height = config_object.height;
        config.width = config_object.width;
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