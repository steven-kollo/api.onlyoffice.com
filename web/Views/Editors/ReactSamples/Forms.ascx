<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Forms</span>
</h1>

<p class="dscr">
    Let's create the <em>ContentControls</em> component and its accompanying story files: <em>src/components/ContentControls/ContentControls.tsx</em>,
    <em>src/Forms.stories.tsx</em>, and <em>src/FillingForm.stories.tsx</em>. This component is composite, i.e. it is based on other components.
    All the <em>ContentControls</em> components are placed in the <em>src/components/ContentControls</em> folder.
</p>

<ol>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/ContentControls/InputControl.tsx" target="_blank">InputControl.tsx</a> file
        with the <em>InputControl</em> component and specify the <em>onChangeInput</em> event in it:</p>
        <pre>
const onChangeInput = (event: any) => {
    setInputValue(event.target.value);
    setFormValue(event.target.id, event.target.value);
    setSelectedOption({label: "Custom Data"});
};

const setFormValue = (formId: string, value: string) =&gt; {
    connector.current.executeMethod(
        "GetFormsByTag",
        [formId],
        (forms: any) => {
            connector.current.executeMethod(
                "SetFormValue",
                [forms[0]["InternalId"], value],
                null
            );
        }
    );
};
</pre>
        <p>Specify the component HTML structure by adding an input content control:</p>
        <pre>
return (
    &lt;div className="control"&gt;
        &lt;label&gt;{label}&lt;/label&gt;
        &lt;input id={id} value={inputValue} onChange={onCangeInput}/&gt;
    &lt;/div&gt;
);
</pre>
        <ul>
            <li>When a user of the React application types any value in the input field,
                the <a href="<%= Url.Action("executemethod/form/getformsbytag", "plugin") %>">executeMethod.GetFormsByTag</a> method is executed
                and returns a list of forms with the specified tag from the ONLYOFFICE editor.</li>
            <li>After that, the <a href="<%= Url.Action("executemethod/form/setformvalue", "plugin") %>">executeMethod.SetFormValue</a> method is executed
                and sets the entered value to the specified form.</li>
            <li>In this case, the <em>Select</em> control is set to <em>Custom Data</em> with the <em>setSelectedOption</em> function.</li>
        </ul>
        <img class="screenshot max-width-832" alt="Input control component" src="<%= Url.Content("~/content/img/editor/react/input-control-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/ContentControls/RadioControl.tsx" target="_blank">RadioControl.tsx</a> file
        with the <em>RadioControl</em> component and specify the <em>onRadioControl</em> event in it:</p>
        <pre>
const onRadioControl = (event: any) =&gt; {
    setCheckedOptionState(event.target.id);
    setFormValue(event.target.id, "true");
    setSelectedOption({ "label": "Custom Data" });
};

const setFormValue = (formId: string, value: string) =&gt; {
    connector.current.executeMethod(
        "GetFormsByTag",
        [formId],
        (forms: any) =&gt;{
            connector.current.executeMethod(
                "SetFormValue",
                [forms[0]["InternalId"], value],
                null
            );
        }
    );
};
</pre>
        <p>Specify the component HTML structure by adding a radio content control:</p>
        <pre>
return (
    &lt;div id={id} className="control"&gt;
        &lt;label&gt;{label}&lt;/label&gt;
        &lt;div className="radioControl"&gt;
            {options.map((option) =&gt;
                &lt;span key={option.Tag}&gt;
                &lt;input type="radio" id={option.Tag} checked={checkedOptionState == option.Tag} onChange={onRadioControl}/&gt;
                &lt;label className="radioLabel"&gt;{option.Tag.replace(/([a-z])([A-Z])/g, '$1 $2')}&lt;/label&gt;
                &lt;/span&gt;
            )}
        &lt;/div&gt;
    &lt;/div&gt;
);
</pre>
        <ul>
            <li>When a user of the React application checks any radio control,
                the <a href="<%= Url.Action("executemethod/form/getformsbytag", "plugin") %>">executeMethod.GetFormsByTag</a> method is executed
                and returns a list of forms with the specified tag from the ONLYOFFICE editor.</li>
            <li>After that, the <a href="<%= Url.Action("executemethod/form/setformvalue", "plugin") %>">executeMethod.SetFormValue</a> method is executed
                and checks the specified radio form.</li>
            <li>In this case, the <em>Select</em> control is set to <em>Custom Data</em> with the <em>setSelectedOption</em> function.</li>
        </ul>
        <img class="screenshot max-width-832" alt="Radio control component" src="<%= Url.Content("~/content/img/editor/react/radio-control-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/ContentControls/SelectDataControl.tsx" target="_blank">SelectDataControl.tsx</a> file
        with the <em>SelectDataControl</em> component and specify the <em>onChange</em> event in it:</p>
        <pre>
