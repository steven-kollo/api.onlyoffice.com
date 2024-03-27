<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Forms</span>
</h1>

<p class="dscr">
    Let's create the <em>ContentControls</em> component and its accompanying story files: <em>src/components/ContentControls/ContentControls.vue</em>,
    <em>src/Forms.stories.js</em>, and <em>src/FillingForm.stories.js</em>. This component is composite, i.e. it is based on other components.
    All the <em>ContentControls</em> components are placed in the <em>src/components/ContentControls</em> folder.
</p>

<ol>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/ContentControls/InputContentControl.vue" target="_blank">InputContentControl.vue</a> file
        with the <em>InputContentControl</em> component and specify the <em>onChangeInput</em> event in it:</p>
        <pre>
onChangeInput: function (event: Event) {
    this.setFormValue((event.target as HTMLInputElement).id, (event.target as HTMLInputElement).value);
    this.$emit("onChangeSelectedPerson", {label: "Custom Data"});
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding an input content control:</p>
        <pre>
&lt;template&gt;
  &lt;div class="control"&gt;
    &lt;label&gt;{{ label }}&lt;/label&gt;
    &lt;input :id="id" :value="value" v-on:keyup="onChangeInput($event)" /&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>When a user of the Vue application types any value in the input field,
        the <em>setFormValue</em> method is executed and sets the entered value to the corresponding form.</p>
        <p>In this case, the <em>Select</em> control is set to <em>Custom Data</em> with the <em>onChangeSelectedPerson</em> function.</p>
        <img class="screenshot max-width-832" alt="Input control component" src="<%= Url.Content("~/content/img/editor/vue/input-control-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/ContentControls/RadioContentControl.vue" target="_blank">RadioContentControl.vue</a> file
        with the <em>RadioContentControl</em> component and specify the <em>onChangeRadio</em> event in it:</p>
        <pre>
onChangeRadio: function (event: Event) {
    this.setFormValue((event.target as HTMLInputElement).id, true);
    this.$emit("onChangeSelectedPerson", {"label": "Custom Data"});
},
isChecked(nameTag: string) {
    for (var i = 0; i &lt; this.options.length; i++) {
        if (this.options[i].checked == true) {
            return nameTag == this.options[i].Tag;
        }
    }

    return false;
},
getLabel(nameTag: string) {
    return nameTag.replace(/([a-z])([A-Z])/g, '$1 $2');
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding a radio content control:</p>
        <pre>
&lt;template&gt;
  &lt;div :id="id" class="control"&gt;
    &lt;label&gt;{{ label }}&lt;/label&gt;
    &lt;div class="radioControl"&gt;
        &lt;span v-for="option of options"&gt;
          &lt;input type="radio" :id="option.Tag" :name="id" :checked="isChecked(option.Tag)" v-on:change="onChangeRadio($event)" /&gt;
          &lt;label class="radioLabel"&gt;{{ getLabel(option.Tag) }}&lt;/label&gt;
        &lt;/span&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>When a user of the Vue application checks any radio control, the <em>setFormValue</em> method is executed and sets the checked value to the specified form.</p>
        <p>In this case, the <em>Select</em> control is set to <em>Custom Data</em> with the <em>onChangeSelectedPerson</em> function.</p>
        <img class="screenshot max-width-832" alt="Radio control component" src="<%= Url.Content("~/content/img/editor/vue/radio-control-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/ContentControls/ContentControls.vue" target="_blank">ContentControls.vue</a> file
        with the <em>ContentControls</em> component which connects the <em>InputContentControl</em> and <em>RadioContentControl</em> components created earlier:</p>
        <pre>
import { defineComponent } from 'vue';
import InputContentControl from './InputContentControl.vue';
import RadioContentControl from './RadioContentControl.vue';
</pre>
        <p>The block with the input and radio controls is created with the specified control parameters: id, label, options, value, etc.:</p>
        <pre>
&lt;template&gt;
  &lt;div class="controlBlock"&gt;
    &lt;div v-for="contentControl of computedContentControls"&gt;
      &lt;InputContentControl v-if="contentControl.Type === 'input'"
        :id="contentControl.Tag"
        :label="getLabel(contentControl.Tag)"
        :value="contentControl.Value"
        @onChangeSelectedPerson="onChangeSelectedPerson"
        :setFormValue="setFormValue" /&gt;
      &lt;RadioContentControl v-else-if="contentControl.Type === 'radio'"
        :id="contentControl.Tag"
        :label="getLabel(contentControl.Tag)"
        :options="contentControl.Value"
        @onChangeSelectedPerson="onChangeSelectedPerson"
        :setFormValue="setFormValue" /&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>The content controls styles are defined in <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/ContentControls/ContentControls.vue#L79" target="_blank">this file</a>.</p>
    </li>
    <li>
        <p>Now that all the components are ready, you can code the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/Forms.stories.js" target="_blank">Forms.stories.js</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
  "title": "Samples/Form templates",
  "component": DocumentEditor,
  "decorators": [() =&gt; ({ "template": "&lt;div style = 'height: 400px;'&gt;&lt;story/&gt;&lt;/div&gt;" })],
  "parameters": {
    "docs": false,
  }
};
</pre>
            </li>
            <li>
                <p>Create the <em>FormsTemplate</em> export. It consists of the select control with the <em>pdf</em> documents options and <em>DocumentEditor</em> component:</p>
                <pre>
"template": '&lt;vSelect v-model="selectedForm" :loading="loading" :options="options" :options="persons"&gt;&lt;/vSelect&gt; &lt;DocumentEditor :id="editorId" :config="config" :documentServerUrl="documentServerUrl" /&gt;'
</pre>
                <p>The select control is created with the <em>vSelect</em> component which is imported from <em>vue-select</em>:</p>
                <pre>
import vSelect from "vue-select";
</pre>
                <note>
                    <p>You need to install the <em>react-select/async</em> library for this control to work correctly:</p>
                    <pre>
npm install vue-select@beta
</pre>
                </note>
                <p>The <em>pdf</em> documents options are loaded from the storage which is specified in the <em>config.oformsUrl</em> parameters:</p>
                <pre>
mounted() {
    this.loading = true;

    fetch(config.oformsUrl)
        .then(response =&gt; response.json())
        .then(json =&gt; {
            const fileOforms = json.data.map((item) =&gt; item.attributes.file_oform.data.find((f) =&gt; f.attributes.ext === ".pdf"));
            this.options = fileOforms.map((form) =&gt; {
                return form && form.attributes
                    ? { value: form.attributes.url, label: form.attributes.name }
                    : null;
            }).filter((o) =&gt; o != null);

            this.loading = false;
        });
},
watch: {
    selectedForm: function (newValue, oldValue) {
        let newConfig = this.config;
        newConfig = {...newConfig}

        newConfig.document.title = this.selectedForm.label;
        newConfig.document.url = this.selectedForm.value;
        newConfig.document.key = undefined;

        this.config = newConfig;
    }
},
</pre>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
                <img class="screenshot max-width-832" alt="Form template" src="<%= Url.Content("~/content/img/editor/vue/form-template.png") %>" />
            </li>
        </ol>
    </li>
    <li>
        <p>Code the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/FillingForms.stories.js" target="_blank">FillingForm.stories.js</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
  "title": "Samples/Work with forms",
  "component": DocumentEditor,
  "decorators": [() =&gt; ({ "template": "&lt;div style = 'height: 400px;'&gt;&lt;story/&gt;&lt;/div&gt;" })],
  "parameters": {
    "docs": false,
  }
};
</pre>
            </li>
            <li>
                <p>Create the <em>FillingFormTemplate</em> export. It consists of the select control with the persons options,
                <em>ContentControls</em> and <em>DocumentEditor</em> components:</p>
                <pre>
