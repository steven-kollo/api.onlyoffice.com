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
using System.Web.Hosting;
using log4net;

namespace ASC.Api.Web.Help.DocumentGenerator
{
    internal static class Documentation
    {
        private static List<MsDocEntryPoint> _points = new List<MsDocEntryPoint>();

        private static ILog _logger;

        public static void Load()
        {
            _logger = LogManager.GetLogger("ASC.MsDocDocumentGenerator");
            _logger.Debug("Generate documentations");
            //Load documentation
            _points = GenerateDocs();
        }

        private static List<MsDocEntryPoint> GenerateDocs()
        {
            var lookupDir = Path.Combine(HostingEnvironment.ApplicationPhysicalPath, @"App_Data\portals\references");
            var generator = new MsDocDocumentGenerator();
            foreach (var file in Directory.GetFiles(lookupDir))
            {
                generator.GenerateDocForEntryPoint(file);
                _logger.Debug("Generated " + file);
            }

            foreach (var method in generator.Points.SelectMany(x => x.Methods))
            {
                if (string.IsNullOrEmpty(method.Example))
                {
                    try
                    {
                        generator.GenerateRequestExample(method);
                        _logger.Debug("Generated example " + method.Path);
                    }
                    catch(Exception e) {
                        _logger.Error("Error " + method, e);
                    }
                }
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
    }
}