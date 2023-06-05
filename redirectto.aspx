<%@ Page Language="C#" AutoEventWireup="true" CodeFile="redirectto.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td>
                If You want to register(save 
                to tblusdrate) and export then&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Font-Bold="True" 
                    onclick="Button1_Click" Text="Go" />
            </td>
        </tr>
        <tr>
            <td>
                Read Excel Sheet data and bind with ASP.NET Grid View&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Font-Bold="True" 
                    onclick="Button2_Click" Text="Go" />
            </td>
        </tr>
        <tr>
            <td>
                Read Excel Sheet data, bind to Grid and save to database(SP)&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Font-Bold="True" Text="Go" 
                    onclick="Button3_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
