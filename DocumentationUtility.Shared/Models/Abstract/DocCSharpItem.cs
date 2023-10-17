using DocumentationUtility.Shared.XmlDocs;
using System.IO;
using System.Reflection;
using System.Xml;
using System.Xml.Linq;

namespace DocumentationUtility.Shared.Models.Abstract
{
    public abstract class DocCSharpItem : DocItem
    {
        public string Description { get; protected set; }
        public string Remarks { get; protected set; }

        public bool IsVisible { get; protected set; } = true;

        public DocCSharpItem(MemberInfo type)
        {
            this.type = type;

            Name = type.Name;
        }

        protected void ParseXml()
        {
            var xml = type.GetDocumentation();
            if (xml == null) return;
            using (var xmlReader = XmlReader.Create(new StringReader(xml), xmlReaderSettings))
            {
                while (xmlReader.Read())
                {
                    switch (xmlReader.NodeType)
                    {
                        case XmlNodeType.Element:
                            XElement el = XNode.ReadFrom(xmlReader) as XElement;
                            HandleElement(el);
                            break;

                        default:
                            break;

                    }
                }
            }
        }

        protected virtual bool HandleElement(XElement element)
        {
            switch (element.Name.LocalName)
            {
                case "summary":
                    Description = element.Value.Trim();
                    return true;

                case "name":
                    Name = element.Value.Trim();
                    return true;

                case "remarks":
                    Remarks = element.Value.Trim();
                    return true;

                case "visible":
                    IsVisible = bool.Parse(element.Value.Trim());
                    return true;
            }

            return false;
        }

        public override string ToString()
        {
            return Name;
        }

        private readonly MemberInfo type;
        private readonly XmlReaderSettings xmlReaderSettings = new XmlReaderSettings() { ConformanceLevel = ConformanceLevel.Fragment, IgnoreWhitespace = true };
    }
}