<%@ Page Title="" Language="C#" MasterPageFile="~/indexLogined.master" AutoEventWireup="true" CodeFile="ThanhToan.aspx.cs" Inherits="ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 163px;
        }
        .auto-style2 {
            width: 163px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:0px 300px">
        <h2 style="text-align:center">THÔNG TIN ĐẶT HÀNG</h2>
        <div>
            <asp:FormView ID="FormView1" runat="server">
                <ItemTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style2">Tên người đặt:</td>
                            <td>
                                <asp:Label ID="lbHoTen" runat="server" Text='<%# Eval("Ten") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                
            </asp:FormView>
            <table style="width: 146%;">
                
                
                <tr>
                    <td class="auto-style1">Tên đăng nhập:</td>
                    <td>
                        <asp:Label ID="lbUser" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Tổng tiền:</td>
                    <td>
                        <asp:Label ID="lbTongtien" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Địa chỉ:&nbsp;</td>
                    <td>
                        <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ!" ControlToValidate="txtDiaChi"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Ngày đặt:</td>
                    <td>
                        <asp:TextBox ID="txtNgayDat" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <h2 style="text-align:center">THÔNG TIN GIỎ HÀNG</h2>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="Mahang" HeaderText="Mã Sản Phẩm" />
            <asp:BoundField DataField="Tenhang" HeaderText="Tên Sản Phẩm" />
            <asp:BoundField DataField="Soluong" HeaderText="Số Lượng" />
            <asp:BoundField DataField="Gia" HeaderText="Đơn Giá" />
            <asp:BoundField DataField="Thanhtien" HeaderText="Thành Tiền" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>

        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />

    </asp:GridView>
        </div>
        <div style="text-align:center;padding-top:20px"><asp:Button ID="btnThanhToan" runat="server" Text="Thanh Toán" CssClass="nutchucnang" OnClick="btnThanhToan_Click"/></div>
    </div>
</asp:Content>


