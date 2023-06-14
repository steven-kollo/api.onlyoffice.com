<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Automation API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Automation API</span>
    </h1>

    <p class="dscr"><b>Connector</b> is a class that allows editing text documents, spreadsheets, presentations, and fillable forms from an external source.
        The examples of using Automation API can be found <a href="<%= Url.Action("interactingoutside") %>">here</a>.
    </p>
    <p>To create the connector, use the <a href="<%= Url.Action("methods") %>#createConnector">createConnector</a> method of the <b>document editor</b> object:</p>
    <pre>
var connector = docEditor.createConnector()
</pre>
    <note>
        <p>请注意，该连接器仅适用于 <b>ONLYOFFICE 开发者版</b>。</p>
        <p>该类是一个额外的功能，在支付额外的费用后才能使用。如果您有任何疑问，请联系我们的销售团队：<a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>。</p>
    </note>
    <p>连接器与插件具有相同的接口。下面可以找到可用于此类的方法。</p>

    <ul>
        <li><a href="#attachEvent">attachEvent</a> -添加事件侦听器。</li>
        <li><a href="#callCommand">callCommand</a> -将数据发送回编辑器。</li>
        <li><a href="#connect">connect</a> -将连接器连接到编辑器。</li>
        <li><a href="#detachEvent">detachEvent</a> -删除事件侦听器。</li>
        <li><a href="#disconnect">disconnect</a> -断开连接器与编辑器的连接。</li>
        <li><a href="#executeMethod">executeMethod</a> -使用连接器执行某些编辑器方法。</li>
    </ul>

    <h2>方法及其描述：</h2>
    <ul>
        <li>
            <p><b id="attachEvent" class="copy-link">attachEvent</b> -被调用以添加事件侦听器的函数，该函数将在指定事件传递到目标时被调用。
                所有可用事件的列表与插件的列表相同。可以在 <a href="<%= Url.Action("events", "plugin") %>">这里</a>找到。</p>
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
                    <tr class="tablerow">
                        <td>name</td>
                        <td>事件名称。</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>事件侦听器。</td>
                        <td>函数</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">示例</div>
            <pre>
connector.attachEvent("onChangeContentControl", function()
{
    console.log("event: onChangeContentControl");
});
</pre>
        </li>

        <li>
            <p><b id="callCommand" class="copy-link">callCommand</b> -调用的函数，用于将数据发送回编辑器。
                它允许连接器发送可以插入到结果文档文件中的结构化数据（
                格式化的段落、表格、文本部分和单独的单词等）。</p>
            <note><b>ONLYOFFICE 文档生成器</b> 命令只能用于创建内容并将其插入文档编辑器
                (使用 <em>Api.GetDocument().InsertContent(...))</em>。由于在线编辑器中的联合编辑功能，存在此限制。</note>
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
                    <tr class="tablerow">
                        <td>command</td>
                        <td>定义用JavaScript编写的命令，其目的是形成可插入结果文档文件（
                            格式化段落、表格、文本部分和单独单词等）的结构化数据。然后将数据发送给编辑器。
                            该命令必须与 <a href="<%= Url.Action("basic", "docbuilder") %>">ONLYOFFICE 文档生成器</a> 语法兼容。</td>
                        <td>函数</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>方法返回的结果。这是一个可选参数。</td>
                        <td>函数</td>
                    </tr>
                    <tr class="tablerow">
                        <td>isNoCalc</td>
                        <td>定义是否可以重新计算文档。<b>true</b> 值用于在执行
                            <em>command</em> 参数中的函数后重新计算文档。<b>false</b> 值不会重新计算文档
                            （仅当您的编辑肯定不需要重新计算文档时才使用它）。默认值为 <b>false</b>。</td>
                        <td>boolean</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <p>此方法在与其他JavaScript数据隔离的上下文中执行。如果需要将某些参数或其他数据传递给此方法，请使用 <a href="<%= Url.Action("scope", "plugin") %>">Asc.scope</a> 对象。</p>
            <div class="header-gray">示例</div>
            <pre>
Asc.scope.text = "Hello world!";

connector.callCommand(function() {

    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText(Asc.scope.text);
    oDocument.InsertContent([oParagraph]);

}, function() { console.log("callback command"); });
</pre>
        </li>

        <li>
            <p><b id="connect" class="copy-link">connect</b> - 调用该函数将连接器连接到编辑器。</p>
            <note>请注意，只有在使用 <a href="#disconnect">disconnect</a> 方法断开连接器并需要再次将其连接到编辑器时，
                才应调用此方法。创建连接器时，不需要使用 <em>connect</em> 方法，
                因为它会与 <a href="<%= Url.Action("methods") %>#createConnector">createConnector</a> 方法一起自动调用。</note>
            <div class="header-gray">示例</div>
            <pre>
connector.connect()
</pre>
        </li>

        <li>
            <p><b id="detachEvent" class="copy-link">detachEvent</b> - 调用该函数以删除事件侦听器。</p>
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
                    <tr class="tablerow">
                        <td>name</td>
                        <td>事件名称。</td>
                        <td>string</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">示例</div>
            <pre>
connector.detachEvent("onChangeContentControl");
</pre>
        </li>

        <li>
            <p><b id="disconnect" class="copy-link">disconnect</b> - 调用该函数以断开连接器与编辑器的连接。</p>
            <div class="header-gray">示例</div>
            <pre>
connector.disconnect()
</pre>
        </li>

        <li>
            <p><b id="executeMethod" class="copy-link">executeMethod</b> - 调用该函数以使用连接器执行某些编辑器方法。这些方法的完整列表与插件相同。
                可以在 <a href="<%= Url.Action("executemethod/", "plugin") %>">这里</a>找到。</p>
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
                    <tr class="tablerow">
                        <td>name</td>
                        <td>必须执行的特定方法的名称。</td>
                        <td>string</td>
                    </tr>
                    <tr class="tablerow">
                        <td>args</td>
                        <td>正在使用的方法具有的参数（如果有）。</td>
                        <td>array</td>
                    </tr>
                    <tr class="tablerow">
                        <td>callback</td>
                        <td>方法返回的结果。这是一个可选参数。</td>
                        <td>函数</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">示例</div>
            <pre>
connector.executeMethod("SetFormValue",[forms[i]["InternalId"],"OnlyOffice BANK"],null);
</pre>
        </li>
    </ul>

</asp:Content> 