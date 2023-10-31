using ASC.Api.Attributes;
using DocumentationUtility.Shared.Models;
using System;
using System.Linq;
using System.Reflection;
using System.Xml.Linq;

namespace DocumentationUtility.Portals.Models
{
    public class PortalApiController : DocApiController
    {
        public PortalApiController(Type type) : base(type) { }

        protected override void ParseMethods()
        {
            foreach (var method in type.GetMethods().Where(m => m.GetCustomAttributes<ApiAttribute>().Any()))
            {
                ApiMethods.Add(new PortalApiMethod(this, method));
            }
        }

        protected override void ParseReflection()
        {
            Path = Name;
        }

        protected override bool HandleElement(XElement element)
        {
            if (base.HandleElement(element)) return true;

            Console.WriteLine($"Unhandled element {element}");

            return false;
        }
    }
}
