/*
 *
 * (c) Copyright Ascensio System Limited 2021
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;

namespace ASC.Api.Web.Help.Helpers
{
    public class Product
    {
        public string Id;
        public string Title;
        public string Description;
        public Dictionary<string, List<Tuple<string, string>>> Links;
    }

    public static class Products
    {
        public static List<Product> AllProducts = new List<Product>
            {
                new Product
                    {
                        Id = "portals",
                        Title = "Community Server",
                        Description = "Create your own productivity platform based on ONLYOFFICE Groups. In this section you will learn how to make GET, POST, PUT and DELETE requests to work with platform modules and pass authentication.",
                        Links = new Dictionary<string, List<Tuple<string, string>>>
                            {
                                {
                                    "Get started", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Basic concepts", "basic"),
                                            new Tuple<string, string>("Passing authentication", "auth")
                                        }
                                },
                                {
                                    "Documentation", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Groups API", "section")
                                        }
                                },
                                {
                                    "Help", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("F.A.Q.", "faq"),
                                            new Tuple<string, string>("Filtering", "filters"),
                                            new Tuple<string, string>("Batching", "batch")
                                        }
                                }
                            }
                    },
                new Product
                    {
                        Id = "apisystem",
                        Title = "Hosted Solution",
                        Description = "Host ONLYOFFICE Groups to make your collaboration platform online. In this section you will learn how to make GET and POST requests to manage portals, set tariff plans and pass authentication.",
                        Links = new Dictionary<string, List<Tuple<string, string>>>
                            {
                                {
                                    "Get started", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Basic concepts", "basic"),
                                            new Tuple<string, string>("Authentication", "authentication")
                                        }
                                },
                                {
                                    "Methods", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Host API", "section")
                                        }
                                }
                            }
                    },
                new Product
                    {
                        Id = "editors",
                        Title = "Document Server",
                        Description = "Bring document editing and co-authoring to your web app users. In this section you will learn how to set up, configure and integrate ONLYOFFICE Docs.",
                        Links = new Dictionary<string, List<Tuple<string, string>>>
                            {
                                {
                                    "Get Started", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Basic concepts", "basic"),
                                            new Tuple<string, string>("Try now", "try"),
                                            new Tuple<string, string>("Integration examples", "demopreview"),
                                            new Tuple<string, string>("Integration connectors", "plugins"),
                                            new Tuple<string, string>("How it works", "howitworks")
                                        }
                                },
                                {
                                    "Documentation", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Advanced parameters", "advanced"),
                                            new Tuple<string, string>("Config", "config/"),
                                            new Tuple<string, string>("Methods", "methods"),
                                            new Tuple<string, string>("Callback handler", "callback"),
                                            new Tuple<string, string>("Command service", "command"),
                                            new Tuple<string, string>("Conversion API", "conversionapi"),
                                            new Tuple<string, string>("Document Builder API", "documentbuilderapi"),
                                            new Tuple<string, string>("Signature", "signature/")
                                        }
                                },
                                {
                                    "More information", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Changelog", "changelog"),
                                            new Tuple<string, string>("FAQ", "faq"),
                                            new Tuple<string, string>("Troubleshooting", "troubleshooting")
                                        }
                                }
                            }
                    },
                new Product
                    {
                        Id = "plugin",
                        Title = "Plugins and Macros",
                        Description = "Extend the ONLYOFFICE Docs functionality. In this section you will learn how to create your own plugins/macros: its structure, development lifecycle, and examples.",
                        Links = new Dictionary<string, List<Tuple<string, string>>>
                            {
                                {
                                    "Get started", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Introduction", "basic")
                                        }
                                },
                                {
                                    "Documentation", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Plugin structure", "structure"),
                                            new Tuple<string, string>("Plugin installation", "installation"),
                                            new Tuple<string, string>("Plugin localization", "localization"),
                                            new Tuple<string, string>("Plugin styles", "styles"),
                                            new Tuple<string, string>("Plugin example", "example")
                                        }
                                },
                                {
                                    "Macros", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Writing macros", "writingmacros"),
                                            new Tuple<string, string>("Converting macros", "convertingvbamacros"),
                                            new Tuple<string, string>("Macro samples", "macrosamples")
                                        }
                                }
                            }
                    },
                new Product
                    {
                        Id = "docbuilder",
                        Title = "Document Builder",
                        Description = "Generate documents easily without running a document editor. In this section you will learn how to build documents using JavaScript and integrate Document Builder into your DMS, CRM system, etc.",
                        Links = new Dictionary<string, List<Tuple<string, string>>>
                            {
                                {
                                    "Get started", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Introduction", "basic"),
                                            new Tuple<string, string>("Getting started", "gettingstarted"),
                                            new Tuple<string, string>("Integrating Builder", "integratingdocumentbuilder")
                                        }
                                },
                                {
                                    "Documentation", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Integration API", "integrationapi"),
                                            new Tuple<string, string>("Text document API", "textdocumentapi"),
                                            new Tuple<string, string>("Spreadsheet API", "spreadsheetapi"),
                                            new Tuple<string, string>("Presentation API", "presentationapi"),
                                            new Tuple<string, string>("Global", "global"),
                                            new Tuple<string, string>("List of classes", "classlist")
                                        }
                                }
                            }
                    },
                new Product
                    {
                        Id = "desktop",
                        Title = "Desktop Editors",
                        Description = "Extent the ONLYOFFICE Desktop Editors functionality. In this section you will learn how to set up, customize and integrate them with the document management systems.",
                        Links = new Dictionary<string, List<Tuple<string, string>>>
                            {
                                {
                                    "Get Started", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Overview", "basic")
                                        }
                                },
                                {
                                    "Documentation", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Debugging", "debugging"),
                                            new Tuple<string, string>("Adding plugins", "plugins"),
                                            new Tuple<string, string>("Adding a DMS provider", "addingdms/")
                                        }
                                },
                                {
                                    "More information", new List<Tuple<string, string>>
                                        {
                                            new Tuple<string, string>("Changelog", "changelog"),
                                            new Tuple<string, string>("FAQ", "faq")
                                        }
                                }
                            }
                    },
            };

        public static List<Product> EnabledProducts()
        {
            var products = (ConfigurationManager.AppSettings["enabled_products"] ?? "").Split('|');

            var map = AllProducts.ToDictionary(p => p.Id);

            var enabled = (from product in products where map.ContainsKey(product) select map[product]).ToList();
            return enabled;
        }
    }
}