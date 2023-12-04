<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">TextArea</span>
    <a class="up" href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>"></a>
</h1>

<p class="dscr">Custom textarea.</p>
<p><b>Interface</b>: ITextArea.</p>
<p>See the parameters of this component in <a href="https://storybook.onlyoffice.io/?path=/docs/components-textarea--docs" target="_blank">storybook</a>.</p>
<img alt="Textarea" class="screenshot" src="<%= Url.Content("~/content/img/docspace/textarea.png") %>" />

<div class="header-gray">Example</div>
<pre>
import {ITextArea, IMessage, Actions} from "@onlyoffice/docspace-plugin-sdk";

const onChange = (value: string) =&gt; {
    props.value = value;

    const message: IMessage = {
        "actions": [Actions.updateProps],
        "newProps": props,
    };

    return message;
};

const props: ITextArea = {
    "value": "",
    onChange,
};
</pre>
