/*
 *
 * (c) Copyright Ascensio System SIA 2023
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
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using log4net;
using Newtonsoft.Json;

namespace ASC.Api.Web.Help.Helpers
{
    [DataContract(Name = "category", Namespace = "")]
    public class Category
    {
        [DataMember(Name = "id", IsRequired = true, EmitDefaultValue = false)]
        public string Id;

        [DataMember(Name = "title", IsRequired = true, EmitDefaultValue = false)]
        public string Title;

        [DataMember(Name = "description")]
        public string Description;

        [DataMember(Name = "shortDescription")]
        public string ShortDescription;

        [DataMember(Name = "version")]
        public string Version;

        [DataMember(Name = "items")]
        public List<CategoryItem> Items;
    }

    public class CategoryItem
    {
        [DataMember(Name = "id")]
        public string Id;

        [DataMember(Name = "title")]
        public string Title;

        [DataMember(Name = "description")]
        public string Description;

        [DataMember(Name = "links")]
        public List<Tuple<string, string>> Links;
    }

    public static class Categories
    {
        private static List<Category> _allCategories;

        public static List<Category> EnabledCategories()
        {
            if (_allCategories == null)
            {
                var categoriesFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "App_Data", "categories.json");

                if (!File.Exists(categoriesFile))
                {
                    throw new Exception("Categories list is not found");
                }
                var categoriesJson = File.ReadAllText(categoriesFile);

                try
                {
                    _allCategories = JsonConvert.DeserializeObject<List<Category>>(categoriesJson);
                }
                catch (Exception error)
                {
                    LogManager.GetLogger("ASC.Api").Error(error);
                    _allCategories = new List<Category>();
                }
            }

            return _allCategories;
        }

        public static Category Get(string id)
        {
            return EnabledCategories().FirstOrDefault(category => category.Id == id);
        }
    }
}