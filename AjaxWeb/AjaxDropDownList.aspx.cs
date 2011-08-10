using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections;
using System.Web.Services;

public partial class AjaxDropDownList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static ArrayList GetBookList(string sUserID)
    {
        ArrayList listArr = new ArrayList();

        if (sUserID == "MartinFowler")
        {
            listArr.Add(new ListItem("Analysis Patterns: Reusable Object Models", "MartinFowler0"));
            listArr.Add(new ListItem("Refactoring: Improving the Design of Existing Code ", "MartinFowler1"));
            listArr.Add(new ListItem("Patterns of Enterprise Application Architecture ", "MartinFowler2"));
            listArr.Add(new ListItem("Domain-Specific Languages", "DSL"));
        }
        else if (sUserID == "UncleBob")
        {
            listArr.Add(new ListItem("Designing Object Oriented C++ Applications Using The Booch Method", "UncleBob0"));
            listArr.Add(new ListItem("Agile Principles, Patterns, and Practices in C#", "UncleBob1"));
            listArr.Add(new ListItem("Clean Code: A Handbook of Agile Software Craftsmanship", "UncleBob2"));
            listArr.Add(new ListItem("The Clean Coder: A Code of Conduct for Professional Programmers", "UncleBob3"));
        }
        else if (sUserID == "SteveMcConnell")
        {
            listArr.Add(new ListItem("Rapid Development Taming Wild Software Schedules", "SteveMcConnell0"));
            listArr.Add(new ListItem("Software Project Survival Guide Pro Best Practices", "SteveMcConnell1"));
            listArr.Add(new ListItem("Code Complete A Practical Handbook of Software Construction", "SteveMcConnell2"));
            listArr.Add(new ListItem("Software Estimation Demystifying the Black Art", "SteveMcConnell3"));
        }

        return listArr;
    }
}