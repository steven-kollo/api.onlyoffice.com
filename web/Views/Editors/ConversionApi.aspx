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

    <p class="dscr">
        For the interaction with the <b>document conversion service</b> the POST requests are used.
        The request parameters are entered in JSON format in the request body.
        The requests are sent to the <span class="fakelink">https://documentserver/ConvertService.ashx</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.
    </p>

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
                <td>
                    Defines the conversion request type: asynchronous or not.<br />
                    Supported values:
                    <ul>
                        <li><b>true</b></li>
                        <li><b>false</b></li>
                    </ul>
                    When the asynchronous request type is used, the response is formed instantly.
                    In this case to get the result it is necessary to send requests without parameter change until the conversion is finished.
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="codePage" class="copy-link">codePage</td>
                <td>
                    Defines the file encoding when converting from <em>csv</em> or <em>txt</em> format.<br />
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
                <td>
                    Defines the delimiter characters for separating values when converting from <em>csv</em> format.<br />
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
                <td id="password" class="copy-link">password</td>
                <td>Defines the password for the document file if it is protected with a password.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail" class="copy-link">thumbnail</td>
                <td>Defines the settings for the thumbnail when specifying the image formats (<em>bmp</em>, <em>gif</em>, <em>jpg</em>, <em>png</em>) as <b>outputtype</b>.</td>
                <td>object</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-aspect" class="copy-link">thumbnail.aspect</td>
                <td>
                    Defines the mode to fit the image to the height and width specifyed.
                    Supported values:
                    <ul>
                        <li><b>0</b> - stretch file to fit height and width,</li>
                        <li><b>1</b> - keep the aspect for the image.</li>
                    </ul>
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-first" class="copy-link">thumbnail.first</td>
                <td>
                    Defines if the thumbnails should be generated for the first page only or for all the document pages.
                    If false, the zip archive containing thumbnails for all the pages will be created.
                    The default value is <b>true</b>,
                </td>
                <td>boolean</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-height" class="copy-link">thumbnail.height</td>
                <td>
                    Defines the thumbnail height in pixels.
                    The default value is <b>100</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="thumbnail-width" class="copy-link">thumbnail.width</td>
                <td>
                    Defines the thumbnail width in pixels.
                    The default value is <b>100</b>.
                </td>
                <td>integer</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="title" class="copy-link">title</td>
                <td>Defines the converted file name.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td id="token" class="copy-link">token</td>
                <td>Defines the encrypted signature added to the <b>Document Server</b> config in the form of a <a href="<%= Url.Action("signature/body") %>#conversion">token</a>.</td>
                <td>string</td>
                <td>required by configuration</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>Defines the absolute URL to the document to be converted.</td>
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
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>docx</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dot</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dotm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>dotx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>epub</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fodt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>html</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>mht</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>odt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ott</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pdf</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>rtf</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>txt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>xps</td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="no"></span></td>
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
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>fods</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ods</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ots</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xls</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xlsx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
            </tr>
            <tr>
                <td>xlt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xltm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>xltx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
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
                <td>fodp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>odp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>otp</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pot</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>potm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>potx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pps</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppsm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppsx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>ppt</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pptm</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
            </tr>
            <tr>
                <td>pptx</td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="yes"></span></td>
                <td><span class="no"></span></td>
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
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <div id="sample-password-conversion" class="header-gray copy-link">Sample of JSON object sent to <b>document conversion service</b> used to convert the password-protected file from <em>docx</em> format to <em>pdf</em> format</div>
    <pre>
{
    "async": false,
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "password": "123456",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

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
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
    <p>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>
    
    <div id="sample-conversion-token" class="header-gray copy-link">Sample of JSON object contains the JSON Web Token sent to <b>document conversion service</b> used to convert the file from <em>docx</em> format to <em>pdf</em> format</div>
    <pre>
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
</pre>
    <p>
        Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
        See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
    </p>

    <p id="response" class="copy-link">
        The request result is returned in XML format.
        To receive a response in JSON format you need to specify in the HTTP request Header <em>accept</em> with the value <b>application/json</b> (available from version 4.3).
        When forming the link to the resulting file, the same server name is used which was made the conversion request to.
    </p>
    <div class="header-gray">Sample of the response in XML format</div>
    <p>When forming the link to the resulting file, the same server name is used which was made the conversion request to.</p>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;EndConvert&gt;True&lt;/EndConvert&gt;
    &lt;FileUrl&gt;https://documentserver/ResourceService.ashx?filename=output.doc&lt;/FileUrl&gt;
    &lt;Percent&gt;100&lt;/Percent&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Sample of the response in JSON format</div>
    <p>When forming the link to the resulting file, the same server name is used which was made the conversion request to.</p>
    <pre>
{
    "endConvert": true,
    "fileUrl": "https://documentserver/ResourceService.ashx?filename=output.doc",
    "percent": 100
}
</pre>

    <div class="header-gray">Sample of the intermediate response to the asynchronous request (with the parameter <em>async=true</em>) in XML format</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;EndConvert&gt;False&lt;/EndConvert&gt;
    &lt;FileUrl&gt;&lt;/FileUrl&gt;
    &lt;Percent&gt;95&lt;/Percent&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Sample of the intermediate response to the asynchronous request (with the parameter <em>async=true</em>) in JSON format</div>
    <pre>
{
    "endConvert": false,
    "percent": 95
}
</pre>

    <div class="header-gray">Sample of the response when an error occurred in XML format</div>
    <pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;FileResult&gt;
    &lt;Error&gt;-3&lt;/Error&gt;
&lt;/FileResult&gt;
</pre>
    <div class="header-gray">Sample of the response when an error occurred in JSON format</div>
    <pre>
{
    "error": -3
}
</pre>

    <div id="error" class="copy-link header-gray">Possible error codes and their description</div>
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
                <td>Conversion timeout error.</td>
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
                <td>-5</td>
                <td>Incorrect password.</td>
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
