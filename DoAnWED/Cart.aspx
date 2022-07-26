<%@ Page Title="" Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style2 {
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;padding-top:20px;padding-bottom:20px;"><asp:Label ID="Label1" Font-Bold="true" Font-Size="XX-Large" runat="server" Text="GIỎ HÀNG"></asp:Label></div>
    <div style="text-align:center;padding-left:250px">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="Mahang" HeaderText="Mã Sản Phẩm" ReadOnly="True" />
            <asp:BoundField DataField="Tenhang" HeaderText="Tên Sản Phẩm" ReadOnly="True" />
            <asp:BoundField DataField="Soluong" HeaderText="Số Lượng" />
            <asp:BoundField DataField="Gia" HeaderText="Đơn Giá" ReadOnly="True" />
            <asp:BoundField DataField="Thanhtien" HeaderText="Thành Tiền" ReadOnly="True" />
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
    <div>
        <table style="width:90%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lbThongBao" Font-Size="XX-Large" Font-Bold="true" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="padding-top:20px">
                    <asp:Button ID="btnThanhToan" runat="server" CssClass="nutchucnang" OnClick="btnThanhToan_Click" Text="Thanh Toán" Width="144px" />
                </td>
            </tr>
            </table>
        </div>
    </div>
</asp:Content>

