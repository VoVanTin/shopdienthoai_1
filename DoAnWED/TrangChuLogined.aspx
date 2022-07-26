<%@ Page Title="" Language="C#" MasterPageFile="~/indexLogined.master" AutoEventWireup="true" CodeFile="TrangChuLogined.aspx.cs" Inherits="TrangChuLogined" %>
<%@ MasterType VirtualPath="~/indexLogined.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .auto-style1 {
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%;padding-left:30px">
        <h2 class="subject">Điện Thoại HOT</h2>
        <div class="line"></div>
     </div>
    <div style="padding:30px 30px">
    <asp:DataList ID="DL_SP" runat="server" RepeatColumns="3" OnItemCommand="DL_SP_ItemCommand">
    <ItemTemplate>
        <table style="width: 100%;text-align:center;padding-top:10px;border:solid 1px gray">
            <tr>
                <td colspan="2">
                    <asp:Image ID="Image1" runat="server" CssClass="img" ImageUrl='<%# Eval("Hinh") %>' Height="350px" Width="350px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LbTen" runat="server" Text='<%# Eval("TenHang") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lbGIa" runat="server" Text='<%# Eval("Gia") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        ₫</td>
            </tr>
            <tr >
                <td class="auto-style1" style="padding:15px 0px">
                    <asp:Button ID="Button1" runat="server" CssClass="nutchucnang" Text="Thêm vào giỏ" CommandName="Them" CommandArgument='<%# Eval("MaHang") %>' />
                        
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button2" runat="server" CssClass="nutchucnang" PostBackUrl='<%# "ThongTinSanPhamLogined.aspx?mh=" + Eval("MaHang") %>' Text="Xem Chi Tiết" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
    </div>
    </asp:Content>

