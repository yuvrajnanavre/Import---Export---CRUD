<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">    <title></title>    <style type="text/css">        .style1        {            color: #3399FF;            text-align: justify;        }        .style2        {            width: 100%;        }        .style3        {            color: #000000;            width: 158px;        }        .style4        {            width: 158px;        }        .style5
        {
            color: #000000;
            width: 158px;
            height: 45px;
        }
        .style6
        {
            height: 45px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    <div class="style1">
    
        <strong>USD Rate<br />
        <br />
        </strong>
        <table class="style2">
            <tr>
                <td class="style3">
                    Date</td>
                <td>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" type="Date"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style5">
                    Amount</td>
                <td class="style6">                    <br />                    <asp:TextBox ID="TextBox2" runat="server" type="Decimal"></asp:TextBox>
                    <br />                </td>            </tr>            <tr>                <td class="style5">
                    Created By</td>
                <td class="style6">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" 
                        Font-Bold="True" />                </td>                <td>                    <br />                    <asp:Button ID="Button2" runat="server" Font-Bold="True" 
                        onclick="Button2_Click" Text="Back" />
                    <br />                    <br />                </td>            </tr>            <tr>
                <td class="style4">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="55px" 
                        ImageUrl="~/Images/excel.png" onclick="ImageButton1_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>        </div>    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </form></body></html>