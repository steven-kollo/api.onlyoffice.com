<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Step 7. Create the main plugin code file</span>
</h1>

<p>Create a file in the <em>src</em> folder with the main plugin code. This file is required.</p>
<p>Refer to the documentation of a third-party service to write this code.</p>
<p>Let's see how the <a href="https://github.com/ONLYOFFICE/docspace-plugins/blob/master/speech-to-text/src/AssemblyAI.ts" target="_blank">AssemblyAI.ts</a> file is organized in detail:</p>
<ol>
    <li>
        <p>Define the <em>AssemblyAI</em> class with all the necessary variables and methods:</p>
        <h2>Variables and their description:</h2>
        <ul>
            <li>
                <p><b id="apiURL" class="copy-link">apiURL</b> - defines the API URL.</p>
                <pre>
apiURL = "";
</pre>
            </li>
            <li>
                <p><b id="currentFileId" class="copy-link">currentFileId</b> - defines the current file ID.</p>
                <pre>
currentFileId: null | number = null;
</pre>
            </li>
            <li>
                <p><b id="apiToken" class="copy-link">apiToken</b> - defines the API token.</p>
                <pre>
apiToken = "";
</pre>
            </li>
        </ul>

        <h2>Methods and their description:</h2>
        <ul>
            <li>
                <p><b id="createAPIUrl" class="copy-link">createAPIUrl</b> - creates the API URL.</p>
                <pre>
