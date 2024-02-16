<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    转换 API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">转换 API</span>
    </h1>

    <p class="dscr">
        对于与 <b>文档转换服务</b> 的交互，使用 POST 请求。
        请求参数在请求正文中以 JSON。
        格式输入请求被发送到 <span class="fakelink">https://documentserver/ConvertService.ashx</span>, 其中 <b>documentserver</b> 是安装了ONLYOFFICE 文档服务器的服务器的名称
    </p>

    <div class="note">在 <b>ONLYOFFICE 文档服务器</b>4.2之前的版本中，使用了GET请求,请求参数在 <em>QueryString</em> 中。</div>

    <h2 id="request" class="copy-link">请求参数及其说明：</h2>
    <ul class="columns-4" style="list-style: none;">
        <li><a href="#async">async</a></li>
        <li><a href="#codePage">codePage</a></li>
        <li><a href="#delimiter">delimiter</a></li>
        <li><a href="#documentLayout">documentLayout</a></li>
        <li><a href="#documentRenderer">documentRenderer</a></li>
        <li><a href="#filetype">filetype</a></li>
        <li><a href="#key">key</a></li>
        <li><a href="#outputtype">outputtype</a></li>
        <li><a href="#password">password</a></li>
        <li><a href="#region">region</a></li>
        <li><a href="#spreadsheetLayout">spreadsheetLayout</a></li>
        <li><a href="#thumbnail">thumbnail</a></li>
        <li><a href="#title">title</a></li>
        <li><a href="#token">token</a></li>
        <li><a href="#url">url</a></li>
        <li><a href="#watermark">watermark</a></li>
    </ul>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>参数</td>
                <td>描述</td>
                <td>类型</td>
                <td>出现</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="async" class="copy-link">async</td>
                <td>
                    定义转换请求类型：异步与否。<br />
                    支持的值：
                    <ul>
                        <li><b>true</b></li>
                        <li><b>false</b></li>
                    </ul>
                    使用异步请求类型时，响应立即形成。
                    在这种情况下，要获得结果，必须在转换完成之前发送不更改参数的请求。
                    默认值为 <b>false</b>。
                </td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow tablerow-note">
                <td colspan="4">
                    <div class="note">如果是同步转换，文件转换时间比较长，可能会出现web请求超时错误。
                        虽然最终可以完成转换，但只有用相同的key再次发送请求才能得到结果。</div>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="codePage" class="copy-link">codePage</td>
                <td>
                    定义从 <em>csv</em> 或 <em>txt</em> 格式转换时的文件编码。<br />
                    主要支持的值：
                    <ul>
                        <li><b>932</b> - 日语（Shift-JIS），</li>
                        <li><b>950</b> - 繁体中文 (Big5),</li>
                        <li><b>1250</b> - 中欧（Windows），</li>
                        <li><b>1251</b> - 西里尔字母 (Windows),</li>
                        <li><b>65001</b> - Unicode (UTF-8)。</li>
                    </ul>
                    您可以在 <a target="_blank" href="https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js">此文件</a>中找到所有支持的值。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="delimiter" class="copy-link">delimiter</td>
                <td>
                    定义从 <em>csv</em> 格式转换时用于分隔值的定界符。<br />
                    支持的值：
                    <ul>
                        <li><b>0</b> - 没有定界符，</li>
                        <li><b>1</b> - 制表符，</li>
                        <li><b>2</b> - 分号，</li>
                        <li><b>3</b> - 冒号，</li>
                        <li><b>4</b> - 逗号，</li>
                        <li><b>5</b> - 空格。</li>
                    </ul>
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="documentLayout" class="copy-link">documentLayout</td>
                <td>定义文档布局，该布局指定参数，用于说明将表单打印为 <em>pdf</em> 文档还是图像。</td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="drawPlaceHolders" class="copy-link">documentLayout.drawPlaceHolders</td>
                <td>定义是否将绘制占位符。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="drawFormHighlight" class="copy-link">documentLayout.drawFormHighlight</td>
                <td>定义表单是否突出显示。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="isPrint" class="copy-link">documentLayout.isPrint</td>
                <td>定义打印模式是打开还是关闭。此参数仅用于将 <em>docx/docxf</em> 转换为 <em>pdf</em>。
                    如果此参数等于 <b>true</b>，则使用 <em>drawPlaceHolders</em> 和 <em>drawFormHighlight</em> 标志，如上所述。
                    如果此参数为 <b>false</b>，则 <em>drawFormHighlight</em> 标志不起作用，并且 <em>drawPlaceHolders</em> 参数允许将表单保存为 <em>pdf</em> 格式。
                    默认值为 <b>false</b>。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="documentRenderer" class="copy-link">documentRenderer</td>
                <td>定义从 <em>pdf</em>, <em>xps</em>, <em>oxps</em>转换时的文档渲染器。</td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="textAssociation" class="copy-link">documentRenderer.textAssociation</td>
                <td>
                    定义可以具有以下值的渲染模式：
                    <ul>
                        <li>
                            <b>blockChar</b> - 所有文本都由单个字符转换。
                            每个字符都在自己的框中（如文本框），
                        </li>
                        <li>
                            <b>blockLine</b> - 所有文本都由单独的行转换。
                            每个文本行都在自己的框中。行可以在同一个块内组合，
                        </li>
                        <li>
                            <b>plainLine</b> - 所有文本都转换为纯文本。
                            但每一行都是一个单独的段落，
                        </li>
                        <li>
                            <b>plainParagraph</b> - 所有文本都转换为纯文本。
                            行被组合成段落。
                        </li>
                    </ul>
                    默认值为 <b>plainLine</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="filetype" class="copy-link">filetype<a href="#requiredDescr" class="required">*</a></td>
                <td>定义要转换的文档文件的类型。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>定义文档标识符,用于明确标识文档文件。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="outputtype" class="copy-link">outputtype<a href="#requiredDescr" class="required">*</a></td>
                <td>
                    定义生成的转换文档类型。
                    从 7.0 版开始，可以指定文件格式而不是扩展名。
                    当我们事先不知道需要什么扩展时使用它们：
                    <ul>
                        <li>
                            <b>ooxml</b> - 定义文件将被转换为 <em>docx</em>, <em>docm</em>, <em>xlsx</em>, <em>xlsm</em>, <em>pptx</em> 或 <em>pptm</em>。
                            例如，将 <em>doc</em> 文件转换为 OOXML 格式时，如果该文件包含宏，则生成的文件可以是 <em>docx</em> 或 <em>docm</em>（<em>xls</em> 和 <em>ppt</em> 也一样）。
                            它也适用于将 XML 文件转换为 OOXML 格式（<em>docx</em>, <em>xlsx</em> 或 <em>pptx</em> ，具体取决于内容）；
                        </li>
                        <li>
                            <b>odf</b> - 定义文件将被转换为 <em>odt</em>, <em>ods</em> 或 <em>odp</em>。
                            例如，它用于将 XML 文件转换为 ODF 格式（<em>odt</em>, <em>ods</em> 或 <em>odp</em>，具体取决于内容）。
                        </li>
                    </ul>
                </td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="password" class="copy-link">password</td>
                <td>如果文档文件受密码保护，则定义其密码。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="region" class="copy-link">region</td>
                <td>
                    定义从 <em>电子表格</em> 格式转换为 <em>pdf</em>时货币、日期和时间的默认显示格式。
                    使用四个字母（<b>en-US</b>、 <b>fr-FR</b>等）语言代码设置。
                    默认值为 <b>en-US</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr>
                <td id="spreadsheetLayout" class="copy-link">spreadsheetLayout</td>
                <td>定义将电子表格转换为 pdf 的设置。</td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow tablerow-note">
                <td colspan="4">
                    <div class="note">请注意，将电子表格转换为pdf或图像格式后，一次可以返回的最大页数不超过1500。</div>
                </td>
            </tr>
            <tr class="tablerow">
                <td id="fitToHeight" class="copy-link">spreadsheetLayout.fitToHeight</td>
                <td>
                    设置转换区域的高度，以页数为单位。默认值为0。
                    默认值为 <b>0</b>。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="fitToWidth" class="copy-link">spreadsheetLayout.fitToWidth</td>
                <td>
                    设置转换区域的宽度，以页数为单位。
                    默认值为0。默认值为 <b>0</b>。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="gridLines" class="copy-link">spreadsheetLayout.gridLines</td>
                <td>
                    允许在输出 PDF 文件中包含或不包含网格线。
                    默认值为 <b>false</b>。
                </td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="headings" class="copy-link">spreadsheetLayout.headings</td>
                <td>
                    允许在输出 PDF 文件中包含或不包含标题。
                    默认值为 <b>false</b>。
                </td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="ignorePrintArea" class="copy-link">spreadsheetLayout.ignorePrintArea</td>
                <td>
                    确定是否忽略为电子表格文件选择的打印区域。
                    默认值为 <b>true</b>。
                </td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="margins" class="copy-link">spreadsheetLayout.margins</td>
                <td>设置输出 PDF 文件的边距。</td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-bottom" class="copy-link">spreadsheetLayout.margins.bottom</td>
                <td>
                    设置输出 PDF 文件的下边距。默认值为19.1mm。
                    默认值为 <b>19.1mm</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-left" class="copy-link">spreadsheetLayout.margins.left</td>
                <td>
                    设置输出 PDF 文件的左边距。
                    默认值为 <b>17.8mm</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-right" class="copy-link">spreadsheetLayout.margins.right
                </td>
                <td>设置输出 PDF 文件的右边距。
                    默认值为 <b>17.8mm</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="margins-top" class="copy-link">spreadsheetLayout.margins.top</td>
                <td>
                    设置输出 PDF 文件的上边距。
                    默认值为 <b>19.1mm</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="orientation" class="copy-link">spreadsheetLayout.orientation</td>
                <td>
                    设置输出 PDF 文件的方向。
                    可以是 <b>横向打印格式</b>，也可以是 <b>纵向打印格式</b>。默认值为 <b>纵向打印格式</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="pageSize" class="copy-link">spreadsheetLayout.pageSize</td>
                <td>设置输出 PDF 文件的页面大小。</td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="pageSize-height" class="copy-link">spreadsheetLayout.pageSize.height</td>
                <td>
                    设置输出 PDF 文件的页面高度。
                    默认值为 <b>297mm</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="pageSize-width" class="copy-link">spreadsheetLayout.pageSize.width</td>
                <td>
                    设置输出 PDF 文件的页面宽度。
                    默认值为 <b>210mm</b>。
                </td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="scale" class="copy-link">spreadsheetLayout.scale</td>
                <td>
                    允许设置输出 PDF 文件的缩放比例。
                    默认值为 <b>100</b>。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail" class="copy-link">thumbnail</td>
                <td>在将图像格式（<em>bmp</em>, <em>gif</em>, <em>jpg</em>, <em>png</em>）指定为 <b>outputtype</b>时，定义缩略图的设置。</td>
                <td>对象</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-aspect" class="copy-link">thumbnail.aspect</td>
                <td>
                    定义使图像适合指定的高度和宽度的模式。
                    支持的值：
                    <ul>
                        <li><b>0</b> - 拉伸文件以适应高度和宽度，</li>
                        <li><b>1</b> - 保持图像的外观，</li>
                        <li>
                            <b>2</b> - 在这种情况下，不使用宽度和高度设置。
                            取而代之的是，页面的米制尺寸被转换为 96dpi 的像素。
                            例如，A4 (210x297mm) 页面将变成尺寸为 794x1123pix 的图片。
                        </li>
                    </ul>
                    默认值为 <b>2</b>。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-first" class="copy-link">thumbnail.first</td>
                <td>
                    定义是否应仅为首页或所有文档页面生成缩略图。
                    如果为 false，将创建包含所有页面缩略图的zip存档。
                    默认值为 <b>false</b>。
                </td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-height" class="copy-link">thumbnail.height</td>
                <td>
                    以像素为单位定义缩略图高度。
                    默认值为 <b>100</b>。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-width" class="copy-link">thumbnail.width</td>
                <td>
                    以像素为单位定义缩略图宽度。
                    默认值为 <b>100</b>。
                </td>
                <td>integer</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="title" class="copy-link">title</td>
                <td>定义转换后的文件名。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="token" class="copy-link">token</td>
                <td>以 <a href="<%= Url.Action("signature/body") %>#conversion">令牌</a>的形式定义添加到 <b>文档服务器</b> 配置的加密签名。</td>
                <td>string</td>
                <td>配置要求</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>
                    定义要转换的文档的绝对 URL。
                    使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">token</a>。
                    否则会出现错误。
                </td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark" class="copy-link">watermark</td>
                <td>定义一个 JSON 对象，其中包含水印的<a href="<%= Url.Action("global", "plugin") %>#watermark_on_draw">属性</a>
                    ,在转换过程中将其插入到 pdf 和图像文件中。</td>
                <td>object</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-transparent" class="copy-link">watermark.transparent</td>
                <td>定义水印透明度。</td>
                <td>float</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-type" class="copy-link">watermark.type</td>
                <td>定义<a href="<%= Url.Action("global", "DocBuilder") %>#ShapeType">形状类型</a>，指定当前水印的预设形状几何形状。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-width" class="copy-link">watermark.width</td>
                <td>定义以毫米为单位测量的水印宽度。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-height" class="copy-link">watermark.height</td>
                <td>定义以毫米为单位测量的水印高度。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-rotate" class="copy-link">watermark.rotate</td>
                <td>定义水印旋转角度（以度为单位）。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-margins" class="copy-link">watermark.margins</td>
                <td>定义水印形状中的文本边距（以毫米为单位）。</td>
                <td>数值数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-fill" class="copy-link">watermark.fill</td>
                <td>以 RGB 格式定义水印填充颜色，或图像的 URL（base64 支持：<em>data:image/png;...</em>）。
                    空数组[]表示水印没有填充。</td>
                <td>数值数组 | string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-stroke-width" class="copy-link">watermark.stroke-width</td>
                <td>定义以毫米为单位测量的水印描边宽度。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-stroke" class="copy-link">watermark.stroke</td>
                <td>以 RGB 格式定义水印描边颜色。 空数组[]表示水印笔划没有填充。</td>
                <td>数值数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-align" class="copy-link">watermark.align</td>
                <td>定义水印形状中的垂直文本对齐方式：<b>0</b> - 底部、<b>1</b> - 中心、<b>4</b> - 顶部。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs" class="copy-link">watermark.paragraphs</td>
                <td>使用当前水印中的段落及其属性定义数组。</td>
                <td>对象数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-align" class="copy-link">watermark.paragraphs.align</td>
                <td>定义当前段落中的水平文本对齐方式：<b>0</b> - 右、<b>1</b> - 左、<b>2</b> - 居中、<b>3</b > - 两端对齐。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-fill" class="copy-link">watermark.paragraphs.fill</td>
                <td>以 RGB 格式定义段落突出显示。 空数组[]表示该段落不突出显示。</td>
                <td>数值数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-linespacing" class="copy-link">watermark.paragraphs.linespacing</td>
                <td>定义当前段落中的文本行间距。</td>
                <td>number</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs" class="copy-link">watermark.paragraphs.runs</td>
                <td>定义包含当前段落中的runs及其属性的数组。</td>
                <td>对象数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-text" class="copy-link">watermark.paragraphs.runs.text</td>
                <td>定义run文本。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-fill" class="copy-link">watermark.paragraphs.runs.fill</td>
                <td>以 RGB 格式定义文本突出显示。 空数组[]表示文本不突出显示。</td>
                <td>数值数组</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-font-family" class="copy-link">watermark.paragraphs.runs.font-family</td>
                <td>定义文本字体系列。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-font-size" class="copy-link">watermark.paragraphs.runs.font-size</td>
                <td>定义以磅 (pt) 为单位测量的文本字体大小。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-bold" class="copy-link">watermark.paragraphs.runs.bold</td>
                <td>定义当前文本是否显示为粗体。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-italic" class="copy-link">watermark.paragraphs.runs.italic</td>
                <td>定义当前文本是否显示为斜体。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-strikeout" class="copy-link">watermark.paragraphs.runs.strikeout</td>
                <td>定义当前文本是否显示为删除线。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="watermark-paragraphs-runs-underline" class="copy-link">watermark.paragraphs.runs.underline</td>
                <td>定义当前文本是否显示下划线。</td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - 在下表中，您可以看到将文档转换为最知名的文件格式的可能性，其中 <b>输入格式</b> 列对应于 <b>filetype</b> 参数的值， <b>输出格式</b> 列对应于 <b>outputtype</b> 参数的值。</em></span>

    <h2 id="text-matrix" class="copy-link">文本文档文件格式</h2>
    <table class="table-conversion-matrix-text">
        <tbody>
            <tr class="scroll-arrow" style="margin-top:247px;"></tr>
            <tr>
                <th rowspan="2">输入格式</th>
                <th colspan="18">输出格式</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>docm</td>
                <td>docx</td>
                <td>docxf</td>
                <td>dotm</td>
                <td>dotx</td>
                <td>epub</td>
                <td>fb2</td>
                <td>gif</td>
                <td>html</td>
                <td>jpg</td>
                <td>odt</td>
                <td>ott</td>
                <td>pdf</td>
                <td>pdfa</td>
                <td>png</td>
                <td>rtf</td>
                <td>txt</td>
            </tr>
            <tr>
                <td>djvu</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>doc</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docm</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docxf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dot</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dotm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dotx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>epub</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fb2</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fodt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>htm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>html</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>mht</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>mhtml</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>odt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ott</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>oxps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pdf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>rtf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>stw</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>sxw</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>txt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>wps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>wpt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xml</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="spreadsheet-matrix" class="copy-link">电子表格文件格式</h2>
    <table class="table-conversion-matrix-spreadsheet">
        <tbody>
            <tr class="scroll-arrow" style="margin-top:150px;"></tr>
            <tr>
                <th rowspan="2">输入格式</th>
                <th colspan="13">输出格式</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>csv</td>
                <td>gif</td>
                <td>jpg</td>
                <td>ods</td>
                <td>ots</td>
                <td>pdf</td>
                <td>pdfa</td>
                <td>png</td>
                <td>xlsm</td>
                <td>xlsx</td>
                <td>xltm</td>
                <td>xltx</td>
            </tr>
            <tr>
                <td>csv</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>et</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ett</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fods</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ods</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ots</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>sxc</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xls</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsb</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xltm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xltx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>xml</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="presentation-matrix" class="copy-link">演示文稿格式</h2>
    <table class="table-conversion-matrix-presentation">
        <tr class="scroll-arrow" style="margin-top:183px;"></tr>
        <tbody>
            <tr>
                <th rowspan="2">输入格式</th>
                <th colspan="14">输出格式</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>gif</td>
                <td>jpg</td>
                <td>odp</td>
                <td>otp</td>
                <td>pdf</td>
                <td>pdfa</td>
                <td>png</td>
                <td>potm</td>
                <td>potx</td>
                <td>ppsm</td>
                <td>ppsx</td>
                <td>pptm</td>
                <td>pptx</td>
            </tr>
            <tr>
                <td>dps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dpt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fodp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>odp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>otp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pot</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>potm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>potx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppsm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppsx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pptm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pptx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>sxi</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div id="sample-conversion" class="header-gray copy-link">发送到 <b>文档转换服务</b> 的 JSON 对象示例，用于将文件从 <em>docx</em> 格式转换为 <em>pdf</em> 格式</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <div id="sample-password-conversion" class="header-gray copy-link">发送到 <b>文档转换服务</b> 的 JSON 对象示例，用于将受密码保护的文件从 <em>docx</em> 格式转换为 <em>pdf</em> 格式</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "password": "123456",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <div id="sample-watermark" class="header-gray copy-link">发送到<b>文档转换服务</b>的 JSON 对象示例，用于将文件从 <em>docx</em> 格式转换为插入水印的 <em>pdf</em> 格式</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx",
    "watermark": {
        "align": 1,
        "fill": [255, 0, 0],
        "height": 100,
        "margins": [ 10, 10, 10, 10 ],
        "paragraphs": [
            {
                "align": 2,
                "fill": [255, 0, 0],
                "linespacing": 1,
                "runs": [
                    {
                        "bold": true,
                        "italic": false,
                        "fill": [0, 0, 0],
                        "font-family": "Arial",
                        "font-size": 40,
                        "strikeout": false,
                        "text": "Watermark",
                        "underline": false
                    },
                    {
                        "text": "&lt;%br%&gt;"
                    }
                ]
            }
        ],
        "rotate": -45,
        "transparent": 0.3,
        "type": "rect",
        "stroke-width": 1,
        "stroke": [0, 0, 255],
        "width": 100
    }
}
</pre>
    <p>
        <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
        请参阅<a href="<%= Url.Action("howitworks") %>">工作原理</a>部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
    </p>

    <div id="sample-thumbnail" class="header-gray copy-link">发送到 <b>文档转换服务</b> 的 JSON 对象示例，用于生成 <em>docx</em> 格式的文件的 <em>png</em> 缩略图</div>
    <pre>
{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "png",
    "thumbnail": {
        "aspect": 0,
        "first": true,
        "height": 150,
        "width": 100
    },
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <div id="sample-spreadsheet-to-pdf" class="header-gray copy-link">发送到 <b>文档转换服务</b> 的 JSON 对象示例，用于将 <em>电子表格</em> 文件转换为 <em>pdf</em> 格式</div>
    <pre>
{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "region": "en-US",
    "spreadsheetLayout": {
        "ignorePrintArea": true,
        "orientation": "portrait",
        "fitToWidth": 0,
        "fitToHeight": 0,
        "scale": 100,
        "headings": false,
        "gridLines": false,
        "pageSize": {
        "width": "210mm",
        "height": "297mm"
        },
        "margins": {
        "left": "17.8mm",
            "right": "17.8mm",
            "top": "19.1mm",
            "bottom": "19.1mm"
        }
    },
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
}
    </pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <div id="sample-conversion-token" class="header-gray copy-link">JSON 对象示例包含发送到 <b>文档转换服务</b> 的 JSON Web Token，用于将文件从 <em>docx</em> 格式转换为 <em>pdf</em> 格式</div>
    <pre>
{
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
</pre>
    <p>
        其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <h2 id="response" class="copy-link">响应参数及其说明：</h2>
    <p>
        请求结果以 XML 格式返回。
        要接收 JSON 格式的响应，您需要在 HTTP 请求中使用 <b>application/json</b> 值指定 <em>Accept</em> 标头（从 4.3 版开始提供）。
        在形成结果文件的链接时，使用与转换请求相同的服务器名称。
    </p>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>参数</td>
                <td>描述</td>
                <td>类型</td>
                <td>示例</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="endConvert" class="copy-link">endConvert</td>
                <td>定义转换是否完成。</td>
                <td>boolean</td>
                <td>true</td>
            </tr>
            <tr class="tablerow">
                <td id="error" class="copy-link">error</td>
                <td>定义转换期间发生的错误。可以在 <a href="#error-codes">此处</a>找到可能的错误代码。</td>
                <td>integer</td>
                <td>-3</td>
            </tr>
            <tr class="tablerow">
                <td id="fileType" class="copy-link">fileType</td>
                <td>定义转换文件的扩展名。</td>
                <td>string</td>
                <td>"docm"</td>
            </tr>
            <tr class="tablerow">
                <td id="fileUrl" class="copy-link">fileUrl</td>
                <td>定义到已转换文档的链接。仅当 <em>endConvert</em> 参数设置为 <b>true</b>时才会接收到此参数。</td>
                <td>string</td>
                <td>"https://documentserver/url-to-converted-document.pdf"</td>
            </tr>
            <tr class="tablerow">
                <td id="percent" class="copy-link">percent</td>
                <td>定义文件转换的百分比。如果 <em>endConvert</em> 参数设置为 <b>true</b>，则 <em>percent</em> 等于 <b>100</b>。</td>
                <td>integer</td>
                <td>100</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">XML 格式的响应示例</div>
    <p>在形成结果文件的链接时，使用与转换请求相同的服务器名称。</p>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;EndConvert&gt;True&lt;/EndConvert&gt;
    &lt;FileType&gt;docm&lt;/FileType&gt;
    &lt;FileUrl&gt;https://documentserver/url-to-converted-document.pdf&lt;/FileUrl&gt;
    &lt;Percent&gt;100&lt;/Percent&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">JSON 格式的响应示例</div>
    <p>在形成到结果文件的链接时，使用与转换请求相同的服务器名称。</p>
    <pre>
{
    "endConvert": true,
    "fileType": "docm",
    "fileUrl": "https://documentserver/url-to-converted-document.pdf",
    "percent": 100
}
</pre>

    <div class="header-gray">XML 格式的异步请求（带有参数 <em>async=true</em>）的中间响应示例</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
    &lt;FileResult&gt;
    &lt;EndConvert&gt;False&lt;/EndConvert&gt;
    &lt;FileType&gt;&lt;/FileType&gt;
    &lt;FileUrl&gt;&lt;/FileUrl&gt;
    &lt;Percent&gt;95&lt;/Percent&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">JSON 格式的异步请求（带参数 <em>async=true</em>）的中间响应示例</div>
    <pre>
{
    "endConvert": false,
    "percent": 95
}
</pre>

    <div class="header-gray">XML 格式发生错误时的响应示例</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;Error&gt;-3&lt;/Error&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">JSON 格式发生错误时的响应示例</div>
    <pre>
{
    "error": -3
}
</pre>

    <div id="error-codes" class="copy-link header-gray">可能的错误代码及其描述</div>
    <table class="error-table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>错误代码</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>-1</td>
                <td>未知错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-2</td>
                <td>转换超时错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-3</td>
                <td>转换错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-4</td>
                <td>下载要转换的文档文件时出错。</td>
            </tr>
            <tr class="tablerow">
                <td>-5</td>
                <td>密码错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-6</td>
                <td>访问转换结果数据库时出错。</td>
            </tr>
            <tr class="tablerow">
                <td>-7</td>
                <td>输入错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-8</td>
                <td>令牌无效。</td>
            </tr>
            <tr class="tablerow">
                <td>-9</td>
                <td>当转换器无法自动确定输出文件格式时出错。 此错误意味着客户端必须明确指定文件应转换为哪种格式（文本文档或电子表格）。
                    它用于在 XML 类型未知的情况下将 XML 转换为 OOXML。</td>
            </tr>
            <%--<tr class="tablerow">
                <td>-21</td>
                <td>令牌签名已过期。</td>
            </tr>--%>
        </tbody>
    </table>
</asp:Content>