const onChange = (option: any) =&gt; {
    setSelectedOption(option);

    for (var [key, value] of Object.entries&lt;string&gt;(option.value)) {
        if (key == "Sex") {
            key = value == "Male" ? "Male" : "Female";
            value = "true";
        }

        setFormValue(key, value || "");
    }
};

const setFormValue = (formId: string, value: string) =&gt; {
    connector.current.executeMethod(
        "GetFormsByTag",
        [formId],
        (forms: any) =&gt; {
            connector.current.executeMethod(
                "SetFormValue",
                [forms[0]["InternalId"], value],
                null
            );
        }
    );
};
</pre>
        <p>Specify the component HTML structure by adding a select content control:</p>
        <pre>
return (
    &lt;Select
        value={selectedOption}
        onChange={onChange}
        options={options}
    /&gt;
);
</pre>
        <ul>
            <li>When a user of the React application selects one of the options from the <em>Select</em> control,
                the <a href="<%= Url.Action("executemethod/form/getformsbytag", "plugin") %>">executeMethod.GetFormsByTag</a> method is executed
                and returns a list of forms with the specified tag from the ONLYOFFICE editor.</li>
            <li>After that, the <a href="<%= Url.Action("executemethod/form/setformvalue", "plugin") %>">executeMethod.SetFormValue</a> method is executed
                and sets the corresponding values to the specified forms.</li>
        </ul>
        <note>
            <p>You need to install the <em>react-select/async</em> library for this control to work correctly:</p>
            <pre>
npm install react-select
</pre>
        </note>
        <img class="screenshot max-width-832" alt="Select control data" src="<%= Url.Content("~/content/img/editor/react/select-control-data.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/ContentControls/ContentControls.tsx" target="_blank">ContentControls.tsx</a> file
        with the <em>ContentControls</em> component which connects the <em>InputControl</em> and <em>RadioControl</em> components created earlier:</p>
        <pre>
import "./ContentControls.css";
import InputControl from  "./InputControl";
import RadioControl from "./RadioControl";
</pre>
        <p>The block with the input and radio controls is created with the specified control parameters: key, id, label, options, value, etc.:</p>
        <pre>
const getComponent = (contentControl: any) =&gt; {
    switch (contentControl.Type) {
        case "input":
            return &lt;InputControl
                key={contentControl.InternalId}
                id={contentControl.Tag}
                label={contentControl.Tag.replace(/([a-z])([A-Z])/g, '$1 $2')}
                value={contentControl.Value}
                setSelectedOption={setSelectedOption}
                connector={connector}
            /&gt;
        case "radio": 
            return &lt;RadioControl
                key={contentControl.InternalId}
                id={contentControl.Tag}
                label={contentControl.Tag.replace(/([a-z])([A-Z])/g, '$1 $2')}
                options={contentControl.Value}
                setSelectedOption={setSelectedOption}
                connector={connector}
            /&gt;
    }
}

return (
    &lt;div className="controlBlock"&gt;
        {copyContentControls.filter(contentControl => contentControl.Tag != "").map((contentControl) => getComponent(contentControl))}
        &lt;/div&gt;
);
</pre>
        <p>The content controls styles are defined in the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/ContentControls/ContentControls.css" target="_blank">ContentControls.css</a> file.</p>
    </li>
    <li>
        <p>Now that all the components are ready, you can code the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/Forms.stories.tsx" target="_blank">Forms.stories.tsx</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
    "title": "Samples/Form templates",
    "component": DocumentEditor,
    "parameters": {},
    "decorators": [
        (Story) =&gt; (
            &lt;div style={{ "height": "400px" }}&gt;
                &lt;Story /&gt;
            &lt;/div&gt;
        ),
    ]
} as ComponentMeta&lt;typeof DocumentEditor&gt;;
</pre>
            </li>
            <li>
                <p>Create the <em>FormsTemplate</em> export. It consists of the select control with the <em>pdf</em> documents options and <em>DocumentEditor</em> component:</p>
                <pre>
return (
    &lt;div&gt;
        &lt;AsyncSelect
            key={1}
            value={selectedOption1}
            onChange={handleChange1}
            cacheOptions
            defaultOptions
            loadOptions={load}
        /&gt;

        &lt;DocumentEditor {...args}
            "id"="pdfEditor"
            "config"={{
                "document": {
                    "fileType": "pdf",
                    "key": "pdf" + Math.random(),
                    "title": selectedOption1
                        ? selectedOption1.label
                        : "oform.pdf",
                    "url": selectedOption1
                        ? selectedOption1.value
                        : config.demoStorage + "oform.pdf",
                },
                "documentType": "word",
            }}
            "height"="600px"
        /&gt;
    &lt;/div&gt;
)
</pre>
                <p>The <em>pdf</em> documents options are loaded from the storage which is specified in the <em>config.oformsUrl</em> parameters:</p>
                <pre>
