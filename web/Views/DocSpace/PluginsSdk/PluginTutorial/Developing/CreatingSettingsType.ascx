<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Step 6. Create the settings plugin type</span>
</h1>

<p>Configure the settings plugin type to provide users with the administrator settings.</p>
<ol>
    <li>
        <p>Create a container where the plugin settings will be placed:</p>
        <pre>
const descriptionText: TextGroup = {
    component: Components.text,
    props: {
        text: "To generate API token visit https://www.assemblyai.com",
        color: "#A3A9AE",
        fontSize: "12px",
        fontWeight: 400,
        lineHeight: "16px",
    },
};

const descGroup: BoxGroup = {
    component: Components.box,
    props: { children: [descriptionText] },
};

const parentBox: IBox = {
    displayProp: "flex",
    flexDirection: "column",
    // marginProp: "16px 0 0 0",
    children: [tokenGroup, descGroup],
};
</pre>
        <p>In the settings description, indicate that it is necessary to generate an API token in order to be able to work with the plugin.</p>
    </li>
    <li>
        <p>Configure the administrator settings with the <em>ISettings</em> object:</p>
        <pre>
const adminSettings: ISettings = {
    settings: parentBox,
    saveButton: userButtonComponent,
    onLoad: async () => {
        assemblyAI.fetchAPIToken();

        tokenInput.value = assemblyAI.apiToken;

        if (!assemblyAI.apiToken) return { settings: parentBox };

        plugin.setAdminPluginSettings(adminSettings);

        return { settings: parentBox };
    },
};
</pre>
        <p>Specify the <em>onLoad</em> event which defines which plugin settings will be displayed when the settins block is loaded.</p>
    </li>
</ol>
<p>Each settings item is determined in separate files
    (<a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/Settings/Button.ts" target="_blank">buttons</a>,
    <a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/Settings/Token.ts" target="_blank">token</a>).</p>
<img alt="Speech settings" class="screenshot max-width-300" src="<%= Url.Content("~/content/img/docspace/speech-settings.png") %>" />
