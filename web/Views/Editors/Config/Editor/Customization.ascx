<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var license = !string.IsNullOrEmpty(Page.Request["license"]); %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">定制</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">自定义部分允许自定义编辑器界面，使其看起来像您的其他产品（如果有），并更改是否出现附加按钮、链接、更改徽标和编辑器所有者详细信息。</p>

<ul class="columns-4" style="list-style: none;">
    <% if (license)
       { %>
    <li><a href="#about">about</a></li>
    <% } %>
    <li><a href="#anonymous">anonymous</a></li>
    <li><a href="#autosave">autosave</a></li>
    <li><a href="#chat">chat</a></li>
    <li><a href="#commentAuthorOnly">commentAuthorOnly</a></li>
    <li><a href="#comments">comments</a></li>
    <li><a href="#compactHeader">compactHeader</a></li>
    <li><a href="#compactToolbar">compactToolbar</a></li>
    <li><a href="#compatibleFeatures">compatibleFeatures</a></li>
    <li><a href="#customer">customer</a></li>
    <li><a href="#features">features</a></li>
    <li><a href="#feedback">feedback</a></li>
    <% if (license)
       { %>
    <li><a href="#font">font</a></li>
    <% } %>
    <li><a href="#forcesave">forcesave</a></li>
    <li><a href="#goback">goback</a></li>
    <li><a href="#help">help</a></li>
    <li><a href="#hideNotes">hideNotes</a></li>
    <li><a href="#hideRightMenu">hideRightMenu</a></li>
    <li><a href="#hideRulers">hideRulers</a></li>
    <li><a href="#integrationMode">integrationMode</a></li>
    <% if (license)
       { %>
    <li><a href="#layout">layout</a></li>
    <li><a href="#leftMenu">leftMenu</a></li>
    <li><a href="#loaderLogo">loaderLogo</a></li>
    <li><a href="#loaderName">loaderName</a></li>
    <% } %>
    <li><a href="#logo">logo</a></li>
    <li><a href="#macros">macros</a></li>
    <li><a href="#macrosMode">macrosMode</a></li>
    <li><a href="#mentionShare">mentionShare</a></li>
    <li><a href="#plugins">plugins</a></li>
    <li><a href="#review">review</a></li>
    <li><a href="#reviewDisplay">reviewDisplay</a></li>
    <% if (license)
       { %>
    <li><a href="#rightMenu">rightMenu</a></li>
    <% } %>
    <li><a href="#showReviewChanges">showReviewChanges</a></li>
    <li><a href="#spellcheck">spellcheck</a></li>
    <% if (license)
       { %>
    <li><a href="#statusBar">statusBar</a></li>
    <li><a href="#toolbar">toolbar</a></li>
    <% } %>
    <li><a href="#toolbarHideFileName">toolbarHideFileName</a></li>
    <li><a href="#toolbarNoTabs">toolbarNoTabs</a></li>
    <li><a href="#trackChanges">trackChanges</a></li>
    <li><a href="#uiTheme">uiTheme</a></li>
    <li><a href="#unit">unit</a></li>
    <li><a href="#zoom">zoom</a></li>
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
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="about" class="copy-link">about<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义 <b>关于</b> 菜单按钮显示还是隐藏。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <% } %>
        <tr>
            <td id="anonymous" class="copy-link">anonymous</td>
            <td>
                添加对匿名名称的请求：
                <ul>
                    <li>
                        <b>request</b> - 定义是否发送请求。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>label</b> - 添加到用户名的后缀。
                        默认值为 <b>Guest</b>，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："Guest"；
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "request": true,
    "label": "Guest"
}</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/anonymous.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="autosave" class="copy-link">autosave</td>
            <td>
                定义 <b>自动保存</b> 菜单选项是启用还是禁用。
                如果设置为 <b>false</b>，则只能选择 <b>Strict</b> 共同编辑模式，因为 <b>Fast</b> 在没有自动保存的情况下不起作用。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.autosave</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="chat" class="copy-link">chat</td>
            <td>
                定义 <b>聊天</b> 菜单按钮是显示还是隐藏。
                请注意，如果您隐藏 <b>聊天</b> 按钮，相应的聊天功能也将被禁用。
                默认值为 <b>true</b>。
                自 7.1 版起已弃用，请改用 <a href="<%= Url.Action("config/document/permissions") %>#chat">document.permissions.chat</a> 参数。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/chat.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="commentAuthorOnly" class="copy-link">commentAuthorOnly</td>
            <td>
                定义用户是否只能编辑和删除他的评论。
                默认值为 <b>false</b>。
                自 6.3 版起已弃用，请改用 <a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">document.permissions.editCommentAuthorOnly</a> 和 <a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">document.permissions.deleteCommentAuthorOnly</a> 字段。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="comments" class="copy-link">comments</td>
            <td>
                定义 <b>注释</b> 菜单按钮是显示还是隐藏。
                请注意，如果您隐藏 <b>评论</b> 按钮，则相应的评论功能将仅供查看，无法添加和编辑评论。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="compactHeader" class="copy-link">compactHeader</td>
            <td>
                定义附加操作按钮是显示在编辑器窗口标题的上部靠近徽标 (<b>false</b>) 还是显示在工具栏 (<b>true</b>) 中，使标题更紧凑。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/compactHeader.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="compactToolbar" class="copy-link">compactToolbar</td>
            <td>
                定义显示的顶部工具栏类型是完整的 (<b>false</b>) 还是紧凑的 (<b>true</b>)。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.compactToolbar</em> 参数发送的任何值。</div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/compactToolbar.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="compatibleFeatures" class="copy-link">compatibleFeatures</td>
            <td>
                定义仅与 OOXML 格式兼容的功能的使用。
                例如，不要对整个文档使用注释。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr>
            <td id="customer" class="copy-link">customer<a href="#requiredDescr" class="required">*</a></td>
            <td>
                包含将在编辑器 <b>关于</b> 部分中显示的信息，并对所有编辑器用户可见。
                该对象具有以下参数：
                <ul>
                    <li>
                        <b>address</b> - 允许访问编辑或编辑作者的公司或个人的邮政地址，
                        <br />
                        <b>类型</b>：字符串，
                        <br />
                        <b>示例</b>："My City, 123a-45"；
                    </li>
                    <li>
                        <b>info</b> - 关于您希望其他人知道的公司或个人的一些附加信息，
                        <br />
                        <b>类型</b>：字符串，
                        <br />
                        <b>示例</b>："Some additional information";
                    </li>
                    <li>
                        <b>logo</b> - 图片 logo 的路径（这个文件没有特别推荐，但是如果是透明背景的 <em>.png</em> 格式会更好）。
                        图片必须具有以下尺寸：432x70，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/logo-big.png"。
                    </li>
                    <li>
                        <b>logoDark</b> - 深色主题图像徽标的路径（此文件没有特别建议，但如果是透明背景的 <em>.png</em> 格式会更好）。
                        图片必须具有以下尺寸：432x70，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/dark-logo-big.png"。
                    </li>
                    <li>
                        <b>mail</b> - 允许访问编辑或编辑作者的公司或个人的电子邮件地址，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："john@example.com".
                    </li>
                    <li>
                        <b>name</b> - 授予编辑或编辑作者访问权限的公司或个人的名称，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："John Smith and Co."；
                    </li>
                    <li>
                        <b>phone</b>-允许访问编辑或编辑作者的公司或个人的电话，
                        <br/>
                        <b>类型</b>：string，
                        <br/>
                        <b>示例</b>："123456789"；
                    </li>
                    <li>
                        <b>www</b> - 上述公司或个人的主页地址，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："example.com"。
                    </li>
                </ul>
            </td>
            <td>对象</td>
            <td>{
    "address": "My City, 123a-45",
    "info": "Some additional information",
    "logo": "https://example.com/logo-big.png",
    "logoDark": "https://example.com/dark-logo-big.png",
    "mail": "john@example.com",
    "name": "John Smith and Co.",
    "phone": "123456789",
    "www": "example.com"
}</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/customer.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="features" class="copy-link">features</td>
            <td>
                如果可能，定义用户可以禁用或自定义的参数：
                <ul>
                    <li>
                        <b>spellcheck</b> - 定义在加载编辑器时拼写检查器是自动打开还是关闭。
                        如果此参数为布尔值，则将其设置为初始拼写检查值，并且不会隐藏拼写检查设置。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：object 或 boolean，
                        <br />
                        <b>例如</b>：true；
                    </li>
                    <li>
                        <b>spellcheck.mode</b> - 定义在加载编辑器时拼写检查器是自动打开还是关闭。
                        此参数仅适用于文档编辑器和演示文稿编辑器，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <% if (license)
                       { %>
                    <li>
                        <b>spellcheck.change<a href="#requiredDescr2" class="required">**</a></b> - 定义拼写检查器设置是否显示拼写检查器设置在所有编辑器中可用,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                    <% } %>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "spellcheck": {
        "mode": true<% if (license)
        { %>,
        "change": true<% } %>
    }
}</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改 <em>拼写检查</em> 设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.features.spellcheck</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="feedback" class="copy-link">feedback</td>
            <td>
                定义 <b>反馈和支持</b> 菜单按钮的设置。
                可以是布尔值（仅显示或隐藏 <b>反馈和支持</b> 菜单按钮）或对象。
                在对象类型的情况下，以下参数可用：
                <ul>
                    <li>
                        <b>url</b> - 单击 <b>反馈和支持</b> 菜单按钮时将打开的网站绝对URL，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com"；
                    </li>
                    <li>
                        <b>visible</b> - 显示或隐藏 <b>反馈和支持</b> 菜单按钮，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true。
                    </li>
                </ul>
                默认值为 <b>false</b>。
            </td>
            <td>boolean 或 object</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/feedback.png") %>" alt="" />
            </td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="font" class="copy-link">font<a href="#requiredDescr2" class="required">**</a></td>
            <td>
               定义界面元素（按钮、选项卡等）的字体：
                <ul>
                    <li>
                        <b>name</b> - 字体名称,
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>: "Arial";
                    </li>
                    <li>
                        <b>size</b> - 字体大小,
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>: "11px".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "name": "Arial", "size": "11px"
}</td>
        </tr>
        <% } %>
        <tr>
            <td id="forcesave" class="copy-link">forcesave</td>
            <td>
                在 <b>文档编辑服务</b> 中保存文档时（例如单击 <b>保存</b> 按钮等），将文件强制保存请求添加到 <a href="<%= Url.Action("callback") %>#forcesavetype">回调处理程序</a>。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.forcesave</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="goback" class="copy-link">goback</td>
            <td>
                定义 <b>打开文件位置</b> 菜单按钮和右上角按钮的设置。
                该对象具有以下参数：
                <ul>
                    <li>
                        <b>Blank</b> - 单击 <b>打开文件位置</b>按钮时，在新浏览器选项卡/窗口（如果值设置为 <b>true</b>）或当前选项卡（如果值设置为 <b>false</b> ）中打开网站。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>requestClose</b> - 定义如果单击打开文件位置按钮，将调用 <a href="<%= Url.Action("config/events") %>#onRequestClose">events.onRequestClose</a> 事件而不是打开浏览器选项卡或窗口。
                        默认值为 <b>false</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：false；
                    </li>
                    <li>
                        <b>text</b> - <b>打开文件位置</b> 菜单按钮和右上角按钮显示的文本（也就是说，不是 <em>转到文档</em>），
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："打开文件位置"；
                    </li>
                    <li>
                        <b>url</b> - 单击 <b>打开文件位置</b> 菜单按钮时将打开的网站绝对 URL，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>例如</b>："https://example.com"。
                    </li>
                </ul>
            </td>
            <td>boolean 或 object</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/goback.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="help" class="copy-link">help</td>
            <td>
                定义 <b>帮助</b> 菜单按钮是显示还是隐藏。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/help.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="hideNotes" class="copy-link">hideNotes</td>
            <td>
                定义注释面板在首次加载时是显示还是隐藏。
                默认值为 <b>false</b>。此参数仅适用于演示文稿编辑器。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.hideNotes</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/hideNotes.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="hideRightMenu" class="copy-link">hideRightMenu</td>
            <td>
                定义第一次加载时是否显示或隐藏右侧菜单。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.hideRightMenu</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="hideRulers" class="copy-link">hideRulers</td>
            <td>
                定义编辑器标尺是显示还是隐藏。
                此参数可用于文档和演示文稿编辑器。文档编辑器的默认值为 <b>false</b>，演示文稿的默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/hideRulers.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="integrationMode" class="copy-link">integrationMode</td>
            <td>
               定义将编辑器嵌入网页的模式。
                 <b>embed</b> 值禁止在加载编辑器框架时滚动到编辑器框架，因为焦点未被捕获。
            </td>
            <td>string</td>
            <td>embed</td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="layout" class="copy-link">layout<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义用户可用于隐藏界面元素但不完全禁用功能的参数（
                例如，如果此功能可从其他元素（如关联菜单）或通过热键获得）：
                <ul>
                    <li>
                        <b>header</b> - 定义编辑器标题设置，
                        <br />
                        <b>类型</b>：object，
                    </li>
                    <li>
                        <b>header.save</b> - 定义编辑器标题中的保存按钮是显示还是隐藏。默认值为 <b>true</b>。
                        请注意，当 <a href="#compactHeader">compactHeader</a> 参数设置为 <b>false</b>时，将使用此设置，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>header.users</b> - 定义是否显示或隐藏带有编辑用户的按钮。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>leftMenu</b> - 定义左菜单设置。如果此参数是布尔值，则指定是显示还是隐藏左侧菜单。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：object或boolean，
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>leftMenu.mode</b> - 定义左侧面板可见性的初始值 - 显示或隐藏。
                         它用于 <b>视图</b> 选项卡上的<b>左侧面板</b> 菜单选项。
                         默认值为<b>真</b>，
                        <br />
                        <b>类型</b>: boolean,
                        <br />
                        <b>示例</b>: true;
                    </li>
                    <li>
                        <b>leftMenu.navigation</b> - 定义 <b>导航</b> 按钮是显示还是隐藏。默认值为 <b>true</b>。
                        此参数仅适用于文档编辑器，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>leftMenu.spellcheck</b> -定义 <b>拼写检查</b> 按钮是显示还是隐藏。
                        默认值为 <b>true</b>。此参数仅适用于电子表格编辑器，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>rightMenu</b> - 定义右侧菜单设置。 如果此参数为布尔值，则指定是否显示或隐藏右侧菜单。
                         默认值为 <b>true</b>,
                        <br />
                        <b>类型</b>: object 或 boolean,
                        <br />
                        <b>示例</b>: true;
                    </li>
                    <li>
                        <b>rightMenu.mode</b> - 定义右侧面板可见性的初始值 - 显示或隐藏。
                         它用于<b>视图</b> 选项卡上的<b>右侧面板</b> 菜单选项。
                         默认值为 <b>true</b>,
                        <br />
                        <b>类型</b>: boolean,
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>statusBar</b> - 定义状态栏设置。
                        如果此参数是布尔值，则指定是显示还是隐藏状态栏。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：object或boolean，
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>statusBar.actionStatus</b> - 定义动作状态是显示还是隐藏。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>statusBar.docLang</b> - 定义是显示还是隐藏用于选择文档语言的按钮。默认值为 <b>true</b>。
                        此参数仅适用于文档编辑器和演示文稿编辑器，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>statusBar.textLang</b> - 定义用于选择文本语言的按钮是显示还是隐藏。
                        默认值为 <b>true</b>。此参数仅适用于文档编辑器和演示文稿编辑器，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar</b> - 定义工具栏设置。
                        如果此参数是布尔值，则指定是显示还是隐藏工具栏。
                        默认值为 <b>true</b>，
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.collaboration</b> - 定义是显示还是隐藏 <b>协作</b> 选项卡。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.draw</b> - 定义是否显示或隐藏<b>绘图</b>选项卡。
                         默认值为<b>true</b>，
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.file</b> - 定义 <b>文件</b> 选项卡设置。如果此参数是布尔值，
                        则指定是显示还是隐藏 <b>文件</b> 选项卡。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：object 或 boolean，
                        <br />
                        <b>例如</b>：true；
                    </li>
                    <li>
                        <b>toolbar.file.close</b> - 定义 <b>关闭菜单</b> 选项是显示还是隐藏。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.file.info</b> - 定义是显示还是隐藏 <b>文档信息</b> 选项。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.file.save</b> - 定义 <b>保存</b> 选项是显示还是隐藏。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.file.settings</b> - 定义是显示还是隐藏 <b>高级设置</b> 选项。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.home</b> - 定义 <b>主页</b> 选项卡设置。无法隐藏此选项卡，
                        <br />
                        <b>类型</b>：object，
                    </li>
                    <li>
                        <b>toolbar.home.mailmerge</b> - 定义用于选择邮件合并基的按钮是显示还是隐藏。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.layout</b> - 定义 <b>布局</b> 选项卡是显示还是隐藏。此参数仅适用于文档编辑器和电子表格编辑器。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.plugins</b> - 定义 <b>插件</b> 选项卡是显示还是隐藏。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.protect</b> - 定义 <b>保护</b> 选项卡是显示还是隐藏。默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.references</b> - 定义是显示还是隐藏 <b>参考</b> 选项卡。此参数仅适用于文档编辑器。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true；
                    </li>
                    <li>
                        <b>toolbar.save</b> - 定义工具栏上的 <b>保存</b> 按钮是显示还是隐藏。默认值为 <b>true</b>。
                        请注意，当 <a href="#compactHeader">compactHeader</a> 参数设置为 <b>true</b>时，将使用此设置，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>例如</b>：true；
                    </li>
                    <li>
                        <b>toolbar.view</b> - 定义 <b>视图</b> 选项卡设置。如果此参数是布尔值，则指定是显示还是隐藏 <b>视图</b> 选项卡。
                        默认值为 <b>true</b>，
                        <br />
                        <b>类型</b>：object 或 boolean，
                        <br />
                        <b>例如</b>：true；
                    </li>
                    <li>
                        <b>toolbar.view.navigation</b> - 定义 <b>导航</b> 按钮是显示还是隐藏。
                        默认值为 <b>true</b>。此参数仅适用于文档编辑器，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>例如</b>：true.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "header": {
        "save": true,
        "users": true
    },
    "leftMenu": {
        "mode": true,
        "navigation": true,
        "spellcheck": true
    },
    "rightMenu": {
        "mode": true
    },
    "statusBar": {
        "actionStatus": true,
        "docLang": true,
        "textLang": true
    },
    "toolbar": {
        "collaboration": true,
        "draw": true,
        "file": {
            "close": true,
            "info": true,
            "save": true,
            "settings": true
        },
        "home": {
            "mailmerge": true
        },
        "layout": true,
        "plugins": true,
        "protect": true,
        "references": true,
        "save": true,
        "view": {
            "navigation": true
        }
    }
}</td>
        </tr>
        <tr>
            <td id="leftMenu" class="copy-link">leftMenu<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义左侧菜单面板是显示还是隐藏。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.1 版起已弃用。请使用布局。改为 <a href="#layout">layout.leftMenu</a> 参数。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="loaderLogo" class="copy-link">loaderLogo<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义加载文档时将显示的图像徽标的路径（对于此文件没有特别的建议，但最好使用透明背景的.png格式）。
                当在编辑器中显示时，图像将按比例调整到160像素的高度。
            </td>
            <td>string</td>
            <td>"https://example.com/loader-logo.png"</td>
        </tr>
        <tr class="tablerow">
            <td id="loaderName" class="copy-link">loaderName<a href="#requiredDescr2" class="required">**</a></td>
            <td>定义加载文档时将显示的文本。</td>
            <td>string</td>
            <td>"正在加载文档，请稍候…"</td>
        </tr>
        <% } %>
        <tr class="tablerow">
            <td id="logo" class="copy-link">logo<a href="#requiredDescr" class="required">*</a></td>
            <td>
                更改编辑器标题左上角的图像文件。
                推荐的图像高度为 20 像素。
                该对象具有以下参数：
                <ul>
                    <li>
                        <b>image</b> - 用于在通用工作模式（即所有编辑器的查看和编辑模式）或嵌入模式（请参阅 <a href="<%= Url.Action("config/") %>#type">配置</a> 部分以了解如何定义 <b>嵌入</b> 文档类型）中显示的图像文件的路径。
                        图片必须具有以下尺寸：172x40，172x40，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/logo.png"；
                    </li>
                    <li>
                        <b>imageDark</b> - 用于深色主题的图像文件的路径。
                        图片必须具有以下尺寸：172x40，172x40，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/dark-logo.png"；
                    </li>
                    <li>
                        <b>imageEmbedded</b> - 用于以嵌入模式显示的图像文件的路径（请参阅 <a href="<%= Url.Action("config/") %>#type">配置</a> 部分以了解如何定义 <b>嵌入</b> 文档类型）。
                        图片必须具有以下尺寸：248x40。
                        自 7.0 版起已弃用，请改用 <em>图像</em> 字段，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com/logo_em.png"；
                    </li>
                    <li>
                        <b>url</b> - 当有人单击徽标图像时将使用的绝对 URL（可用于访问您的网站等）。
                        保留为空字符串或 <em>null</em> 以使徽标不可点击，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："https://example.com"。
                    </li>
                </ul>
            </td>
            <td>对象</td>
            <td>{
    "image": "https://example.com/logo.png",
    "imageDark": "https://example.com/dark-logo.png",
    "url": "https://example.com"
}</td>
        </tr>
        <tr class="tablerow">
            <td id="macros" class="copy-link">macros</td>
            <td>
              定义当编辑器打开时是否自动运行文档宏。
              默认值为 <b>true</b>。<b>false</b>值对用户隐藏<a href="#macrosMode">宏设置</a>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="macrosMode" class="copy-link">macrosMode</td>
            <td>
                定义启用自动开始时的宏运行模式。
                可以取以下值：
                <ul>
                    <li><b>disable</b> - 不自动运行所有宏；</li>
                    <li><b>enable</b> - 自动运行所有宏；</li>
                    <li><b>warn</b> - 对运行宏发出警告并请求运行它们的权限。</li>
                </ul>
                默认值为 <b>warn</b>。
            </td>
            <td>string</td>
            <td>warn</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.macrosMode</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="mentionShare" class="copy-link">mentionShare</td>
            <td>
                定义在评论中提及后描述事件的提示。
                如果为 <b>true</b>，则提示表示用户将收到通知并访问文档。
                如果为 <b>false</b>，则提示表示用户将仅收到提及通知。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果设置了 <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> 事件 ，它将仅可用于评论。</div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/mentionShare.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="plugins" class="copy-link">plugins</td>
            <td>
                定义 <a href="<%= Url.Action("basic", "plugin") %>">插件</a> 是否将启动并可用。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="review" class="copy-link">review
            </td>
            <td>包含有关审阅模式的信息。
                该对象具有以下参数：
                <ul>
                    <li>
                        <b>hideReviewDisplay</b> - 定义 <b>显示模式</b> 按钮是在 <b>协作</b> 选项卡上显示还是隐藏。
                        默认值为 <b>false</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：false；
                    </li>
                    <li>
                        <b>hoverMode</b> - 定义评论显示模式：通过悬停更改（<b>true</b>）
                        在工具提示中显示评论，或者通过单击更改（<b>false</b>）在气球中显示评论。
                        默认值为 <b>false</b>。
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>:false；
                    </li>
                    <li>
                        <b>reviewDisplay</b> - 定义打开文档进行查看时将使用的审阅编辑模式。
                        如果 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 设置为 <b>view</b>，它将仅对文档编辑器可用。
                        可以取以下值：
                        <br />- <b>markup</b> - 显示文档，并突出显示建议的更改；
                        <br />- <b>simple</b> - 显示文档并突出显示建议的更改，但气球已关闭；
                        <br />- <b>final</b> - 显示文档并应用了所有建议的更改；
                        <br />- <b>original</b> - 显示原始文档，没有建议的更改。
                        <br />默认值为 <b>original</b>,
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："original"；
                    </li>
                    <li>
                        <b>showReviewChanges</b> - 定义在加载编辑器时是否自动显示或隐藏审阅更改面板。
                        默认值为 <b>false</b>，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：false；
                    </li>
                    <li>
                        <b>trackChanges</b> - 无论 <a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a> 参数如何，定义是否以审阅编辑模式 (<b>true</b>) 打开文档 (<b>false</b>) （审阅模式仅针对当前用户更改）。
                        如果参数 <em>未定义</em>，则使用 <em>document.permissions.review</em> 值（对于所有文档用户），
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：true。
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "hideReviewDisplay": false,
    "showReviewChanges": false,
    "reviewDisplay": "original",
    "trackChanges": true,
    "hoverMode": false
}</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    <a href="#showReviewChanges">showReviewChanges</a>, <a href="#reviewDisplay">reviewDisplay</a>, <a href="#trackChanges">trackChanges</a>参数自 7.0 版起已弃用。
                    请改用 <em>review</em> 参数。
                </div>
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.review.hoverMode</em> 和 <em>editorConfig.customization.review.reviewDisplay</em> 参数发送的任何值。</div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/reviewDisplay.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="reviewDisplay" class="copy-link">reviewDisplay</td>
            <td>
                定义文档编辑器中的审阅编辑模式。
                此参数可以采用以下值：
                <ul>
                    <li><b>markup</b> - 显示文档并突出显示建议的更改；</li>
                    <li><b>simple</b> - 显示文档并突出显示建议的更改，但气球已关闭；</li>
                    <li><b>final</b> - 显示文档并应用所有建议的更改；</li>
                    <li><b>original</b> - 显示原始文档，没有建议的更改。</li>
                </ul>
                查看器的默认值是 <b>original</b>, 编辑器的默认值是 <b>markup</b>。
            </td>
            <td>string</td>
            <td>original</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.0 版起已弃用。请改用 <a href="#review">review.reviewDisplay</a> 参数。</div>
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.reviewDisplay</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <% if (license)
           { %>
        <tr>
            <td id="rightMenu" class="copy-link">rightMenu<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义右菜单面板是显示还是隐藏。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.1 版起已弃用。请改用 <a href="#layout">ayout.rightMenu</a> 参数。</div>
            </td>
        </tr>
        <% } %>
        <tr>
            <td id="showReviewChanges" class="copy-link">showReviewChanges</td>
            <td>
                定义加载编辑器时是否自动显示或隐藏审阅更改面板。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.0 版起已弃用。请改用 <a href="#review">review.showReviewChanges</a> 参数。</div>
            </td>
        </tr>
        <tr>
            <td id="spellcheck" class="copy-link">spellcheck</td>
            <td>
                定义在加载编辑器时拼写检查器是自动打开还是关闭。
                拼写检查器仅适用于文档编辑器和演示文稿编辑器。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <div class="note">自 7.1 版起已弃用。请改用 <a href="#features">features.spellcheck</a> 参数。</div>
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.spellcheck</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <% if (license)
           { %>
        <tr>
            <td id="statusBar" class="copy-link">statusBar<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义状态栏是显示还是隐藏。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.1 版起已弃用。请改用 <a href="#layout">layout.statusBar</a> 参数。</div>
            </td>
        </tr>
        <% } %>
        <%--<tr>
            <td id="submitForm" class="copy-link">submitForm</td>
            <td>
                定义是显示还是隐藏<b>提交表单</b>按钮。
                 仅当 <a href="<%= Url.Action("config/editor") %>#mode">mode</a> 参数设置为 <b>edit</b>， 且至少 <a href="<%= Url.Action("config/document/permissions") %>#edit">edit</a>, <a href="<%= Url. Action("config/document/permissions") %>#fillForms">fillForms</a> 或 <a href="<%= Url.Action("config/document/permissions") %>#review">review< /a>中一个权限设置为 <b>true</b>，按钮将对文档编辑器可用 。
                 默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/submitForm.png") %>" alt="" />
            </td>
        </tr>--%>
        <% if (license)
            { %>
        <tr>
            <td id="toolbar" class="copy-link">toolbar<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                定义顶部工具栏是显示还是隐藏。
                默认值为 <b>true</b>。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.1 版起已弃用。请改用 <a href="#layout">layout.toolbar</a> 参数。</div>
            </td>
        </tr>
        <% } %>
        <tr>
            <td id="toolbarHideFileName" class="copy-link">toolbarHideFileName</td>
            <td>
                定义文档标题在顶部工具栏上是可见的 (<b>false</b>) 还是隐藏的 (<b>true</b>)。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，当 <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a> 和 <a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">toolbarNoTabs</a> 参数设置为 <b>true</b>时使用此设置。</div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/toolbarHideFileName.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="toolbarNoTabs" class="copy-link">toolbarNoTabs</td>
            <td>
                定义顶部工具栏选项卡是清晰显示 (<b>false</b>) 还是仅突出显示以查看选择了哪个 (<b>true</b>)。
                默认值为 <b>false</b>。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/toolbarNoTabs.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="trackChanges" class="copy-link">trackChanges</td>
            <td>
                无论 <a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a> 参数如何， 定义是(<b>true</b>)否(<b>false</b>)以审阅编辑模式打开文档（仅针对当前用户更改审阅模式）。
                如果参数是 <em>未定义</em>，则使用 <em>document.permissions.review</em> 值（对于所有文档用户）。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">自 7.0 版起已弃用。请改用 <a href="#review">review.trackChanges</a> 参数。</div>
            </td>
        </tr>
        <tr>
            <td id="uiTheme" class="copy-link">uiTheme</td>
            <td>
                定义编辑器主题设置。
                可以通过两种方式设置：
                <ul>
                    <li><b>theme id</b> - 用户通过其 id 设置主题参数（<b>theme-light</b>, <b>theme-classic-light</b>, <b>theme-dark</b>, <b>theme-contrast-dark</b>），</li>
                    <li>
                        <b>default theme</b> - 将设置默认的深色或浅色主题值（<b>default-dark</b>，<b>default-light</b>）。
                        默认的浅色主题是 <b>theme-classic-light</b>。
                    </li>
                </ul>
                第一个选项具有更高的优先级。
                <p></p>
                除了可用的编辑器主题外，用户还可以为应用程序界面自定义自己的<a href="https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx" target="_blank">颜色主题</a>。
            </td>
            <td>string</td>
            <td>theme-dark</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.uiTheme</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="unit" class="copy-link">unit</td>
            <td>
                定义标尺和对话框中使用的测量单位。
                可以取以下值：
                <ul>
                    <li><b>cm</b> - 厘米，</li>
                    <li><b>pt</b> - 点，</li>
                    <li><b>inch</b> - 英寸。</li>
                </ul>
                默认值为厘米 (<b>cm</b>)。
            </td>
            <td>string</td>
            <td>cm</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.unit</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr>
            <td id="zoom" class="copy-link">zoom</td>
            <td>
                定义以百分比测量的文档显示缩放值。
                可以取大于 <b>0</b>的值。
                对于文本文档和演示文稿，可以将此参数设置为 <b>-1</b> （使文档适合页面选项）或 <b>-2</b> （使文档页面宽度适合编辑器页面）。
                默认值为 <b>100</b>。
            </td>
            <td>integer</td>
            <td>100</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">请注意，如果在编辑器界面中更改此设置，它将存储在浏览器本地存储中，并将覆盖作为 <em>editorConfig.customization.zoom</em> 参数发送的任何值。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/customization.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - 仅适用于 ONLYOFFICE 开发者版的编辑</em></span>
