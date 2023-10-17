﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Xml;

namespace DocumentationUtility.Shared.XmlDocs
{
    public static class XmlDocs
    {
        public static List<Assembly> LoadedAssemblies { get; } = new List<Assembly>();

        private readonly static Dictionary<string, string> loadedXmlDocumentation = new Dictionary<string, string>();

        private static string GetDirectoryPath(this Assembly assembly)
        {
            var location = assembly.Location;
            return Path.GetDirectoryName(location);
        }

        public static void LoadXmlDocumentation(Assembly assembly)
        {
            if (LoadedAssemblies.Contains(assembly))
            {
                return;
            }
            var directoryPath = assembly.GetDirectoryPath();
            var xmlFilePath = Path.Combine(directoryPath, assembly.GetName().Name + ".xml");
            if (File.Exists(xmlFilePath))
            {
                LoadXmlDocumentation(File.ReadAllText(xmlFilePath));
                LoadedAssemblies.Add(assembly);
            }
        }

        private static void LoadXmlDocumentation(string xmlDocumentation)
        {
            using (var xmlReader = XmlReader.Create(new StringReader(xmlDocumentation)))
            {
                while (xmlReader.Read())
                {
                    if (xmlReader.NodeType == XmlNodeType.Element && xmlReader.Name == "member")
                    {
                        var rawName = xmlReader["name"];
                        loadedXmlDocumentation[rawName] = xmlReader.ReadInnerXml();
                    }
                }
            }
        }

        public static string GetDocumentation(this Type type)
        {
            var key = "T:" + XmlDocumentationKeyHelper(type.FullName, null);
            loadedXmlDocumentation.TryGetValue(key, out string documentation);
            return documentation;
        }

        public static string GetDocumentation(this PropertyInfo propertyInfo)
        {
            var key = "P:" + XmlDocumentationKeyHelper(propertyInfo.DeclaringType.FullName, propertyInfo.Name);
            loadedXmlDocumentation.TryGetValue(key, out string documentation);
            return documentation;
        }

        public static string GetDocumentation(this EventInfo eventInfo)
        {
            var key = "E:" + XmlDocumentationKeyHelper(eventInfo.DeclaringType.FullName, eventInfo.Name);
            loadedXmlDocumentation.TryGetValue(key, out string documentation);
            return documentation;
        }

        public static string GetDocumentation(this FieldInfo fieldInfo)
        {
            var key = "F:" + XmlDocumentationKeyHelper(fieldInfo.DeclaringType.FullName, fieldInfo.Name);
            loadedXmlDocumentation.TryGetValue(key, out string documentation);
            return documentation;
        }

        public static string GetDocumentation(this MethodInfo methodInfo)
        {
            var key = methodInfo.GetMethodKey();

            loadedXmlDocumentation.TryGetValue(key, out string documentation);
            return documentation;
        }

        public static string GetMethodKey(this MethodInfo methodInfo)
        {
            var key = "M:" + XmlDocumentationKeyHelper(methodInfo.DeclaringType.FullName, methodInfo.Name);

            //var typeGenericMap = new Dictionary<string, int>();
            //var tempTypeGeneric = 0;

            //Array.ForEach(methodInfo.DeclaringType.GetGenericArguments(), x => typeGenericMap[x.Name] = tempTypeGeneric++);

            //var methodGenericMap = new Dictionary<string, int>();
            //var tempMethodGeneric = 0;

            //Array.ForEach(methodInfo.GetGenericArguments(), x => methodGenericMap.Add(x.Name, tempMethodGeneric++));

            var parameterKeys = new List<string>();

            foreach (var parameterInfo in methodInfo.GetParameters())
            {

                if (parameterInfo.ParameterType.HasElementType)
                {
                    if (parameterInfo.ParameterType.IsArray)
                    {
                        // append the "[]" array brackets onto the element type
                    }
                    else if (parameterInfo.ParameterType.IsPointer)
                    {
                        // append the "*" pointer symbol to the element type
                    }
                    else if (parameterInfo.ParameterType.IsByRef)
                    {
                        // append the "@" symbol to the element type
                    }
                }
                else if (parameterInfo.ParameterType.IsGenericParameter)
                {
                    // look up the index of the generic from the
                    // dictionaries, appending "`" if
                    // the parameter is from a type or "``" if the
                    // parameter is from a method
                }
                else
                {
                    parameterKeys.Add(XmlDocumentationKeyHelper(parameterInfo.ParameterType.FullName, null));
                }
            }

            if (parameterKeys.Any())
            {
                return key + $"({string.Join(",", parameterKeys)})";
            }

            return key;
        }

        public static string GetDocumentation(this ParameterInfo parameterInfo)
        {
            string memberDocumentation = parameterInfo.Member.GetDocumentation();
            if (memberDocumentation != null)
            {
                string regexPattern =
                  Regex.Escape(@"<param name=" + "\"" + parameterInfo.Name + "\"" + @">") +
                  ".*?" +
                  Regex.Escape(@"</param>");
                Match match = Regex.Match(memberDocumentation, regexPattern);
                if (match.Success)
                {
                    return match.Value;
                }
            }
            return null;
        }

        public static string GetDocumentation(this MemberInfo memberInfo)
        {
            if (memberInfo.MemberType.HasFlag(MemberTypes.Field))
            {
                return ((FieldInfo)memberInfo).GetDocumentation();
            }
            else if (memberInfo.MemberType.HasFlag(MemberTypes.Property))
            {
                return ((PropertyInfo)memberInfo).GetDocumentation();
            }
            else if (memberInfo.MemberType.HasFlag(MemberTypes.Event))
            {
                return ((EventInfo)memberInfo).GetDocumentation();
            }
            else if (memberInfo.MemberType.HasFlag(MemberTypes.Constructor))
            {
                return ((ConstructorInfo)memberInfo).GetDocumentation();
            }
            else if (memberInfo.MemberType.HasFlag(MemberTypes.Method))
            {
                return ((MethodInfo)memberInfo).GetDocumentation();
            }
            else if (memberInfo.MemberType.HasFlag(MemberTypes.TypeInfo) ||
                memberInfo.MemberType.HasFlag(MemberTypes.NestedType))
            {
                return ((TypeInfo)memberInfo).GetDocumentation();
            }
            else
            {
                return null;
            }
        }

        private static string XmlDocumentationKeyHelper(string typeFullNameString, string memberNameString)
        {
            string key = Regex.Replace(typeFullNameString, @"\[.*\]", string.Empty).Replace('+', '.');
            if (memberNameString != null)
            {
                key += "." + memberNameString;
            }
            return key;
        }
    }
}
