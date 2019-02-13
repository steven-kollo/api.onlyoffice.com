/*
 *
 * (c) Copyright Ascensio System Limited 2010-2017
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
using System.Linq;
using System.Text.RegularExpressions;
using ASC.Api.Interfaces;
using ASC.Common.DependencyInjection;
using Autofac;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    internal static class Documentation
    {
        private static List<MsDocEntryPoint> _points = new List<MsDocEntryPoint>();

        public static void Load()
        {
            //Load documentation
            _points = GenerateDocs();
        }

        private static List<MsDocEntryPoint> GenerateDocs()
        {
            var containerBuilder = AutofacConfigLoader.Load("api");
            containerBuilder.Register(c => c.Resolve<IApiRouteConfigurator>().RegisterEntryPoints())
                .As<IEnumerable<IApiMethodCall>>()
                .SingleInstance();

            var container = containerBuilder.Build();

            var entries = container.Resolve<IEnumerable<IApiMethodCall>>();

            var apiEntryPoints = container.ComponentRegistry.Registrations.Where(x => typeof(IApiEntryPoint).IsAssignableFrom(x.Activator.LimitType)).ToList();

            var generator = new MsDocDocumentGenerator(container);

            foreach (var apiEntryPoint in entries.GroupBy(x => x.ApiClassType))
            {
                var point = apiEntryPoint;
                generator.GenerateDocForEntryPoint(
                    apiEntryPoints.SingleOrDefault(x => x.Activator.LimitType == point.Key),
                    apiEntryPoint.AsEnumerable());
            }

            return generator.Points;
        }

        public static MsDocEntryPoint GetDocs(string name)
        {
            return _points.SingleOrDefault(x => x.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
        }

        public static IEnumerable<MsDocEntryPoint> GetAll()
        {
            return _points;
        }

        public static Dictionary<MsDocEntryPoint, Dictionary<MsDocEntryPointMethod, string>> Search(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return new Dictionary<MsDocEntryPoint, Dictionary<MsDocEntryPointMethod, string>>();
            }

            var terms = Regex.Split(query, @"\W+").Where(x => !String.IsNullOrEmpty(x));
            var result = _points.ToDictionary(
                x => x,
                ep => ep.Methods.Where(m => terms.All(
                    term => (m.Summary != null && 0 <= m.Summary.IndexOf(term, StringComparison.OrdinalIgnoreCase)) ||
                            (m.Category != null && 0 <= m.Category.IndexOf(term, StringComparison.OrdinalIgnoreCase)) ||
                            (m.FunctionName != null && 0 <= m.FunctionName.IndexOf(term, StringComparison.OrdinalIgnoreCase)) ||
                            (m.Notes != null && 0 <= m.Notes.IndexOf(term, StringComparison.OrdinalIgnoreCase)) ||
                            (m.Path != null && 0 <= m.Path.IndexOf(term, StringComparison.OrdinalIgnoreCase)) ||
                            (m.Remarks != null && 0 <= m.Remarks.IndexOf(term, StringComparison.OrdinalIgnoreCase)) ||
                            (m.Returns != null && 0 <= m.Returns.IndexOf(term, StringComparison.OrdinalIgnoreCase)))
                          )
                        .ToDictionary(key => key, value => string.Empty)
                );
            return result;
        }
    }
}