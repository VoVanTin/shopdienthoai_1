<%@ Page Title="" Language="C#" MasterPageFile="~/indexLogined.master" AutoEventWireup="true" CodeFile="TaiKhoan.aspx.cs" Inherits="TaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style2 {
        width: 335px;
        padding-left: 100px;
        padding-top:10px;
        padding-bottom:10px;
    }
    .auto-style3 {
        width: 289px;
        padding-top:10px;
        padding-bottom:10px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:0px 300px">
        <h2 style="text-align:center">THÔNG TIN TÀI KHOẢN</h2>
        <asp:FormView ID="FormView1" runat="server">
            <ItemTemplate>
                <table style="border-radius:10px;background-color:#f4ecc2;box-shadow:10px 10px 10px #b4b3b3;border:3px solid #000">
                    <tr>
                        <td class="auto-style2">Tên đăng nhập:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtUser" runat="server" Text='<%#Eval("Username")%>' Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Mật khẩu:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Text='<%#Eval("Pass")%>' Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Họ và tên:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtTen" runat="server" Text='<%#Eval("Ten")%>' Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Giới tính:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtGioiTinh" runat="server" Text='<%#Eval("Gioitinh")%>' Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Email:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("Email")%>' Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Số điện thoại:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtSdt" runat="server" Text='<%#Eval("SDT")%>' Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

        </asp:FormView>
        <div style="text-align:center;padding-top:20px"><asp:Button ID="btnChinhSua" runat="server" CssClass="nutchucnang" Width="180px" Text="Chỉnh sửa thông tin" OnClick="btnChinhSua_Click" /></div>
    </div>
</asp:Content>