createAPIUrl = () =&gt; {
    const api = plugin.getAPI();

    this.apiURL = api.origin.replace(/\/+&#36;/, "");

    const params = [api.proxy, api.prefix];

    if (this.apiURL) {
        params.forEach((part) =&gt; {
            if (!part) return;
            const newPart = part.trim().replace(/^\/+/, "");
            this.apiURL += newPart
                ? this.apiURL.length &gt; 0 &&
                    this.apiURL[this.apiURL.length - 1] === "/"
                    ? newPart
                    : `/&#36;{newPart}`
                : "";
        });
    }
}
</pre>
            </li>
            <li>
                <p><b id="setAPIUrl" class="copy-link">setAPIUrl</b> - sets the API URL.</p>
                <pre>
setAPIUrl = (url: string) =&gt; {
    this.apiURL = url;
};
</pre>
            </li>
            <li>
                <p><b id="getAPIUrl" class="copy-link">getAPIUrl</b> - retuns the API URL.</p>
                <pre>
getAPIUrl = () =&gt; {
    return this.apiURL;
};
</pre>
            </li>
            <li>
                <p><b id="setAPIToken" class="copy-link">setAPIToken</b> - sets the API token.</p>
                <pre>
setAPIToken = (apiToken: string) =&gt; {
    this.apiToken = apiToken;
};
</pre>
            </li>
            <li>
                <p><b id="getAPIToken" class="copy-link">getAPIToken</b> - returns the API token.</p>
                <pre>
getAPIToken = () =&gt; {
    return this.apiToken;
};
</pre>
            </li>
            <li>
                <p><b id="fetchAPIToken" class="copy-link">fetchAPIToken</b> - fetches the API token.</p>
                <pre>
fetchAPIToken = async () =&gt; {
    const apiToken = localStorage.getItem("speech-to-text-api-token");

    if (!apiToken) return;

    this.setAPIToken(apiToken);
    plugin.updateStatus(PluginStatus.active);
};
</pre>
            </li>
            <li>
                <p><b id="saveAPIToken" class="copy-link">saveAPIToken</b> - saves the API token.</p>
                <pre>
saveAPIToken = (apiToken: string) =&gt; {
    localStorage.setItem("speech-to-text-api-token", apiToken);

    plugin.updateStatus(!!apiToken ? PluginStatus.active : PluginStatus.hide);
};
</pre>
            </li>
            <li>
                <p><b id="setCurrentFileId" class="copy-link">setCurrentFileId</b> - sets the ID to the current file.</p>
                <pre>
setCurrentFileId = (id: number | null) =&gt; {
    this.currentFileId = id;
};
</pre>
            </li>
            <li>
                <p><b id="uploadFile" class="copy-link">uploadFile</b> - uploads a file which will be transcribed.</p>
                <pre>
uploadFile = async (api_token: string, path: string, data: Blob) =&gt; {
    console.log(`Uploading file: &#36;{path}`);

    const url = "https://api.assemblyai.com/v2/upload";

    try {
        const response = await fetch(url, {
            method: "POST",
            body: data,
            headers: {
                "Content-Type": "application/octet-stream",
                Authorization: api_token,
            },
        });

        if (response.status === 200) {
            const responseData = await response.json();
            return responseData["upload_url"];
        } else {
            console.error(`Error: &#36;{response.status} - &#36;{response.statusText}`);
            return null;
        }
    } catch (error) {
        console.error(`Error: &#36;{error}`);
        return null;
    }
};
</pre>
            </li>
            <li>
                <p><b id="transcribeAudio" class="copy-link">transcribeAudio</b> - transcribes the audio file.</p>
                <pre>
transcribeAudio = async (api_token: string, audio_url: string) =&gt; {
    console.log("Transcribing audio... This might take a moment.");

    const headers = {
        authorization: api_token,
        "content-type": "application/json",
    };

    const response = await fetch("https://api.assemblyai.com/v2/transcript", {
        method: "POST",
        body: JSON.stringify({ audio_url }),
        headers,
    });

    const responseData = await response.json();
    const transcriptId = responseData.id;

    const pollingEndpoint = `https://api.assemblyai.com/v2/transcript/&#36;{transcriptId}`;

    while (true) {
        const pollingResponse = await fetch(pollingEndpoint, { headers });
        const transcriptionResult = await pollingResponse.json();

        if (transcriptionResult.status === "completed") {
            return transcriptionResult;
        }
        else if (transcriptionResult.status === "error") {
            throw new Error(`Transcription failed: &#36;{transcriptionResult.error}`);
        }
        else {
            await new Promise((resolve) =&gt; setTimeout(resolve, 3000));
        }
    }
};
</pre>
            </li>
            <li>
                <p><b id="speechToText" class="copy-link">speechToText</b> - implements the plugin work.</p>
                <pre>
speechToText = async (id: number) =&gt; {
    if (!this.apiToken) return;

    this.setCurrentFileId(null);

    if (!this.apiURL) this.createAPIUrl();

    const { viewUrl, title, folderId, fileExst } = (
        await (await fetch(`&#36;{this.apiURL}/files/file/&#36;{id}`)).json()
    ).response;

    const file = await fetch(viewUrl);

    const fileBlob = await file.blob();

    const upload_url = await this.uploadFile(this.apiToken, viewUrl, fileBlob);

    const transcript = await this.transcribeAudio(this.apiToken, upload_url);

    const blob = new Blob([transcript.text], {
        type: "text/plain;charset=UTF-8",
    });

    const newFile = new File([blob], `blob`, {
        type: "",
        lastModified: new Date().getTime(),
    });

    const formData = new FormData();
    formData.append("file", newFile);

    const newTitle = `&#36;{title.replaceAll(fileExst, "")} text`;

    try {
        const sessionRes = await fetch(
            `&#36;{this.apiURL}/files/&#36;{folderId}/upload/create_session`,
            {
                method: "POST",
                headers: {
                    "Content-Type": "application/json;charset=utf-8",
                },
                body: JSON.stringify({
                    createOn: new Date(),
                    fileName: `&#36;{newTitle}.txt`,
                    fileSize: newFile.size,
                    relativePath: "",
                }),
            }
        );

        const sessionData = (await sessionRes.json()).response.data;

        const data = await fetch(`&#36;{sessionData.location}`, {
            method: "POST",
            body: formData,
        });

        const { id: fileId } = (await data.json()).data;

        return fileId;
    } catch (e) {
        console.log(e);
    }

    return {
        actions: [Actions.showToast],
        toastProps: [{ type: ToastType.success, title: "" }],
    } as IMessage;
};
</pre>
            </li>
        </ul>
    </li>
    <li>
        <p>Declare the <em>AssemblyAI</em> class instance:</p>
        <pre>
const assemblyAI = new AssemblyAI();
</pre>
    </li>
    <li>
        <p>Export the created plugin instance:</p>
        <pre>
export default assemblyAI;
</pre>
    </li>
</ol>
