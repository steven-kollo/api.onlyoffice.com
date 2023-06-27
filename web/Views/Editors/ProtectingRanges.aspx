<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    保护范围
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">保护范围</span>
    </h1>
    <p class="dscr">参考图和以下步骤说明了在 ONLYOFFICE Document Server 中保护电子表格范围的过程。</p>
    <img alt="保护范围" src="<%= Url.Content("~/content/img/editor/protect-ranges-scheme.svg") %>" />
    <ol>
        <li>用户在<b>文档编辑器</b>中打开<em>保护 -> 保护范围</em>，单击<em>新建</em>，然后开始在<em>中输入用户名 >谁可以编辑</em>字段。</li>
        <li><b>文档编辑器</b>向<b>文档管理器</b>发送请求，以获取允许编辑指定工作表范围的用户列表。</li>
        <li><b>文档管理器</b>将用户列表发送到<b>文档编辑器</b>，该列表将显示在<em>谁可以编辑</em>字段下。</li>
        <li>用户在<b>文档编辑器</b>的<em>新建范围</em>窗口的相应字段中指定范围标题和地址，然后单击<em>确定</em>添加 将此范围添加到受保护范围列表。</li>
    </ol>

    <h2 id="apply" class="copy-link">如何在实践中做到这一点</h2>
     <ol>
         <li>创建一个空的 <em>html</em> 文件来<a href="<%= Url.Action("open") %>#apply">打开文档</a>。</li>
         <li>
             <p>
                 在文档编辑器初始化的配置脚本中，指定事件处理程序以显示授予访问权限的用户列表
                 编辑指定的电子表格范围。 当用户打开“保护”->“保护范围”时，单击“新建”，并开始在“谁可以编辑”字段中输入内容，
                 调用 <a href="<%= Url.Action("config/events") %>#onRequestUsers">onRequestUsers</a> 事件，用户可以选择其他用户以允许他们编辑此范围。
                 具有 <em>protect</em> 操作类型的 <em>data.c</em> 参数在此事件中传递。
             </p>
             <img alt="授予访问权限" src="<%= Url.Content("~/content/img/editor/protect-range.png") %>" />
            <pre>
var onRequestUsers = function(event) {
    docEditor.setUsers({
        "c": event.data.c,
        "users": [
            {
                "email": "john@example.com",
                "id": "78e1e841",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
            ...
        ]
    });
};

var docEditor = new DocsAPI.DocEditor("placeholder", {
    "events": {
        "onRequestUsers": onRequestUsers,
        ...
    },
    ...
});
</pre>
        </li>
        <li>
            <p>
                为了设置“谁可以编辑”字段下的用户列表，必须调用 <a href="<%= Url.Action("methods") %>#setUsers">setUsers</a> 方法：
            </p>
            <pre>
docEditor.setUsers({
    "c": "protect",
    "users": [
        {
            "email": "john@example.com",
            "id": "78e1e841",
            "name": "John Smith"
        },
        {
            "email": "kate@example.com",
            "id": "F89d8069ba2b",
            "name": "Kate Cage"
        },
        ...
    ]
});
</pre>
            <p>
                其中 <b>example.com</b> 是安装<b>文档管理器</b>和<b>文档存储服务</b>的服务器的名称。
                 请参阅<a href="<%= Url.Action("howitworks") %>">工作原理</a>部分，了解有关文档服务器服务客户端与服务器交互的更多信息。
            </p>
        </li>
    </ol>

</asp:Content>
