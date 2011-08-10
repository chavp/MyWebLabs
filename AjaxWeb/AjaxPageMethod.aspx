<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjaxPageMethod.aspx.cs" Inherits="AjaxPageMethod" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <asp:Button ID="btnSubmit" runat="server" Text="ตรวจสอบชื่อผู้ใช้" />
    </div>
</form>
</body>
</html>
<script src="Scripts/jquery-1.6.2.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#btnSubmit").click(function (e) {
                e.preventDefault();
                if ($("#txtUserName").val() == '')
                    alert("กรุณากรอกชื่อผู้ใช้");
                else
                    sendData($("#txtUserName").val());
            });

            function sendData(sUserName) {
                var loc = window.location.href;
                loc = (loc.substr(loc.length - 1, 1) == "/") ? loc + "Recipe3.aspx" : loc;
                $.ajax({
                    type: "POST",
                    url: loc + "/CheckUserName",
                    data: '{"sUserName":"' + sUserName + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        if (msg.d)
                            alert("ชื่อผู้ใช้นี้มีในระบบน๊ะ");
                        else
                            alert("ชื่อผู้ใช้นี้ไม่มีในระบบอะ!")
                    },
                    error: function () {
                        alert("มี error บางอย่างเกิดขึ้น");
                    }
                });
            }

        });
    </script>