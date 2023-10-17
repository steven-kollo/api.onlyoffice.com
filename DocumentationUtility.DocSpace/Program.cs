﻿using ASC.Common;
using DocumentationUtility.DocSpace.Models;
using DocumentationUtility.Shared.XmlDocs;
using Microsoft.AspNetCore.Mvc;
using System.Reflection;

var dllPaths = Directory.GetFiles(Directory.GetCurrentDirectory(), "ASC*.dll");

foreach (var dll in dllPaths)
{
    try
    {
        Console.WriteLine($"Loading dll {Path.GetFileName(dll)}");
        XmlDocs.LoadXmlDocumentation(Assembly.LoadFile(dll));
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Failed to load dll {Path.GetFileName(dll)}\n{ex.Message}\n{ex.StackTrace}");
    }
}

var allTypes = XmlDocs.LoadedAssemblies
    .SelectMany(a => a.ExportedTypes)
    .ToList();

var controllers = allTypes
    .Where(t => !t.IsAbstract && t.IsSubclassOf(typeof(ControllerBase)) && t.GetCustomAttribute<ScopeAttribute>() != null)
    .ToList();

var result = new List<DocSpaceApiController>();

foreach (var controller in controllers)
{
    result.Add(new DocSpaceApiController(controller));
}

Console.WriteLine();