"template": '&lt;vSelect v-model="selectedPerson" :options="persons"&gt;&lt;/vSelect&gt; &lt;ContentControls :contentControls="contentControls" @onChangeSelectedPerson="onChangeSelectedPerson" :setFormValue="setFormValue"/&gt; &lt;DocumentEditor :id="editorId" :config="config" :documentServerUrl="documentServerUrl" :events_onDocumentReady="onDocumentReady" /&gt;'
</pre>
                <ul>
                    <li>
                        <p>The persons options are loaded from the <em>data/persons.json</em> file:</p>
                        <pre>
import persons from "./data/persons.json";

getPersonsOptions() {
    let personsOptions = [];
    for(let i = 0; i &lt; persons.length; i++) {
        personsOptions[i] = {
            label: persons[i].FirstName + " " + persons[i].LastName,
            value: persons[i]
        }
    }

    return personsOptions;
},
</pre>
                        <p>In this json file, each person is specified in the following format:</p>
                        <pre>
{
    "Title": "Miss",
    "LastName": "Robinson",
    "FirstName": "Isabella",
    "MiddleName": "Pierre",
    "DateOfBirth": "14121987",
    "Sex": "Female",
    "Phone": "(972)234-8261",
    "Email": "Isabella.Robinson@email.com",
    "Number/street": "625 Hartin Cir",
    "City": "Irving",
    "PostalCode": "75061",
    "Country": "U.S.A."
}
</pre>
                    </li>
                    <li>
                        <p>The select control is created with the <em>vSelect</em> component which is imported from <em>vue-select</em>:</p>
                        <pre>
