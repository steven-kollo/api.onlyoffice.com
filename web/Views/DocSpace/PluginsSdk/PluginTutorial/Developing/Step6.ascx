<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Step 6. Configure the plugin's interface elements</span>
</h1>

<p>If necessary, define the plugin's UI elements.
    Consult our <a href="/docspace-storybook" target="_blank">Storybook</a> to develop your plugin's UI.</p>
<p>For example, the <b>draw.io</b> plugin contains two main UI elements - the modal window and the diagram editor.
    Create the files for configuring each element. For your convenience, you can put these files into a separate <em>DrawIO</em> folder.</p>
<ul>
    <li>
        <p>In the <a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/draw-io/src/DrawIO/Dialog.ts" target="_blank">Dialog.ts</a> file,
            configure the modal window settings.
            Specify the <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/iframe") %>">IFrame</a> UI component
            that is used to embed the draw.io website into a modal window:</p>
        <pre>
export const frameProps: IFrame = {
    width: "100%",
    height: "100%",
    name: "test-drawio",
    src: "",
};
</pre>
        <p>Create the <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/box") %>">IBox</a> container to add the iframe to it:</p>
        <pre>
const body:
IBox = {
    widthProp: "100%",
    heightProp: "100%",

    children: [
        {
            component: Components.iFrame,
            props: frameProps,
        },
    ],
};
</pre>
        <p>Configure the <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/modaldialog") %>">modal window</a> properties:</p>
        <pre>
export const drawIoModalDialogProps: IModalDialog = {
    dialogHeader: "",
    dialogBody: body,
    displayType: ModalDisplayType.modal,
    fullScreen: true,
    onClose: () => {
        const message: IMessage = {
            actions: [Actions.closeModal],
        };

        return message;
    },
    onLoad: async () => {
        return {
            newDialogHeader: drawIoModalDialogProps.dialogHeader || "",
            newDialogBody: drawIoModalDialogProps.dialogBody,
        };
    },
    autoMaxHeight: true,
    autoMaxWidth: true,
};
</pre>
    </li>
    <li>
        <p>In the <a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/draw-io/src/DrawIO/Editor.ts" target="_blank">Editor.ts</a> file, configure the diagram editor.
            Create the <em>DiagramEditor</em> function with the following parameters:</p>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td id="ui" class="copy-link">ui</td>
                    <td>Defines the editor's ui theme.</td>
                    <td>string</td>
                    <td>"default"</td>
                </tr>
                <tr class="tablerow">
                    <td id="dark" class="copy-link">dark</td>
                    <td>Defines the editor's dark theme.</td>
                    <td>string</td>
                    <td>"auto"</td>
                </tr>
                <tr class="tablerow">
                    <td id="off" class="copy-link">off</td>
                    <td>Specifies if the offline mode is active or not.</td>
                    <td>boolean</td>
                    <td>false</td>
                </tr>
                <tr class="tablerow">
                    <td id="lib" class="copy-link">lib</td>
                    <td>Specifies if the libraries are enabled or not.</td>
                    <td>boolean</td>
                    <td>false</td>
                </tr>
                <tr class="tablerow">
                    <td id="lang" class="copy-link">lang</td>
                    <td>Defines the editor's language.</td>
                    <td>string</td>
                    <td>"auto"</td>
                </tr>
                <tr class="tablerow">
                    <td id="url" class="copy-link">url</td>
                    <td>Defines the URL to the editor.</td>
                    <td>string</td>
                    <td>"https://embed.diagrams.net"</td>
                </tr>
                <tr class="tablerow">
                    <td id="showSaveButton" class="copy-link">showSaveButton</td>
                    <td>Specifies if the <b>Save</b> button will be displayed in the editor.</td>
                    <td>boolean</td>
                    <td>true</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>

        <p>Then specify methods to work with diagrams:</p>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Method</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td id="startEditing" class="copy-link">startEditing</td>
                    <td>Starts the editor with the given data.</td>
                </tr>
                <tr class="tablerow">
                    <td id="getData" class="copy-link">getData</td>
                    <td>Returns the diagram's data.</td>
                </tr>
                <tr class="tablerow">
                    <td id="getTitle" class="copy-link">getTitle</td>
                    <td>Returns the diagram's title.</td>
                </tr>
                <tr class="tablerow">
                    <td id="getFormat" class="copy-link">getFormat</td>
                    <td>Returns the diagram's format.</td>
                </tr>
                <tr class="tablerow">
                    <td id="getFrameId" class="copy-link">getFrameId</td>
                    <td>Returns the editor's frame ID.</td>
                </tr>
                <tr class="tablerow">
                    <td id="getFrameUrl" class="copy-link">getFrameUrl</td>
                    <td>Returns the URL to the iframe.</td>
                </tr>
                <tr class="tablerow">
                    <td id="handleMessage" class="copy-link">handleMessage</td>
                    <td>Handles the given message.</td>
                </tr>
                <tr class="tablerow">
                    <td id="initializeEditor" class="copy-link">initializeEditor</td>
                    <td>Posts the <em>load</em> message to the editor.</td>
                </tr>
                <tr class="tablerow">
                    <td id="save" class="copy-link">save</td>
                    <td>Saves the given data.</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
        <p>The full code for the <em>DiagramEditor</em> can be found <a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/draw-io/src/DrawIO/Editor.ts" target="_blank">here</a>.</p>
    </li>
</ul>
