<%@ 
    Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html"
%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Partners Program API Methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var section = Model as string; %>

    <% if(string.IsNullOrEmpty(section) || string.Equals(section, "partners")) { %>
	<h1>
	    <span class="hdr">Partners</span>
	</h1>
	<table class="table hover">
		<colgroup>
            <col style="width: 25%"/>
            <col style="width: 25%"/>
            <col/>
        </colgroup>
        <thead>
            <tr class="tablerow">
				<td>Method</td>
				<td>Resource</td>
				<td>Description</td>
			</tr>
        </thead>
        <tbody>
		    <tr class="tablerow">
			    <td><a href="<%= Url.Action("getpartner") %>">Partner Information</a></td>
			    <td><a href="<%= Url.Action("getpartner") %>">GET /api/partnerapi/partner</a></td>
			    <td>Partner information method is used to get the general information (first name, last name, email, domain, etc.) about the partner.</td>
		    </tr>
		    <tr class="tablerow">
			    <td><a href="<%= Url.Action("getcurrentpartner") %>">Partner Detailed Information</a></td>
			    <td><a href="<%= Url.Action("getcurrentpartner") %>">GET /api/partnerapi/getcurrentpartner</a></td>
			    <td>Partner information method is used to get the specific information (generated key amount, paid invoices number, etc.) together with the <a href="<%= Url.Action("") %>">general information", "getpartner") %> about the partner.</td>
		    </tr>
		    <tr class="tablerow">
			    <td><a href="<%= Url.Action("getpartnertariffs") %>">Partner Pricing Plans</a></td>
			    <td><a href="<%= Url.Action("getpartnertariffs") %>">GET /api/partnerapi/tariffs</a></td>
			    <td>Partner information method is used to get the partner pricing plans.</td>
		    </tr>
        </tbody>
	</table>
    <% } %>

    <% if(string.IsNullOrEmpty(section) || string.Equals(section, "clients")) { %>
	<h1>
	    <span class="hdr">Clients and Payments</span>
	</h1>
	<table class="table hover">
		<colgroup>
			<col style="width: 25%"/>
            <col style="width: 25%"/>
            <col/>
		</colgroup>
        <thead>
            <tr class="tablerow">
				<td>Method</td>
				<td>Resource</td>
				<td>Description</td>
			</tr>
        </thead>
        <tbody>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("createclient") %>">Client Creation</a></td>
				<td><a href="<%= Url.Action("createclient") %>">POST /api/partnerapi/client</a></td>
				<td>Client creation method is used to create a client using the parameters (pricing plan, portal address, user email address, etc.) specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("requestclientpayment") %>">Request Client Payment</a></td>
				<td><a href="<%= Url.Action("requestclientpayment") %>">GET /api/partnerapi/requestclientpayment</a></td>
				<td>Notification on an attempt to get a key from the partner or to buy a portal pricing plan via PayPal payment system.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("createbutton") %>">Button Creation</a></td>
				<td><a href="<%= Url.Action("createbutton") %>">POST /api/partnerapi/button</a></td>
				<td>Create the button to be able to buy a portal pricing plan via PayPal payment system.</td>
			</tr>
        </tbody>
	</table>
    <% } %>

    <% if(string.IsNullOrEmpty(section) || string.Equals(section, "portals")) { %>
	<h1>
	    <span class="hdr">Portals</span>
	</h1>
	<table class="table hover">
		<colgroup>
			<col style="width: 25%"/>
            <col style="width: 25%"/>
            <col/>
		</colgroup>
        <thead>
			<tr class="tablerow">
				<td>Method</td>
				<td>Resource</td>
				<td>Description</td>
			</tr>
        </thead>
        <tbody>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("registerportal") %>">Portal Registration</a></td>
				<td><a href="<%= Url.Action("registerportal") %>">POST /api/partnerapi/registerportal</a></td>
				<td>Portal registration method is used to register a new portal with the parameters specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("changeportalstatus") %>">Portal Status Change</a></td>
				<td><a href="<%= Url.Action("changeportalstatus") %>">GET /api/partnerapi/changeportalstatus</a></td>
				<td>Portal status change method is used to change the current portal status for the status specified in the request.</td>
			</tr>
        </tbody>
	</table>
	<% } %>

    <% if(string.IsNullOrEmpty(section) || string.Equals(section, "keys")) { %>
    <h1>
        <span class="hdr">Keys</span>
    </h1>
	<table class="table hover">
		<colgroup>
			<col style="width: 25%"/>
            <col style="width: 25%"/>
            <col/>
		</colgroup>
        <thead>
			<tr class="tablerow">
				<td>Method</td>
				<td>Resource</td>
				<td>Description</td>
			</tr>
        </thead>
        <tbody>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("generatekeysmin") %>">Minimal Pricing Plan Key Generation</a></td>
				<td><a href="<%= Url.Action("generatekeysmin") %>">GET /api/partnerapi/generatekeys</a></td>
				<td>Minimal pricing plan key generation method is used to create the number of keys specified in the request for the minimal pricing plan.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("generatekeys") %>">Key Generation</a></td>
				<td><a href="<%= Url.Action("generatekeys") %>">GET /api/partnerapi/generatekeys</a></td>
				<td>Key generation method is used to generate new keys for the partner with the ID and the number of keys specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("activatekey") %>">Key Activation</a></td>
				<td><a href="<%= Url.Action("activatekey") %>">GET /api/partnerapi/activatekey</a></td>
				<td>Key activation method is used to activate the key provided for the portal payment with the key code specified in the request.</td>
			</tr>
        </tbody>
	</table>
	<% } %>

    <% if(string.IsNullOrEmpty(section) || string.Equals(section, "invoices")) { %>
    <h1>
        <span class="hdr">Invoices</span>
    </h1>
	<table class="table hover">
		<colgroup>
			<col style="width: 25%"/>
            <col style="width: 25%"/>
            <col/>
		</colgroup>
        <thead>
			<tr class="tablerow">
				<td>Method</td>
				<td>Resource</td>
				<td>Description</td>
			</tr>
        </thead>
        <tbody>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("getpartnerinvoices") %>">Invoice List</a></td>
				<td><a href="<%= Url.Action("getpartnerinvoices") %>">GET /api/partnerapi/getpartnerinvoices</a></td>
				<td>Invoice list method returns the list of all invoices for the current partner.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("getinvoicekeys") %>">Invoice Keys</a></td>
				<td><a href="<%= Url.Action("getinvoicekeys") %>">GET /api/partnerapi/getinvoicekeys</a></td>
				<td>Invoice keys method is used to get the list of all the keys generated for the invoice with the ID specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><a href="<%= Url.Action("changeinvoicestatus") %>">Invoice Status Change</a></td>
				<td><a href="<%= Url.Action("changeinvoicestatus") %>">POST /api/partnerapi/changeinvoicestatus</a></td>
				<td>Invoice status change method is used to change the status of the invoice with the selected ID for the status specified in the request.</td>
			</tr>
        </tbody>
	</table>
    <% } %>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>