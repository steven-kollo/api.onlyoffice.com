<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>

<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Styles.Render("~/content/developer-profile") %>
    <%= Scripts.Render("~/bundles/developer-profile") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Developer Profile Registration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dpr">
        <h2 class="dpr-title">Try ONLYOFFICE Developer Profile <span>free for 30 days</span></h2>

        <div class="dpr-wrapper">
            <div class="data-item name">
                <div class="input-wrapper">
                    <input id="name" type="text" placeholder="Name" tabindex="1" class="input-name" maxlength="64" required />
                    <label for="name">Your name*</label>
                </div>
                <div class="error-text name-error">Name is empty</div>
            </div>

            <div class="data-item email">
                <div class="input-wrapper">
                    <input id="email" type="text" placeholder="name@domain.com" tabindex="2" class="input-email" maxlength="255" required />
                    <label for="email">E-mail adress*</label>
                </div>
                <div class="error-text email-error">&nbsp;</div>
            </div>

            <div class="data-item phone">
                <input id="phone" class="input-phone" type="text" tabindex="3" maxlength="32" pattern="^\+?\d{1,4}\s{0,}(\(\d{1,4}\))?\s{0,}(\d{1,5}\s{0,}-?){1,4}$" required />
                <label for="phone">Phone</label>
                <div class="error-text phone-error">&nbsp;</div>
            </div>

            <div class="data-item company-name">
                <div class="input-wrapper">
                    <input id="company-name" type="text" tabindex="4" class="input-company-name" maxlength="100" required />
                    <label for="company-name">Company name*</label>
                </div>
                <div class="error-text company-name-error">Company name is empty</div>
            </div>

            <div class="data-item company-website">
                <div class="input-wrapper">
                    <input id="company-website" type="text" tabindex="5" class="input-company-website" maxlength="100" required />
                    <label for="company-website">Company website</label>
                </div>
                <div class="error-text company-website-error">&nbsp;</div>
            </div>

            <label class="data-item-checkbox">
                <input type="checkbox" id="checkbox" name="input-checkbox" tabindex="6"><span></span>
                <label for="checkbox">I want to subscribe to the ONLYOFFICE newsletters with special offers and updates</label>
            </label>

            <div class="data-item-wrapper">
                <div id="recaptchaBlock" class="dataItem" data-hl="en">
                    <div class="g-recaptcha" data-callback="recaptchaCallback" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
                    <div class="recaptcha-error error" style="display: none;">Wrong captcha</div>
                </div>

                <div class="start-trial-text">
                    By clicking "Start Free Trial", you understand and agree to our <a href="" target="_blank" tabindex="">Terms and conditions</a> and <a href="" target="_blank" tabindex="">Privacy statement</a>.
                </div>
            </div>

            <div class="progress-panel">
                <div class="request-progress">PleaseWait</div>
                <button class="button red disabled">Get it now</button>
                <div class="btn-loader"></div>
                <div class="error-req">The request could not be sent. Please try again later.</div>
            </div>
        </div>
    </div>
</asp:Content>