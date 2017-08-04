<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Conversion API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Conversion API</span>
    </h1>

    <p class="dscr">For the interaction with the <b>document conversion service</b> the POST requests are used. The request parameters are entered in JSON format in the request body. The requests are sent to the <span class="fakelink">http://documentserver/ConvertService.ashx</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>

    <div class="note">In <b>ONLYOFFICE Document Server</b> prior to version 4.2 the GET request with the parameters in the <em>QueryString</em> were used.</div>

    <h2>Parameters and their description:</h2>
    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
            <col style="width: 150px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Parameter</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="async" class="copy-link">async</td>
                <td>Defines the conversion request type: asynchronous or not.<br />
                    Supported values:
                    <ul>
                        <li>true</li>
                        <li>false</li>
                    </ul>
                    When the asynchronous request type is used, the reply is formed instantly. In this case to get the result it is necessary to send requests without parameter change until the conversion is finished.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="codePage" class="copy-link">codePage</td>
                <td>Defines the file encoding when converting from <em>csv</em> or <em>txt</em> format.<br />
                    Main supported values:
                    <ul>
                        <li><b>932</b> - Japanese (Shift-JIS),</li>
                        <li><b>950</b> - Chinese Traditional (Big5),</li>
                        <li><b>1250</b> - Central European (Windows),</li>
                        <li><b>1251</b> - Cyrillic (Windows),</li>
                        <li><b>65001</b> - Unicode (UTF-8).</li>
                    </ul>
                    You can find all the supported values <a target="_blank" href="https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js">in this file</a>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="delimiter" class="copy-link">delimiter</td>
                <td>Dfines the delimiter characters for separating values when converting from <em>csv</em> format.<br />
                    Supported values:
                    <ul>
                        <li><b>0</b> - no delimiter,</li>
                        <li><b>1</b> - tab,</li>
                        <li><b>2</b> - semicolon,</li>
                        <li><b>3</b> - colon,</li>
                        <li><b>4</b> - comma,</li>
                        <li><b>5</b> - space.</li>
                    </ul>
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="filetype" class="copy-link">filetype<span class="required">*</span></td>
                <td>Defines the type of the document file to be converted.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>Defines the document identifier used to unambiguously identify the document file.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="outputtype" class="copy-link">outputtype<span class="required">*</span></td>
                <td>Defines the resulting converted document type.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail" class="copy-link">thumbnail</td>
                <td>Defines the option is used since version 4.2. Settings for the thumbnail when specifying the image formats (<em>bmp</em>, <em>gif</em>, <em>jpg</em>, <em>png</em>) as <b>outputtype</b>. The object has the following parameters:
                    <ul>
                        <li><b>aspect</b> - sets the mode to fit the image to the height and width specifyed. Supported values: 0 - stretch file to fit height and width, 1 - keep the aspect for the image,
                            <br />
                            <b>type</b>: integer,
                            <br />
                            <b>example</b>: 1;
                        </li>
                        <li><b>first</b> - specifies if the thumbnails should be generated for the first page only or for all the document pages. If false, the zip archive containing thumbnails for all the pages will be created. The default value is <em>true</em>,
                            <br />
                            <b>type</b>: boolean,
                            <br />
                            <b>example</b>: true;
                        </li>
                        <li><b>height</b> - the thumbnail height in pixels (default: 100),
                            <br />
                            <b>type</b>: integer,
                            <br />
                            <b>example</b>: 100;
                        </li>
                        <li><b>width</b> - the thumbnail width in pixels (default: 100),
                            <br />
                            <b>type</b>: integer,
                            <br />
                            <b>example</b>: 100.
                        </li>
                    </ul>
                </td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="title" class="copy-link">title</td>
                <td>Defines the converted file name.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>Defines the link to the document to be converted.</td>
                <td>string</td>
                <td>required</td>
            </tr>
        </tbody>
    </table>
    <span class="required-descr"><span class="required">*</span><em> - in the tables below you can see possibility of conversion your documents into the most known file formats, where the <b>Input format</b> column corresponds to the values of the <b>filetype</b> parameter and the  <b>Output format</b> columns correspond to the values of the <b>outputtype</b> parameter.</em></span>

    <h2 id="text-matrix" class="copy-link">Text document file formats</h2>
    <table class="table-conversion-matrix-text">
        <tbody>
            <tr>
                <th rowspan="2">Input format</th>
                <th colspan="9">Output format</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>docx</td>
                <td>gif</td>
                <td>jpg</td>
                <td>odt</td>
                <td>pdf</td>
                <td>png</td>
                <td>rtf</td>
                <td>txt</td>
            </tr>
            <tr>
                <td>doc</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>docm</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>docx</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>epub</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>html</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>mht</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>odt</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>pdf</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>rtf</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>txt</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
            </tr>
            <tr>
                <td>xps</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
                
    <h2 id="spreadsheet-matrix" class="copy-link">Spreadsheet file formats</h2>
    <table class="table-conversion-matrix-spreadsheet">
        <tbody>
            <tr>
                <th rowspan="2">Input format</th>
                <th colspan="8">Output format</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>csv</td>
                <td>gif</td>
                <td>jpg</td>
                <td>ods</td>
                <td>pdf</td>
                <td>png</td>
                <td>xlsx</td>
            </tr>
            <tr>
                <td>csv</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>ods</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>xls</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>xlsm</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>xlsx</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <h2 id="presentation-matrix" class="copy-link">Presentation file formats</h2>
    <table class="table-conversion-matrix-presentation">
        <tbody>
            <tr>
                <th rowspan="2">Input format</th>
                <th colspan="7">Output format</th>
            </tr>
            <tr>
                <td>bmp</td>
                <td>gif</td>
                <td>jpg</td>
                <td>odp</td>
                <td>pdf</td>
                <td>png</td>
                <td>pptx</td>
            </tr>
            <tr>
                <td>odp</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>pps</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>ppsx</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>ppt</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>pptm</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
            </tr>
            <tr>
                <td>pptx</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td class="table-conversion-matrix-cell-tick">&#10003;</td>
                <td></td>
            </tr>
        </tbody>
    </table>

    <div id="sample-conversion" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to convert the file from <em>docx</em> format to <em>pdf</em> format</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "http://example.com/url-to-example-document.docx"
}
</pre>
    <p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

    <div id="sample-thumbnail" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to generate <em>png</em> thumbnail of file in <em>docx</em> format</div>
    <pre>
{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "png",
    "thumbnail": {
        "aspect": 0,
        "first": true,
        "height": 150,
        "width": 100
    },
    "title": "Example Document Title.docx",
    "url": "http://example.com/url-to-example-document.docx"
}
</pre>
    <p>Where the <b>example.com</b> is the name of the the server where <b>document manager</b> and <b>document storage service</b> are installed. See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.</p>

    <p>The request result is returned in XML form.</p>
    <div class="header-gray">Reply format</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;FileUrl&gt;[Link to the converted file at the server]&lt;/FileUrl&gt;
    &lt;Percent&gt;[Conversion progress percentage]&lt;/Percent&gt;
    &lt;EndConvert&gt;[Conversion is finished - True|False]&lt;/EndConvert&gt;
