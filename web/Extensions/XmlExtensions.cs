using System;

namespace ASC.Api.Web.Help.Extensions
{
    public static class XmlExtensions
    {
        public static T If<T>(this T item, Func<T, bool> @if, Func<T> then) where T : class
        {
            return @if(item) ? then() : item;
        }

        public static T IfNull<T>(this T item, Func<T> func) where T : class
        {
            return item.If((x) => x == default(T), func);
        }

        public static T ThrowIfNull<T>(this T item, Exception e) where T : class
        {
            return item.IfNull(() => { throw e; });
        }
    }
}