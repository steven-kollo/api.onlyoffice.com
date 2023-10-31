using DocumentationUtility.Shared.Models.Abstract;
using System;
using System.Collections.Generic;

namespace DocumentationUtility.Shared.Models
{
    public class DocApiType : DocCSharpItem
    {
        public List<DocApiProperty> Properties { get; protected set; } = new List<DocApiProperty>();

        public DocApiType(Type type) : base(type)
        {
            this.type = type;

            ParseXml();

            ParseProperties();
        }

        private void ParseProperties()
        {
            foreach (var props in type.GetProperties())
            {
                Properties.Add(new DocApiProperty(this, props));
            }
        }

        private readonly Type type;
    }
}
