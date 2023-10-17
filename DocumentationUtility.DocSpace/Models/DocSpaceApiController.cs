using ASC.Web.Api.Routing;
using DocumentationUtility.Shared.Models;
using Microsoft.AspNetCore.Mvc.Routing;
using System.Reflection;
using System.Xml.Linq;

namespace DocumentationUtility.DocSpace.Models
{
    public class DocSpaceApiController : DocApiController
    {
        public DocSpaceApiController(Type type) : base(type) { }

        protected override void ParseMethods()
        {
            foreach (var method in type.GetMethods().Where(m => m.GetCustomAttributes<HttpMethodAttribute>().Any()))
            {
                ApiMethods.Add(new DocSpaceApiMethod(this, method));
            }
        }

        protected override void ParseReflection()
        {
            var routeAttributes = type.GetCustomAttributes<DefaultRouteAttribute>();
            var route = routeAttributes.FirstOrDefault();

            Path = route.Template.Replace("[controller]", type.Name.EndsWith("Controller")
                ? type.Name[..^"Controller".Length]
                : type.Name);
        }

        protected override bool HandleElement(XElement element)
        {
            if (base.HandleElement(element)) return true;

            Console.WriteLine($"Unhandled element {element}");

            return false;
        }
    }
}
