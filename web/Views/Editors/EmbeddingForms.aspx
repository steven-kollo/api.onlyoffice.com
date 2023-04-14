<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    将表单嵌入网页
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">将表单嵌入网页</span>
    </h1>
    <p class="dscr">从7.0版开始，ONLYOFFICE Docs提供了创建、编辑和协作编辑在线表单、填写表单以及将表单保存为PDF的可能性。</p>
    <p>ONLYOFFICE表格有两种主要格式。DOCXF用于从空白或任何现有的DOCX文件创建表单模板。
        OFORM格式用于填写准备好的表单。</p>
    <p>这些说明可以帮助您将在线表单添加到网站，使其可以以PDF格式填写和下载。</p>
    <note>请注意，这些说明仅在JWT被禁用时有效。从7.2版本开始，默认情况下会启用JWT，因此需要禁用它。
        有关令牌的更多信息可以 <a href="<%= Url.Action("signature/") %>">在此</a>处找到。</note>

    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="editing">编辑表单</li>
            <li class="browser tab copy-link" id="filling">填写表单</li>
        </ul>
        <div id="editing" class="content active">
            <h2 id="docxf" class="copy-link">如何从网站打开DOCXF进行编辑</h2>
            <p>要在您的网站上打开DOCXF格式的在线表单进行编辑，请执行以下步骤：</p>
            <ol>
                <li>查找并打开ONLYOFFICE文档的 <em>index.html</em> 文件。</li>
                <li>
                    <p>通过指定API JavaScript文件的路径将其连接到Document Server API：</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                </li>
                <li>
                    <p>添加 <em>button</em> 元素以打开表单模板：</p>
                    <pre>
&lt;button onclick="open_form_template()"&gt;打开表单模板&lt;/button&gt;
</pre>
                </li>
                <li>
                    <p>在将打开编辑器的位置添加 <em>div</em> 元素：</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>如果编辑器是打开的，添加脚本以关闭编辑器：</p>
                    <pre>
if (this.docEditor)
    { this.docEditor.destroyEditor()
}
</pre>
                </li>
                <li>
                    <p>创建需要打开的表单模板的完整URL地址：</p>
                    <pre>
const url = "https://example.com/url-to-example-document.docxf";
</pre>
                </li>
                <li>
                    <p>创建key以标识要共同编辑的文件：</p>
                    <pre>
const key = filename + ".docxf";
</pre>
                </li>
                <li>
                    <p>使用要打开的文档的配置，添加初始化文档编辑器的脚本，并在placeholder元素中打开编辑器：</p>
                    <pre>
this.docEditor = new DocsAPI.DocEditor("placeholder",
{
    "document": {
        "fileType": "docxf",
        "key": key,
        "title": "Form Template",
        "url": url
    },
    "documentType": "word"
});
</pre>
                </li>
            </ol>
            <p>完整的代码片段如下所示：</p>
            <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
&lt;button onclick="open_form_template()"&gt;Open Form Template&lt;/button&gt;
&lt;div id="placeholder"&gt;&lt;/div&gt;
&lt;script&gt;
    function open_form_template() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-document.docxf";
        const key = filename + ".docxf";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "docxf",
                "key": key,
                "title": "Form Template",
                "url": url
            },
            "documentType": "word"
        });
    }
&lt;/script&gt;
</pre>
            <p>完成后，可以打开表单模板进行编辑。编辑此文件后，您可以获得表单本身。要执行此操作，请单击 <b>另存为</b> 按钮。</p>
            <img alt="嵌入docxf" src="<%= Url.Content("~/content/img/editor/embed-docxf.png") %>" />
        </div>
        <div id="filling" class="content">
            <h2 id="oform" class="copy-link">如何从网站打开OFORM进行填写</h2>
            <p>要使OFORM格式的在线表单可以从您的网站以PDF格式填写和下载，请遵循以下步骤：</p>
            <ol>
                <li>查找并打开ONLYOFFICE文档的 <em>index.html</em> 文件。</li>
                <li>
                    <p>通过指定API JavaScript文件的路径将其连接到Document Server API：</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                </li>
                <li>
                    <p>添加 <em>button</em> 元素以打开表单：</p>
                    <pre>
&lt;button onclick="open_form()"&gt;打开表单&lt;/button&gt;
</pre>
                </li>
                <li>
                    <p>在将打开编辑器的位置添加 <em>div</em> 元素：</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>如果编辑器是打开的，添加脚本以关闭编辑器：</p>
                    <pre>
if (this.docEditor) {
    this.docEditor.destroyEditor()
}
</pre>
                </li>
                <li>
                    <p>创建需要打开的表单模板的完整URL地址：</p>
                    <pre>
const url = "https://example.com/url-to-example-document.oform";
</pre>
                </li>
                <li>
                    <p>创建用于标识文件的key</p>
                    <pre>
const key = filename + ".oform";
</pre>
                    <note>请注意， <em>key</em> 字段不会传递给编辑器的配置。该字段将自动生成为一个随机数。
                        这使得打开表单的所有会话都是独立的。因此，OFORM文件上的协作被禁用。
                        这就是为什么任何人都可以在不打扰他人的情况下打开表单并填写。</note>
                </li>
                <li>
                    <p>使用要打开的文档的配置，添加初始化文档编辑器的脚本，并在placeholder元素中打开编辑器：</p>
                    <pre>
this.docEditor = new DocsAPI.DocEditor("placeholder",
{
    "document": {
        "fileType": "oform",
        "title": "Form",
        "url": url
    },
    "documentType": "word"
});
</pre>
                </li>
            </ol>
            <p>完整的代码片段如下所示：</p>
            <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
&lt;button onclick="open_form()"&gt;Open Form&lt;/button&gt;
&lt;div id="placeholder"&gt;&lt;/div&gt;
&lt;script&gt;
    function open_form() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-document.oform";
        const key = filename + ".oform";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "oform",
                "title": "Form",
                "url": url
            },
            "documentType": "word"
        });
    }
&lt;/script&gt;
</pre>
            <p>完成后，可以打开表单进行填写。填写完字段（必填字段用红色边框突出显示）后，您可以获得一个PDF文件。
                要执行此操作，请单击 <b>&ldquo;另存为PDF&rdquo;</b> 按钮。</p>
            <img alt="嵌入oform" src="<%= Url.Content("~/content/img/editor/embed-oform.png") %>" />
        </div>
    </div>

    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
        var loc = window.location.hash;
        if (loc != "") {
            var id = loc.substring(1);;
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="'+id  +'"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="'+id  +'"]').addClass('active');
        }
    </script>

</asp:Content>
