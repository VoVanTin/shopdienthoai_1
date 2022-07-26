<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>
<%@ MasterType VirtualPath="~/index.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            width: 149px;
            padding-left: 10px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-left:350px">
    <table style="width:50%;border-radius:10px;background-color:#f3ebc2;box-shadow:10px 10px 10px #b4b3b3;border:3px solid #000">
        <tr >
            <td colspan="2">
                <h1 style="text-align:center">ĐĂNG NHẬP&nbsp;</h1>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Tên đăng nhập:</td>
            <td>
                <asp:TextBox ID="txtUser" runat="server" Width="200px" style="margin-left: 2px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">Mật khẩu:</td>
            <td>
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server" Width="200px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;padding-bottom:20px">
                <asp:Button ID="btnDangNhap" runat="server" Text="ĐĂNG NHẬP" CssClass="nutchucnang" OnClick="btnDangNhap_Click1" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;padding-bottom:20px">Nếu chưa có tài khoản, Bấm
                <asp:HyperLink ID="HyperLink7"  runat="server" Font-Italic="True" Font-Overline="False" Font-Underline="True" NavigateUrl="DangKy.aspx">vào đây</asp:HyperLink>
&nbsp;để đăng ký!</td>
        </tr>
    </table>
        </div>
</asp:Content>

