using DocumentationUtility.Shared.Models;
using Microsoft.AspNetCore.Mvc.Routing;
using System.Reflection;
using System.Xml.Linq;

namespace DocumentationUtility.DocSpace.Models
{
    public class DocSpaceApiMethod : DocApiMethod
    {
        public DocSpaceApiMethod(DocApiController controller, MethodInfo type) : base(controller, type) { }

        protected override bool HandleElement(XElement element)
        {
            if (base.HandleElement(element)) return true;

            switch (element.Name.LocalName)
            {
                case "path":
                case "httpMethod":
                case "collection":
                case "requiresAuthorization":
                    return true; // ignore those, we are parsing them via reflection

                case "param":
                    Parameters.Add(new DocApiParameter(this, type.GetParameters().FirstOrDefault(p => p.Name == element.Attribute("name").Value), element.Value.Trim()));
                    return true;

                case "returns":
                    Returns = new DocApiReturn(this, element.Value.Trim(), type.ReturnType);
                    return true;

                case "category":
                    Category = element.Value.Trim();
                    return true;

                case "short":
                    ShortDescription = element.Value.Trim();
                    return true;
            }

            Console.WriteLine($"Unhandled element {element}");

            return false;
        }

        protected override void ParseReflection()
        {
            var httpMethodAttributes = type.GetCustomAttributes<HttpMethodAttribute>();
            var httpMethod = httpMethodAttributes.First();

            Path = httpMethod.Template;
            Method = httpMethod.HttpMethods.FirstOrDefault();
        }
    }
}
