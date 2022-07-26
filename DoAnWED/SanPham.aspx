<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="SanPham.aspx.cs" Inherits="SanPham" %>
<%@ MasterType VirtualPath="~/index.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-left:30px">
    <asp:DataList ID="DL_SP" runat="server" RepeatColumns="3" OnItemCommand="DL_SP_ItemCommand">
    <ItemTemplate>
        <table style="width: 100%;text-align:center;padding-top:10px;border:solid 1px gray">
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    <asp:Image ID="Image1" runat="server" CssClass="img" ImageUrl='<%# Eval("Hinh") %>' />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="lbTen" runat="server" Font-Size="X-Large" Text='<%# Eval("TenHang") %>' Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="lbGIa" runat="server" Font-Bold="True" Font-Size="X-Large" Text='<%# Eval("Gia") %>'></asp:Label>
                    ₫</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1" style="padding:15px 0px">
                    <asp:Button ID="Button1" runat="server" CssClass="nutchucnang" CommandArgument='<%# Eval("MaHang") %>' CommandName="Them" Text="Thêm vào giỏ" OnClick="Button1_Click" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button2" runat="server" CssClass="nutchucnang"  PostBackUrl='<%# "ThongTinSanPham.aspx?mh=" + Eval("MaHang") %>' Text="Xem Chi Tiết" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
        </div>
</asp:Content>

