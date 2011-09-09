<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template2.aspx.cs" Inherits="jQueryTemplates.Template2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style media="screen" type="text/css">
    .header
    {
    	background-color:Gray;
    	font-weight:bold;
    	color:White;
    	text-align:center;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div align="center">
       <table border="1" cellspacing="2" cellpadding="2" id="contentTble">
       <tr class="header"><td>Employee ID</td><td>Employee Name</td><td>Email</td><td>Contact</td></tr>    
       </table>
    </div> 
    </div>
    </form>
</body>
</html>
<script type="text/x-jquery-tmpl" id="empTemplate">
       <tr><td>${EmpID}</td><td>${Name}</td><td>${Email} </td><td align="left">{{tmpl '#contactTemplate'}}</td></tr>
</script>
<script type="text/x-jquery-tmpl" id="contactTemplate">
    <ul>{{each Contact}}<li>${$value}</li> {{/each}}</ul>
</script>
<script src="Scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.tmpl.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var EmpData = [
             { EmpID: "CHAVP0", Name: "Chav:P", Email: "Chav.P@Chavp.com", Contact: ["08123456789", "02123456789"] },
             { EmpID: "CHAVP1", Name: "Chav:Pvn", Email: "Chav.Pvn@Chavp.com", Contact: ["08123456789", "02123456789"] },
             { EmpID: "CHAVP2", Name: "Chav:Ptmk", Email: "Chav.Ptmk@Chavp.com", Contact: ["08123456789", "02123456789"] },
             { EmpID: "CHAVP3", Name: "Chav:Pty", Email: "Chav.Pty@Chavp.com", Contact: ["08123456789", "02123456789"] }
             ];
        $("#empTemplate").tmpl(EmpData).appendTo("#contentTble");
    });
</script>

