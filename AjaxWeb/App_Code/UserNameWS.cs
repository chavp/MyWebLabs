using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for UserNameWS
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class UserNameWS : System.Web.Services.WebService {

    public UserNameWS () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    public bool CheckUserName(string sUserName)
    {
        List<string> UserNameList = new List<string>(new string[] { "testid01", "testid02", "testid03" });
        return UserNameList.Contains(sUserName); ;
    }
}
