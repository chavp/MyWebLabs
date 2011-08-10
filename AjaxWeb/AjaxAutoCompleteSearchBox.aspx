<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxAutoCompleteSearchBox.aspx.cs" Inherits="AjaxAutoCompleteSearchBox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/jquery-ui-1.8.7.custom.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div align="center">
    <fieldset style="width:400px;height:100px;">
    <table cellpadding="3" cellspacing="3" border="0">
    <tr><td>
        <label id="lblCountry" runat="server">กรุณากรอกชื่อประเทศ: </label>
    </td><td>    
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    </td></tr>   
    </table>    
    </fieldset>

    </div>           
    </form>
</body>
</html>
<script src="Scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.7.custom.js" type="text/javascript"></script>
<script src="Scripts/jquery.ui.core.js" type="text/javascript"></script>
<script src="Scripts/jquery.ui.position.js" type="text/javascript"></script>
<script src="Scripts/jquery.ui.widget.js" type="text/javascript"></script>
<script src="Scripts/jquery.ui.autocomplete.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $("#txtSearch").autocomplete({
            minLength: 1,
            source:
                   function (request, response) {
                       $.ajax({
                           type: "POST",
                           url: "SearchKeys.ashx?keyword=" + request.term,
                           contentType: "application/json; charset=utf-8",
                           dataType: "json",
                           success: function (data) {
                               response($.map(data, function (item) {
                                   return {
                                       value: item
                                   }
                               }))
                           },
                           error: function () {
                               alert("An unexpected error has occurred during processing.");
                           }
                       });
                   }

        });
    });
</script>