import vSelect from "vue-select";
</pre>
                        <note>
                            <p>You need to install the <em>react-select/async</em> library for this control to work correctly:</p>
                            <pre>
npm install vue-select@beta
</pre>
                        </note>
                        <pre>
setFormValue(formId, value) {
    this.connector.executeMethod("GetFormsByTag", [formId], function(forms) {
        this.connector.executeMethod("SetFormValue", [forms[0]["InternalId"], value], null);
    }.bind(this));
},

watch: {
    selectedPerson: function (newValue, oldValue) {
        if (this.selectedPerson && this.selectedPerson.label != "Custom Data") {
            for (var [key, value] of Object.entries(this.selectedPerson.value)) {
                if (key == "Sex") {
                    key = value == "Male" ? "Male" : "Female";
                    value = "true";
                }

                this.setFormValue(key, value || "");
            }
        }
    }
}
</pre>
                        <p>When a user of the Vue application selects one of the options from the <em>Select</em> control,
                        the <a href="<%= Url.Action("executemethod/form/getformsbytag", "plugin") %>">executeMethod.GetFormsByTag</a> method is executed
                        and returns a list of forms with the specified tag from the ONLYOFFICE editor.</p>
                        <p>After that, the <a href="<%= Url.Action("executemethod/form/setformvalue", "plugin") %>">SetFormValue</a> method is executed
                        and sets the corresponding values to the specified forms.</p>
                        <img class="screenshot max-width-832" alt="Select control data" src="<%= Url.Content("~/content/img/editor/vue/select-control-data.png") %>" />
                    </li>
                    <li>
                        <p>When the document is loaded into the document editor, the <a href="<%= Url.Action("executemethod/text/getallcontentcontrols", "plugin") %>">executeMethod.GetAllContentControls</a> method is executed,
                        collects all the content controls from the current document, and specifies the types and group keys for them.
                        The <a href="<%= Url.Action("executemethod/form/getformvalue", "plugin") %>">executeMethod.GetFormValue</a> returns a value for each form
                        and write it in the controls of the <em>ContentControls</em> component:</p>
                        <pre>
getAllContentControls() {
    this.connector.executeMethod ("GetAllContentControls", null, function(data) {
        for (let i = 0; i &lt; data.length; i++) {
            switch (data[i].Tag) {
                case "Male":
                    data[i].GroupKey = "Sex";
                    data[i].Type = "radio";
                    break;
                case "Female":
                    data[i].GroupKey = "Sex";
                    data[i].Type = "radio";
                    break;
                default:
                    data[i].Type = "input";
            }

            this.connector.executeMethod("GetFormValue", [data[i].InternalId], (value) =&gt; {
                data[i].Value = value ? value : "";
                if (data.length - 1 == i) {
                    this.contentControls = data.filter((contentControl) =&gt; contentControl.Tag != "");
                }
            });
        }
    }.bind(this));
}
</pre>
                    </li>
                    <li>
                        <p>Define the <a href="<%= Url.Action("events/onchangecontentcontrol", "plugin") %>">onChangeContentControl</a> event:
                        when the content control is changed in the document, all the content controls values are updated in the Vue application:</p>
                        <pre>
onChangeContentControl() {
    this.getAllContentControls();
},
</pre>
                    </li>
                    <li>
                        <p>Define the <a href="<%= Url.Action("events/onblurcontentcontrol", "plugin") %>">onBlurContentControl</a> event:
                         when the content control is blurred in the document, the "Custom Data" label is set in the select content control:</p>
                        <pre>
onBlurContentControl(contentControl) {
    this.selectedPerson = { "label": "Custom Data" }
},
</pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
                <img class="screenshot max-width-832" alt="Filling form template" src="<%= Url.Content("~/content/img/editor/vue/filling-form-template.png") %>" />
            </li>
        </ol>
    </li>
</ol>
