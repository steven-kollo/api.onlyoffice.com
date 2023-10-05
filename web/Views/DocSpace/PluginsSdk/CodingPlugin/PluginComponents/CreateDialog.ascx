<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">CreateDialog</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Modal dialog for creating some item (file, folder, etc.). The user gets the full acess to the functionality but cannot control the layout.</p>
<p><b>Interface</b>: <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/interfaces/components/ICreateDialog.ts" target="_blank">ICreateDialog</a>.</p>

<div class="header-gray">Example</div>
<pre>
const createDialogProps = {
    "title": "Create diagram",
    "startValue": "New diagram",
    "visible": true,
    "isCreateDialog": true,
    "extension": ".drawio",
    "onSave": async (e: any, value: string) =&gt; {},
    "onCancel": (e: any) =&gt; {},
    "onClose": (e: any) =&gt; {},
};
</pre>
