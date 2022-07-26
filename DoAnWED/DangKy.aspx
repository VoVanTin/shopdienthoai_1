<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 427px;
        }
        .auto-style2 {
        width: 335px;
        padding-left: 100px;
    }
    .auto-style3 {
        width: 289px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:0px 200px">
        
    <table style="width:100%;border-radius:10px;background-color:#f3ebc2;box-shadow:10px 10px 10px #b4b3b3;border:3px solid #000">
        <tr >
            <td colspan="3">
                   <h1 style="text-align:center">THÔNG TIN ĐĂNG KÝ</h1>
            </td>
            <td>
                   &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Tên đăng nhập:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtUser" runat="server" Width="200px" ></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Vui lòng nhập tên đăng nhập!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Họ và tên:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtTen" runat="server" Width="200px" ></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTen" ErrorMessage="Vui lòng nhập họ tên!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Giới tính:</td>
            <td class="auto-style3">
                <asp:RadioButtonList ID="rdGioiTinh" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:RadioButtonList>
                </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rdGioiTinh" ErrorMessage="Vui lòng chọn giới tính!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email sai định dạng!" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Số điện thoại:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtSdt" runat="server" Width="200px"></asp:TextBox>
                
            </td>
            <td class="auto-style1">
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Số điện thoại không hợp lệ!" ControlToValidate="txtSdt" ValidationExpression="^([0]{1})([0-9]{1})([0-9]{8})$"></asp:RegularExpressionValidator>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Mật khẩu:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPass" ErrorMessage="Vui lòng nhập mật khẩu!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Nhập lại mật khẩu:</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtRepass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Mật khẩu nhập lại không đúng!" ControlToCompare="txtPass" ControlToValidate="txtRepass"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:center;padding-bottom:20px">
                <asp:Button ID="btnDangKy" runat="server" Text="ĐĂNG KÝ" CssClass="nutchucnang" OnClick="btnDangKy_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;padding-bottom:20px">
                &nbsp;</td>
            <td style="text-align:center;padding-bottom:20px">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

