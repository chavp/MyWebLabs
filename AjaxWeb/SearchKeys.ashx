<%@ WebHandler Language="C#" Class="SearchKeys" %>

using System;
using System.Web;

using System.Collections.Generic;
using System.Web.Script.Serialization;

public class SearchKeys : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string keyword;
        keyword = context.Request.QueryString["keyword"];
        if (keyword != null)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string jsonString = serializer.Serialize(GetFilteredList(keyword));
            context.Response.Write(jsonString);
        }
    }

    public static string[] GetFilteredList(string keyword)
    {
        var countryList = new List<string> { "Australia", "Indonesia", "Philippines", "New Zealand", "Singapore", "Thailand", "Korea", "Vietnam" };
        var filteredList = countryList.FindAll(w => w.ToUpper().Contains(keyword.ToUpper()));
        return filteredList.ToArray();
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}