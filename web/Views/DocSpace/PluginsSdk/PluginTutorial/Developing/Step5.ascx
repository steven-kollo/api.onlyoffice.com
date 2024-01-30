<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Step 5. Create plugin types</span>
</h1>

<p>Now that the default plugin is ready, you can start coding other plugin types.</p>
<p>Each plugin type has specific plugin items.
Define the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/contextmenuitem") %>">context menu item</a> that will be displayed when you right-click on audio or video files:</p>
<pre>
export const contextMenuItem: IContextMenuItem = {
    key: "speech-to-text-context-menu-item",
    label: "Convert to text",
    icon: "speech-to-text-16.png",
    onClick: assemblyAI.speechToText,
    fileType: [FilesType.video],
    withActiveItem: true,
};
</pre>
<img alt="Context menu item" class="screenshot max-width-400" src="<%= Url.Content("~/content/img/docspace/context-menu-item.png") %>" />

<p>You can add more plugin types. For example, the <b>draw.io</b> plugin can be accessed from the main button menu,
    so we need to specify the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/mainbuttonitem") %>">main button item</a>:</p>
<pre>
const mainButtonItem: IMainButtonItem = {
    key: "draw-io-main-button-item",
    label: "Draw.io",
    icon: "drawio.png",
    onClick: (id: number) => {
        drawIo.setCurrentFolderId(id);

        const message: IMessage = {
            actions: [Actions.showCreateDialogModal],
            createDialogProps: {
                title: "Create diagram",
                startValue: "New diagram",
                visible: true,
                isCreateDialog: true,
                extension: ".drawio",
                onSave: async (e: any, value: string) => {
                    await drawIo.createNewFile(value);
                },
                onCancel: (e: any) => {
                    drawIo.setCurrentFolderId(null);
                },
                onClose: (e: any) => {
                    drawIo.setCurrentFolderId(null);
                },
            },
        };

        return message;
    },
    // items: [createItem],
};
</pre>
<p>When the main button item is clicked, the modal window appears where you can type the diagram's name and open an empty <em>.drawio</em> file.</p>
<img alt="Create diagram" class="screenshot" src="<%= Url.Content("~/content/img/docspace/create-diagram.png") %>" />

<p>For the <b>draw.io</b> plugin, you also need to configure the file plugin type which works when the user opens the specific <em>.drawio</em> file:</p>
<ol>
    <li>
        <p>Define the <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems/fileitem") %>">file item</a>
            that is represented as a file with the specific extension (<em>.drawio</em>) and icon:</p>
        <pre>
export const drawIoItem: IFileItem = {
    extension: ".drawio",
    fileTypeName: "Diagram",
    fileRowIcon: "drawio-32.svg",
    fileTileIcon: "drawio-32.svg",
    devices: [Devices.desktop],
    onClick,
};
</pre>
    </li>
    <li>
        <p>Define the <em>onClick</em> event which will execute the <em>editDiagram</em> method each time the <em>.drawio</em> file is opened:</p>
        <pre>
const onClick = async (item: File) => {
    return await drawIo.editDiagram(item.id);
};
</pre>
        <img alt="Drawio file" class="screenshot" src="<%= Url.Content("~/content/img/docspace/drawio-file.png") %>" />
    </li>
</ol>
