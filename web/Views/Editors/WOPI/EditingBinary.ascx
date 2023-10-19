<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">编辑二进制文档格式</span>
    </h1>

    <p class="dscr">在线办公不支持对 <em>doc</em>、 <em>ppt</em>、 <em>xls</em>等传统二进制格式的文件进行编辑。
    但是，它可以将此类格式的文档相应地转换为 <em>docx</em>、 <em>pptx</em>、 <em>xlsx</em> 格式，让用户在在线办公中编辑自己的内容。</p>
    <note>通常，转换不会对原始文档布局和格式进行任何可见的更改。
    但有时它会发生，用户可能希望在转换后恢复到以前的二进制文档格式。</note>

    <p><a href="<%= Url.Action("wopi/discovery") %>#convert">转换</a> WOPI 发现操作实现了将二进制格式的文件转换为现代 OOXML 格式的可能性。
    主机还必须支持 <a href="<%= Url.Action("wopi/restapi/PutRelativeFile") %>">PutRelativeFile</a> WOPI 操作。二进制文件的编辑过程包括以下步骤：</p>
    <ol>
        <li>主机对二进制文件执行 <b>转换</b> 操作。</li>
        <li>在线办公从主机上取回文件并进行转换。</li>
        <li>在线办公将转换后的文档以原文件ID执行 <b>PutRelativeFile</b> 操作回传给主机。</li>
        <li>主机使用 <b>PutRelativeFile</b> 操作的 <b>X-WOPI-FileConversion</b> 请求标头来确定请求是在文件转换的上下文中发出的。</li>
        <li>文档转换成功后，在线办公将用户重定向到 <b>PutRelativeFile</b> 响应体中返回的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a>。
        </li>
    </ol>
    <p>现在用户可以编辑 OOXML 格式的文档。</p>

    <h2 id="viewing-mode" class="copy-link">查看模式</h2>

    <p>可能还有另一种情况，主机首先在查看器中打开文档，然后使用 <b>“编辑”</b> 按钮将文档转换为 OOXML 格式并进行编辑。
    使用 <a href="<%= Url.Action("wopi/discovery") %>#view">查看</a> 操作打开二进制文件的过程应如下所示：</p>
    <ol>
        <li>将 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanWrite">UserCanWrite</a> 属性设置为 <b>true</b>。</li>
        <li>将 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#UserCanNotWriteRelative">UserCanNotWriteRelative</a> 属性设置为 <b>false</b> （或简单地忽略它）。</li>
        <li>将 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a> 属性设置为在加载时执行 <b>转换</b> 操作的主机URL。</li>
    </ol>
    <p>如果满足所有这些条件， <b>编辑</b> 按钮将显示在查看器中。当用户单击它时，为二进制文件提供的 <b>HostEditUrl</b> 将打开并开始转换过程。
    最后，用户被重定向到新转换文档的 <b>HostEditUrl</b>。</p>

    <h2 id="customization" class="copy-link">定制</h2>

    <p>有时，用户在打开没有任何更改的二进制文件时可能会感到困惑。发生这种情况是因为所有更改都是在新转换的 OOXML 文件中进行的。
    这就是为什么在转换开始之前通知用户可能很重要。主机可以通过三种方式执行此操作。</p>

    <p><b>选项1</b>。显示通知消息</p>
    <p>主机可以在转换开始之前向用户显示一些 UI。<b>执行</b> 转换操作时，
    主机将其识别为尝试编辑二进制文档并显示通知消息以通知用户文档将被转换。
    通过将 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#EditModePostMessage">EditModePostMessage</a>
    属性设置为 <b>true</b> 并处理 <a href="<%= Url.Action("wopi/postmessage") %>#UI_Edit">UI_Edit</a> PostMessage，这种情况也可以应用于 <b>编辑</b> 按钮。</p>

    <p><b>选项2</b>。以不同方式处理转换后的文档</p>
    <p>通过在转换过程中调用 <a href="<%= Url.Action("wopi/restapi/PutRelativeFile") %>">PutRelativeFile</a> 操作时以不同方式处理，
    主机可以以独特的方式处理转换后的文档。<b>X-WOPI-FileConversion</b> 标头告诉主机何时从转换流调用操作，
    因此主机可以选择如何最好地处理这些请求。</p>

    <p><b>选项3</b>。重定向到插页</p>
    <p>在线办公导航到主机控制的 <a href="<%= Url.Action("wopi/restapi/PutRelativeFile") %>">PutRelativeFile</a> 响应中返回的 <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>#HostEditUrl">HostEditUrl</a>。
    因此，主机可以在转换完成后将用户发送到任何 URL。例如，主机可能会将用户重定向到一个插页，通知他们，他们的文档已被转换。</p>
    <img class="screenshot max-width-300" alt="转换二进制文件" src="<%= Url.Content("~/content/img/editor/convert-binary-files.jpg") %>" />
