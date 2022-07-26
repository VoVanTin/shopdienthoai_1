<%@ Page Title="" Language="C#" MasterPageFile="~/indexLogined.master" AutoEventWireup="true" CodeFile="ThongTinSanPhamLogined.aspx.cs" Inherits="ThongTinSanPhamLogined" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div><h2 style="text-align:center;padding:15px 0px;background-color:#ffde27;">THÔNG SỐ CHI TIẾT</h2></div>
    <div style="padding-left:250px;padding-top:20px">
        
    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td rowspan="11">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Hinh") %>' CssClass="imgct" />
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2" style="text-align:center;font-weight:bold;font-size:x-large">Cấu hình Điện thoại
                        <asp:Label ID="lbTen" runat="server" Text='<%#Eval("TenHang")%>'></asp:Label>
                        </td>
                </tr>
                
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Mã Sản Phẩm:</td>
                    <td>
                        <asp:Label ID="lbMa" runat="server" Text='<%#Eval("MaHang")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Màn Hình:</td>
                    <td>
                        <asp:Label ID="lbManHinh" runat="server" Text='<%#Eval("ManHinh")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Hệ Điều Hành:</td>
                    <td>
                        <asp:Label ID="lbHDH" runat="server" Text='<%#Eval("HDH")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Camera Trước:</td>
                    <td>
                        <asp:Label ID="LbCam1" runat="server" Text='<%#Eval("Cameratruoc")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Camera Sau:</td>
                    <td>
                        <asp:Label ID="lbCam2" runat="server" Text='<%#Eval("CameraSau")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">RAM:</td>
                    <td>
                        <asp:Label ID="lbRam" runat="server" Text='<%#Eval("Ram")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">ROM:</td>
                    <td>
                        <asp:Label ID="lbRom" runat="server" Text='<%#Eval("Rom")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Pin:</td>
                    <td>
                        <asp:Label ID="lbPin" runat="server" Text='<%#Eval("Pin")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3" colspan="2">
                        &nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
        
    </asp:DataList>
        <div">
            <table style="width: 100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr style="text-align:center">
                <td>
                    <asp:Button ID="btnMuaTiep" runat="server" CssClass="nutchucnang" Text=" Mua Tiếp" OnClick="btnMuaTiep_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        </div>
        </div>
</asp:Content>

