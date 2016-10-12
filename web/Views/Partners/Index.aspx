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
			    <td><%= Html.ActionLink("Partner Information", "getpartner") %></td>
			    <td><%= Html.ActionLink("GET /api/partnerapi/partner", "getpartner") %></td>
			    <td>Partner information method is used to get the general information (first name, last name, email, domain, etc.) about the partner.</td>
		    </tr>
		    <tr class="tablerow">
			    <td><%= Html.ActionLink("Partner Detailed Information", "getcurrentpartner") %></td>
			    <td><%= Html.ActionLink("GET /api/partnerapi/getcurrentpartner", "getcurrentpartner") %></td>
			    <td>Partner information method is used to get the specific information (generated key amount, paid invoices number, etc.) together with the <%= Html.ActionLink("general information", "getpartner") %> about the partner.</td>
		    </tr>
		    <tr class="tablerow">
			    <td><%= Html.ActionLink("Partner Pricing Plans", "getpartnertariffs") %></td>
			    <td><%= Html.ActionLink("GET /api/partnerapi/tariffs", "getpartnertariffs") %></td>
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
				<td><%= Html.ActionLink("Client Creation", "createclient") %></td>
				<td><%= Html.ActionLink("POST /api/partnerapi/client", "createclient") %></td>
				<td>Client creation method is used to create a client using the parameters (pricing plan, portal address, user email address, etc.) specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Request Client Payment", "requestclientpayment") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/requestclientpayment", "requestclientpayment") %></td>
				<td>Notification on an attempt to get a key from the partner or to buy a portal pricing plan via PayPal payment system.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Button Creation", "createbutton") %></td>
				<td><%= Html.ActionLink("POST /api/partnerapi/button", "createbutton") %></td>
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
				<td><%= Html.ActionLink("Portal Registration", "registerportal") %></td>
				<td><%= Html.ActionLink("POST /api/partnerapi/registerportal", "registerportal") %></td>
				<td>Portal registration method is used to register a new portal with the parameters specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Portal Status Change", "changeportalstatus") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/changeportalstatus", "changeportalstatus") %></td>
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
				<td><%= Html.ActionLink("Minimal Pricing Plan Key Generation", "generatekeysmin") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/generatekeys", "generatekeysmin") %></td>
				<td>Minimal pricing plan key generation method is used to create the number of keys specified in the request for the minimal pricing plan.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Key Generation", "generatekeys") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/generatekeys", "generatekeys") %></td>
				<td>Key generation method is used to generate new keys for the partner with the ID and the number of keys specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Key Activation", "activatekey") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/activatekey", "activatekey") %></td>
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
				<td><%= Html.ActionLink("Invoice List", "getpartnerinvoices") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/getpartnerinvoices", "getpartnerinvoices") %></td>
				<td>Invoice list method returns the list of all invoices for the current partner.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Invoice Keys", "getinvoicekeys") %></td>
				<td><%= Html.ActionLink("GET /api/partnerapi/getinvoicekeys", "getinvoicekeys") %></td>
				<td>Invoice keys method is used to get the list of all the keys generated for the invoice with the ID specified in the request.</td>
			</tr>
			<tr class="tablerow">
				<td><%= Html.ActionLink("Invoice Status Change", "changeinvoicestatus") %></td>
				<td><%= Html.ActionLink("POST /api/partnerapi/changeinvoicestatus", "changeinvoicestatus") %></td>
				<td>Invoice status change method is used to change the status of the invoice with the selected ID for the status specified in the request.</td>
			</tr>
        </tbody>
	</table>
    <% } %>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>