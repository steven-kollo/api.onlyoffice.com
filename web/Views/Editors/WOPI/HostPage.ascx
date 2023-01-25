<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">主机页面</span>
</h1>

    <p class="dscr">为了在您的应用程序中创建一个online office会话，主机必须创建一个 HTML 页面，该页面将在其中嵌入一个指向特定
    <a href="<%= Url.Action("wopi/discovery") %>#actions">WOPI action URL</a>的 iframe 元素。</p>

    <p>主机页面必须包含以下元素：</p>
    <ul>
        <li>出于安全目的，主机必须通过一个 <em>form</em> 元素将 <a href="#access_token">access_token</a> 和 <a href="#access_token_ttl">access_token_ttl</a> 参数 <em>POST</em> 到online office iframe。</li>
        <li>使用 <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>与online office iframe 交互的 JavaScript 代码。</li>
        <li>Body元素和online office的特定 CSS 样式，以避免视觉包。此外，
        主机页面应使用 <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>中提供的网站图标 URL 为页面设置适当的网站图标。</li>
        <li>用于避免移动端浏览器的视觉和功能问题的 <em>viewport</em> 元标签。</li>
    </ul>

    <div class="header-gray">主机页面代码</div>
<pre>
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;
&lt;html&gt;

&lt;head runat="server"&gt;
    &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
    &lt;meta http-equiv="X-UA-Compatible" content="IE=edge" /&gt;
    &lt;meta name="viewport" content="width=device-width" /&gt;

    &lt;title&gt;ONLYOFFICE Document Editors&lt;/title&gt;
    &lt;link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" /&gt;

    &lt;style type="text/css"&gt;
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            -ms-content-zooming: none;
        }
        
        #office_frame {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: 0;
            border: none;
            display: block;
        }
    &lt;/style&gt;
&lt;/head&gt;

&lt;body&gt;

    &lt;form id="office_form" name="office_form" target="office_frame" action="&lt;%= actionUrl %&gt;" method="post"&gt;
        &lt;input name="access_token" value="&lt;%= token %&gt;" type="hidden" /&gt;
        &lt;input name="access_token_ttl" value="&lt;%= tokenTtl %&gt;" type="hidden" /&gt;
    &lt;/form&gt;

    &lt;span id="frameholder"&gt;&lt;/span&gt;

    &lt;script type="text/javascript"&gt;
        var frameholder = document.getElementById('frameholder');
        var office_frame = document.createElement('iframe');
        office_frame.name = 'office_frame';
        office_frame.id = 'office_frame';

        office_frame.title = 'Office Frame';
        office_frame.setAttribute('allowfullscreen', 'true');

        office_frame.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-forms allow-popups allow-top-navigation allow-popups-to-escape-sandbox allow-downloads allow-modals');
        office_frame.setAttribute('allow', 'autoplay camera microphone display-capture');
        frameholder.appendChild(office_frame);

        document.getElementById('office_form').submit();
    &lt;/script&gt;

&lt;/body&gt;

&lt;/html&gt;
</pre>

    <note>请注意， <em>"&lt;%= actionUrl %&gt;"</em>, <em>"&lt;%= token %&gt;"</em>, <em>"&lt;%= tokenTtl %&gt;"</em> 字符串将使用适当的参数呈现。</note>
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
            <tr>
                <td id="access_token" class="copy-link">access_token</td>
                <td>主机将用于确定 WOPI 请求发出者的身份和权限的访问令牌。</td>
                <td>string</td>
            </tr>
            <tr>
                <td id="access_token_ttl" class="copy-link">access_token_ttl</td>
                <td>访问令牌过期的时间，表示为自 1970 年 1 月 1 日 UTC 以来的毫秒数。
                    建议将此参数设置为 10 小时。</td>
                <td>integer</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <p>可以在 <a href="https://docs.microsoft.com/zh-cn/microsoft-365/cloud-storage-partner-program/online/hostpage" target="_blank">这里</a>找到有关构建主机页面的更多信息。</p>
