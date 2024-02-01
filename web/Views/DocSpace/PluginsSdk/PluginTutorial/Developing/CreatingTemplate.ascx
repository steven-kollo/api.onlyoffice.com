<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Step 1. Create a plugin template</span>
</h1>

<p>Create a plugin template and configure its settings which will be displayed in the DocSpace plugin settings:</p>

<ol>
    <li>
        <p>To create a plugin template, open the terminal and run the following <b>npx</b> command:</p>
        <pre>
npx create-docspace-plugin
</pre>
        <note>
            <p>If the npx command is not avaibale, install the <em>@onlyoffice/docspace-plugin-sdk</em> npm package globally using the following command:</p>
            <pre>
npm i -g @onlyoffice/docspace-plugin-sdk
</pre>
        </note>
    </li>
    <li>
        <p>Configure the plugin in the terminal by specifying settings in the dialog.
        All the settings are described <a href="<%= Url.Action("pluginssdk/creatingtemplate") %>">here</a>.</p>
        <p>For the <b>speech-to-text</b> plugin, you can use the following values:</p>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Dialog question</td>
                    <td>Value</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td id="name" class="copy-link">Plugin name</td>
                    <td>speech-to-text</td>
                </tr>
                <tr class="tablerow">
                    <td id="version" class="copy-link">Plugin version</td>
                    <td>1.0.0</td>
                </tr>
                <tr class="tablerow">
                    <td id="author" class="copy-link">Plugin author</td>
                    <td>ONLYOFFICE</td>
                </tr>
                <tr class="tablerow">
                    <td id="logo" class="copy-link">Plugin logo</td>
                    <td>logo.png</td>
                </tr>
                <tr class="tablerow">
                    <td id="description" class="copy-link">Plugin description</td>
                    <td>Speech to Text Conversion is a speech recognition software that allows you to recognize and translate spoken speech into text.</td>
                </tr>
                <tr class="tablerow">
                    <td id="license" class="copy-link">Plugin license</td>
                    <td>Apache-2.0</td>
                </tr>
                <tr class="tablerow">
                    <td id="homepage" class="copy-link">Plugin homepage</td>
                    <td>https://github.com/ONLYOFFICE/docspace-plugin</td>
                </tr>
                <tr class="tablerow">
                    <td id="scopes" class="copy-link">Select scopes (Press &lt;space&gt; to select, Enter when finished)</td>
                    <td>API, Settings, Context menu</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <img alt="Speech template" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/docspace/speech-template.png") %>" />
        <p>A folder with the plugin template will be placed at the path where you executed the command.</p>
        <img alt="Speech template location" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/docspace/speech-template-location.png") %>" />
        <p>You can change all the specified parameters later in the <a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/package.json" target="_blank">package.json</a> file.</p>
        <p>You can also create a plugin in any project by adding the <em>@onlyoffice/docspace-plugin-sdk</em> npm package as a dependency
        and specifying all the necessary fields in the <em>package.json</em> file.</p>
    </li>
</ol>