const loadOptions = async () =&gt; {
    try {
      const res = await fetch(
        config.oformsUrl
      );
      const jData = await res.json();

      const fileOforms = jData.data.map(
        (item: { attributes: { file_oform: { data: any[] } } }) =&gt;
          item.attributes.file_oform.data.find(
            (f) =&gt; f.attributes.ext === ".pdf"
          )
        );
      const options = fileOforms
        .map((form: { attributes: { url: any; name: any } }) =&gt; {
          return form && form.attributes
            ? { value: form.attributes.url, label: form.attributes.name }
            : null;
          })
        .filter((o: any) =&gt; o != null);

      return options;
    } catch (e) {
      console.error(e);
    }
}
</pre>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
                <img class="screenshot max-width-832" alt="Form template" src="<%= Url.Content("~/content/img/editor/react/form-template.png") %>" />
            </li>
        </ol>
    </li>
    <li>
        <p>Code the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/FillingForm.stories.tsx" target="_blank">FillingForm.stories.tsx</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
    "title": "Samples/Work with forms",
    "component": DocumentEditor,
    "parameters": {},
    "decorators": [
        (Story) =&gt; (
            &lt;div style={{ "height": "400px" }}&gt;
                &lt;Story /&gt;
            &lt;/div&gt;
        ),
    ]
} as ComponentMeta&lt;typeof DocumentEditor&gt;
</pre>
            </li>
            <li>
                <p>Create the <em>FillingFormTemplate</em> export. It consists of the select control with the persons options,
                <em>ContentControls</em> and <em>DocumentEditor</em> components:</p>
                <pre>
return (
    &lt;div&gt;
      &lt;SelectDataControl selectedOption={selectedPerson} setSelectedOption={setSelectedPerson} options={args.selector.persons} connector={connectorRef} /&gt;
      &lt;br /&gt;

      &lt;ContentControls contentControls={contentControls} connector={connectorRef} setSelectedOption={setSelectedPerson}/&gt;

      &lt;DocumentEditor {...args.DocumentEditor}
        "id"="pdfEditor"
        "config"={{
            "document": {
                "fileType": "pdf",
                "key":  args.key,
                "title": "withtags.pdf",
                "url": config.demoStorage + "withtags.pdf",
            },
            "documentType": "word",
        }}
        "width"="70%"
        "height"="700px"
        "events_onDocumentReady"={onDocumentReady}
        /&gt;
    &lt;/div&gt;
)
</pre>
                <ul>
                    <li>
                        <p>The persons options are loaded from the <em>data/persons.json</em> file:</p>
                        <pre>
import persons from "./data/persons.json";

function getPersonsOptions(){
  let personsOptions = [];
  for(let i = 0; i &lt; persons.length; i++) {
    personsOptions[i] = {
      label: persons[i].FirstName +" "+ persons[i].LastName,
      value: persons[i]
    }
  }

  return personsOptions;
}
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
                        <p>When the document is loaded into the document editor,
                        the <a href="<%= Url.Action("executemethod/text/getallcontentcontrols", "plugin") %>">executeMethod.GetAllContentControls</a> method is executed,
                        collects all the content controls from the current document, and specifies the types and group keys for them.
                        The <a href="<%= Url.Action("executemethod/form/getformvalue", "plugin") %>">executeMethod.GetFormValue</a> method returns a value for each form
                        and write it in the controls of the <em>ContentControls</em> component:</p>
                        <pre>
const getAllContentControls = () =&gt; {
    connectorRef.current.executeMethod ("GetAllContentControls", null, function(data: any) {
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

        connectorRef.current.executeMethod("GetFormValue", [data[i].InternalId], (value: any) =&gt; {
            data[i].Value = value ? value : "";
            if (data.length - 1 == i) {
              setContentControls(data);
            }
        });
      }
    });
}
</pre>
                    </li>
                    <li>
                        <p>Define the <a href="<%= Url.Action("events/onchangecontentcontrol", "plugin") %>">onChangeContentControl</a> event:
                        when the content control is changed in the document, all the content controls values are updated in the React application:</p>
                        <pre>
const onChangeContentControl = (oPr: { Tag?: string; InternalId?: string }) =&gt; {
    getAllContentControls();
};
</pre>
                    </li>
                    <li>
                        <p>Define the <a href="<%= Url.Action("events/onblurcontentcontrol", "plugin") %>">onBlurContentControl</a> event:
                        when the content control is blurred in the document, the "Custom Data" label is set in the select content control:</p>
                        <pre>
const onBlurContentControl = (oPr: { Tag?: string; InternalId?: string }) =&gt; {
    setSelectedPerson({ label: "Custom Data" });
};
</pre>
                    </li>
                </ul>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
                <img class="screenshot max-width-832" alt="Filling form template" src="<%= Url.Content("~/content/img/editor/react/filling-form-template.png") %>" />
            </li>
        </ol>
    </li>
</ol>
