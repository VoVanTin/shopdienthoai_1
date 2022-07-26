<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="ThongTinSanPham.aspx.cs" Inherits="ThongTinSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style11 {
            width: 31px;
        }
        .auto-style13 {
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div><h2 style="text-align:center;padding:15px 0px;background-color:#ffde27;">THÔNG SỐ CHI TIẾT</h2></div>
    <div style="padding-left:220px;padding-top:20px">
        
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td rowspan="9">
                        <asp:Image ID="Image1" runat="server" CssClass="imgct" ImageUrl='<%# Eval("Hinh") %>' />
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                    <td colspan="2" style="text-align:center;font-weight:bold;font-size:x-large">Cấu hình Điện thoại
                        <asp:Label ID="lbTen" runat="server" Text='<%#Eval("TenHang")%>'></asp:Label>
                        </td>
                </tr>
                
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">Màn Hình:</td>
                    <td>
                        <asp:Label ID="lbManHinh" runat="server" Text='<%#Eval("ManHinh")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">Hệ Điều Hành:</td>
                    <td>
                        <asp:Label ID="lbHDH" runat="server" Text='<%#Eval("HDH")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">Camera Trước:</td>
                    <td>
                        <asp:Label ID="LbCam1" runat="server" Text='<%#Eval("Cameratruoc")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">Camera Sau:</td>
                    <td>
                        <asp:Label ID="lbCam2" runat="server" Text='<%#Eval("CameraSau")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">RAM:</td>
                    <td>
                        <asp:Label ID="lbRam" runat="server" Text='<%#Eval("Ram")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">ROM:</td>
                    <td>
                        <asp:Label ID="lbRom" runat="server" Text='<%#Eval("Rom")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style13">Pin:</td>
                    <td>
                        <asp:Label ID="lbPin" runat="server" Text='<%#Eval("Pin")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </ItemTemplate>
        
    </asp:DataList>
        <div">
            <table style="width: 100%;padding-top:40px">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr style="text-align:center;">
                <td>
                    <asp:Button ID="btnMuaTiep" runat="server" CssClass="nutchucnang" Text="&lt; Mua Tiếp" OnClick="btnMuaTiep_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        </div>
        </div>
</asp:Content>

