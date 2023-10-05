<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">FilePlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that can interact with the file list.</p>
<p><b>Interface</b>: IFilePlugin.</p>

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
            <td id="fileItems" class="copy-link">fileItems</td>
            <td>Stores a collection of elements where the keys are the <em>key</em> parameters from the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/fileitem") %>">FileItem</a> objects.
                A list for hooking interactions with files is generated based on this collection.</td>
            <td>array of IFileItem</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="addFileItem" class="copy-link">addFileItem</b> - add a new item for interactions with files.</p>
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
                    <td>fileItems</td>
                    <td>Defines an item for interactions with files.</td>
                    <td>IFileItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getFileItems" class="copy-link">getFileItems</b> - get all the items for interactions with files.</p>

    </li>
    <li>
        <p><b id="updateFileItem" class="copy-link">updateFileItem</b> - update the item for interactions with files.</p>
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
                    <td>fileItems</td>
                    <td>Defines a new item for interactions with files.</td>
                    <td>IFileItem</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {IFilePlugin, IFileItem} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements IFilePlugin {
    fileItems: Map&lt;string, IFileItem&gt; = new Map();

        addFileItem = (item: IFileItem): void =&gt; {
        this.fileItems.set(item.extension, item);
    };

    getFileItems = (): Map&lt;string, IFileItem&gt; =&gt; {
        return this.fileItems;
    };

    updateFileItem = (item: IFileItem): void =&gt; {
        this.fileItems.set(item.extension, item);
    };
}
</pre>
