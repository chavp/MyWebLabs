<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASP.NET กับ jQuery: AJAX </title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <fieldset style="width: 400px; height: 200px;">
            <div id="contentArea">
                <asp:Button ID="btnSubmit" runat="server" Text="กดเลยเซ่" />
            </div>
        </fieldset>
    </div>
    </form>
</body>
</html>
<script src="Scripts/jquery-1.6.2.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $.ajaxSetup({
            cache: false,
            dataType: "html",
            error: function (xhr, status, error) {
                alert('มี error เกิดขึ้น: ' + error);
            },
            timeout: 30000, //กำหนด Timeout เท่ากับ 30 วินาที
            type: "GET",
            beforeSend: function () {
                console.log('log นี้เกิดใน Ajax beforeSend');
            },
            complete: function () {
                console.log('log นี้เกิดใน  Ajax complete');
            }
        });

        $("#btnSubmit").click(function (e) {
            e.preventDefault();
            $.ajax({
                url: "Content.htm",
                success: function (data) {
                    $("#contentArea").html("").append(data);
                }
            });
        });
    });
</script>
