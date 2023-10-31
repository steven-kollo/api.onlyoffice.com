<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">SettingsPlugin</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>"></a>
</h1>

<p class="dscr">The plugin that manages settings for the administrator or owner.</p>
<p><b>Interface</b>: ISettingsPlugin.</p>
<img alt="Plugin settings" class="screenshot max-width-260" src="<%= Url.Content("~/content/img/docspace/settings-block.png") %>" />

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
            <td id="adminPluginSettings" class="copy-link">adminPluginSettings</td>
            <td>Stores the administrator or owner settings block that is embedded in the modal window with the plugin description.</td>
            <td><a href="https://github.com/ONLYOFFICE/docspace-plugin-sdk/blob/master/src/interfaces/settings/ISettings.ts" target="_blank">ISettings</a></td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p><b id="setAdminPluginSettings" class="copy-link">setAdminPluginSettings</b> - update the administrator or owner plugin settings.</p>
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
                    <td>adminPluginSettings</td>
                    <td>Defines the administrator or owner settings block that is embedded in the modal window with the plugin description.</td>
                    <td>ISettings</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p><b id="getAdminPluginSettings" class="copy-link">getAdminPluginSettings</b> - get the administrator or owner plugin settings.</p>
    </li>
</ul>

<div class="header-gray">Example</div>
<pre>
import {ISettings, ISettingsPlugin} from "@onlyoffice/docspace-plugin-sdk";

class Plugin implements ISettingsPlugin {
    adminPluginSettings: ISettings | null = { } as ISettings;

    getAdminPluginSettings = ( ) =&gt; {
        return this.adminPluginSettings;
    }

    setAdminPluginSettings = (settings: ISettings | null): void =&gt; {
        this.adminPluginSettings = settings;
    }
}
</pre>