<% if (license)
   { %>
<span id="requiredDescr2" class="required-descr"><span class="required">**</span><em> - 开发者版的扩展白标选项</em></span>
<% } %>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "anonymous": {
                "request": true,
                "label": "Guest"
            },
            <% if (license)
               { %>"about": true,
            <% } %>"comments": true,
            "compactHeader": false,
            "compactToolbar": false,
            "compatibleFeatures": false,
            "customer": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "logoDark": "https://example.com/dark-logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "phone": "123456789",
                "www": "example.com"
            },
            "features": {
                "spellcheck": {
                    "mode": true<% if (license)
                    { %>,
                    "change": true<% } %>
                }
            },
            "feedback": {
                "url": "https://example.com",
                "visible": true
            },
            <% if (license)
               { %>"font": {
                "name": "Arial",
                "size": "11px"
            },
            <% } %>"forcesave": false,
            "goback": {
                "blank": true,
                "requestClose": false,
                "text": "Open file location",
                "url": "https://example.com"
            },
            "help": true,
            "hideNotes": false,
            "hideRightMenu": false,
            "hideRulers": false,
            "integrationMode": "embed",
            <% if (license)
               { %>"layout": {
                "header": {
                    "save": true,
                    "users": true
                },
                "leftMenu": {
                    "mode": true,
                    "navigation": true,
                    "spellcheck": true
                },
                "rightMenu": {
                    "mode": true
                },
                "statusBar": {
                    "actionStatus": true,
                    "docLang": true,
                    "textLang": true
                },
                "toolbar": {
                    "collaboration": true,
                    "draw": true,
                    "file": {
                        "close": true,
                        "info": true,
                        "save": true,
                        "settings": true
                    },
                    "home": {
                        "mailmerge": true
                    },
                    "layout": true,
                    "plugins": true,
                    "protect": true,
                    "references": true,
                    "save": true,
                    "view": {
                        "navigation": true
                    }
                }
            },
            "loaderLogo": "https://example.com/loader-logo.png",
            "loaderName": "The document is loading, please wait...",
            <% } %>"logo": {
                "image": "https://example.com/logo.png",
                "imageDark": "https://example.com/dark-logo.png",
                "url": "https://example.com"
            },
            "macros": true,
            "macrosMode": "warn",
            "mentionShare": true,
            "plugins": true,
            "review": {
                "hideReviewDisplay": false,
                "showReviewChanges": false,
                "reviewDisplay": "original",
                "trackChanges": true,
                "hoverMode": false
            },
            <% if (license)
               { %>"statusBar": true,
            <% } %><%--"submitForm": true,--%>
            <% if (license)
                { %>"toolbar": true,
            <% } %>"toolbarHideFileName": false,
            "toolbarNoTabs": false,
            "uiTheme": "theme-dark",
            "unit": "cm",
            "zoom": 100
        },
        ...
    },
    ...
});
</pre>
<p>
    其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
    有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
</p>

<p>
    如果您有任何其他问题，请通过
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com与我们联系</a>。
</p>
