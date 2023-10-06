<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Plugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The default plugin.</p>
<p><b>Interface</b>: IPlugin.</p>
<p>This interface must be used in each plugin because the plugin <a href="#status">status</a> is required to embed the plugin in the portal.</p>

<div class="header-gray">Variables</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="status" class="copy-link">status</td>
            <td>Stores the plugin status (<b>active</b> or <b>hide</b>).</td>
            <td><a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Plugins.ts" target="_blank">PluginStatus</a></td>
            <td>"active"</td>
        </tr>
        <tr class="tablerow">
            <td id="onLoadCallback" class="copy-link">onLoadCallback</td>
            <td>Stores callback which will be executed when uploading the plugin to the portal.</td>
            <td>func</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="updateStatus" class="copy-link">updateStatus</b> - update the plugin status.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>status</td>
                    <td>Defines a new plugin status (<b>active</b> or <b>hide</b>).</td>
                    <td><a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/blob/develop/src/enums/Plugins.ts" target="_blank">PluginStatus</a></td>
                    <td>"active"</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getStatus" class="copy-link">getStatus</b> - get the plugin status.</p>
    </li>
    <li>
        <p><b id="setOnLoadCallback" class="copy-link">setOnLoadCallback</b> - sets the <a href="#onLoadCallback">onLoadCallback</a> variable to the plugin.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>callback</td>
                    <td>Defines callback which will be executed when uploading the plugin to the portal.</td>
                    <td>fucn</td>
                    <td>callback</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IPlugin, PluginStatus} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IPlugin {
    status: PluginStatus = PluginStatus.active;
    onLoadCallback = async () =&gt; {};

    updateStatus = (status: PluginStatus) =&gt; {
        this.status = status;
    };

    getStatus = () =&gt; {
        return this.status;
    };

    setOnLoadCallback = (callback: () =&gt; Promise&lt;void&gt;) =&gt; {
        this.onLoadCallback = callback;
    };
}
</pre>
