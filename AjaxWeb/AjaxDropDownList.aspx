<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxDropDownList.aspx.cs" Inherits="AjaxDropDownList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css" media="screen">
    .hidden
    {
     display:none;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">

    <table cellpadding="3" cellspacing="3" border="0">
    <tr><td>เลือชื่อผู้แต่ง: </td>
    <td align="left">
        <asp:DropDownList ID="ddlAuthor" runat="server">
        <asp:ListItem Text="Please select" Value="[-]"></asp:ListItem>
        <asp:ListItem Text="Martin Fowler" Value="MartinFowler"></asp:ListItem>
        <asp:ListItem Text="Robert C. Martin" Value="UncleBob"></asp:ListItem>
        <asp:ListItem Text="Steve McConnell" Value="SteveMcConnell"></asp:ListItem>
        </asp:DropDownList>
     </td></tr>   
     <tr><td>
     <label id="lblBookList" class="hidden" runat="server">รายการที่เลือกได้: </label>
     </td>
     <td align="left">
        <asp:DropDownList ID="ddlBookList" CssClass="hidden" runat="server">
        </asp:DropDownList>
     </td></tr>   
    </table>    
    </div>   
    </form>
</body>
</html>
<script src="Scripts/jquery-1.6.2.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    $(function () {
        var ddlAuthor = $("#ddlAuthor");
        var ddlBookList = $("#ddlBookList");

        ddlAuthor.bind('change', function (e) {
            if (ddlAuthor.val() != '[-]')
                sendData(ddlAuthor.val());
            else {
                $("#lblBookList").addClass("hidden");
                ddlBookList.addClass("hidden");
            }
        });

        function sendData(sUserID) {
            var loc = window.location.href;
            loc = (loc.substr(loc.length - 1, 1) == "/") ? loc + "AjaxDropDownList.aspx" : loc;
            $.ajax({
                type: "POST",
                url: loc + "/GetBookList",
                data: '{"sUserID":"' + sUserID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $("#lblBookList").removeClass("hidden");
                    ddlBookList.removeClass("hidden");
                    ddlBookList.empty().append($("<option></option>").val("[-]").html("Please select"));
                    $.each(msg.d, function () {
                        ddlBookList.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                },
                error: function () {
                    alert("เกิดข้อผิดพลาดในระหว่างการเรียก service");
                }
            });
        }

    });
    </script>