using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Services;

public partial class AjaxPageMethod : System.Web.UI.Page
{
    public static List<string> UserNameList = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserNameList = new List<string>(new string[] { "testid01", "testid02", "testid03" });
    }

    [WebMethod()]
    public static bool CheckUserName(string sUserName)
    {
        return UserNameList.Contains(sUserName);
    }
}