&lt;/FileResult&gt;
</pre>
    <p>When forming the link to the resulting file, the same server name is used which was made the conversion request to.</p>
    <div class="header-gray">Reply example</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;FileUrl&gt;http://documentserver/ResourceService.ashx?filename=output.doc&lt;/FileUrl&gt;
    &lt;Percent&gt;100&lt;/Percent&gt;
    &lt;EndConvert&gt;True&lt;/EndConvert&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Example of the intermediate reply to the asynchronous request (with the parameter <em>async=true</em>)</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;FileUrl&gt;&lt;/FileUrl&gt;
    &lt;Percent&gt;95&lt;/Percent&gt;
    &lt;EndConvert&gt;False&lt;/EndConvert&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Reply format when an error occurred</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;Error&gt;Error code&lt;/Error&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Example of the reply when an error occurred</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;Error&gt;-3&lt;/Error&gt;
&lt;/FileResult&gt;
</pre>

    <div class="header-gray">Possible error codes and their description</div>
    <table class="table">
        <colgroup>
            <col style="width: 105px;" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Error code</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>-1</td>
                <td>Unknown error.</td>
            </tr>
            <tr class="tablerow">
                <td>-2</td>
                <td>Timeout conversion error.</td>
            </tr>
            <tr class="tablerow">
                <td>-3</td>
                <td>Conversion error.</td>
            </tr>
            <tr class="tablerow">
                <td>-4</td>
                <td>Error while downloading the document file to be converted.</td>
            </tr>
            <tr class="tablerow">
                <td>-6</td>
                <td>Error while accessing the conversion result database.</td>
            </tr>
            <tr class="tablerow">
                <td>-8</td>
                <td>Invalid token.</td>
            </tr>
            <%--<tr class="tablerow">
                <td>-21</td>
                <td>Token signature is expired.</td>
            </tr>--%>
        </tbody>
    </table>
</asp:Content>
