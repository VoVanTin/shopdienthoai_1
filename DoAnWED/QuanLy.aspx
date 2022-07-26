<%@ Page Title="" Language="C#" MasterPageFile="~/indexLogined.master" AutoEventWireup="true" CodeFile="QuanLy.aspx.cs" Inherits="QuanLy" %>
<%@ MasterType VirtualPath="~/indexLogined.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-left:20px">
                   <table style="width: 100%; padding-top:20px;border:solid 1px;text-align:center;background-color:#ffd800">
                        <tr">
                            <td  class="id_menuNgang" style="font-weight:bold;font-size:large;padding-bottom:20px" >
                                <asp:LinkButton ID="lbtnDSSP" CssClass="linkbtn" runat="server" OnClick="lbtnDSSP_Click">Danh Sách Sản Phẩm</asp:LinkButton>
                                </td>
                            <td  class="id_menuNgang" style="font-weight:bold;font-size:large;padding-bottom:20px" ><asp:LinkButton ID="lbtnTSKT" CssClass="linkbtn" runat="server" OnClick="lbtnTSKT_Click">Thông Số Kỹ Thuật</asp:LinkButton></td>
                            <td  class="id_menuNgang" style="font-weight:bold;font-size:large;padding-bottom:20px" ><asp:LinkButton ID="lbtnThemSP" CssClass="linkbtn" runat="server" OnClick="lbtnThemSP_Click">Thêm Sản Phẩm</asp:LinkButton></td>
                            <td  class="id_menuNgang" style="font-weight:bold;font-size:large;padding-bottom:20px" ><asp:LinkButton ID="lbtnHoaDon" CssClass="linkbtn" runat="server" OnClick="lbtnHoaDon_Click" >Thông Tin Hóa Đơn</asp:LinkButton></td>

                        </tr>
                    </table>         
     </div>
    <table style="width:100%;padding-top:0px">
        <tr style="padding-top:0px">
            <td style="padding-left:20px">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="ViewSanPham" runat="server">
                        <div style="background-color:#ffd800;text-align:center;border-top-left-radius:20px;border-top-right-radius:20px;height:60px">
                            <h2 style="padding-top:15px;font-family:Bahnschrift">Danh Sách Sản phẩm</h2>
                        </div>
                        <div style="padding:10px">
                            <label style="font-weight:bold;font-size:large">
                            Tìm kiếm theo mã hoặc tên :</label>
                            <asp:TextBox ID="txtSearchSP" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSP" runat="server" CssClass="nutchucnang" Text="Tìm" OnClick="btnSearchSP_Click1" />
                        </div>
                        <asp:GridView ID="grViewSP" runat="server"  AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" Font-Size="Large" ForeColor="Black" Width="100%" OnRowCancelingEdit="grViewSP_RowCancelingEdit" OnRowDeleting="grViewSP_RowDeleting" OnRowUpdating="grViewSP_RowUpdating" OnRowEditing="grViewSP_RowEditing">
                            <Columns>
                                <asp:BoundField DataField="MaHang" HeaderText="Mã" ReadOnly="true" />
                                <asp:BoundField DataField="TenHang" HeaderText="Tên hàng" />
                                <asp:BoundField DataField="HangSX" HeaderText="Hãng" />
                                <asp:BoundField DataField="Gia" HeaderText="Giá" />
                                <asp:BoundField DataField="Hinh" HeaderText="Hình ảnh" />
                                <asp:CommandField CancelText="Hủy" EditText="Chỉnh sửa" ShowEditButton="true" UpdateText="Cập nhật" />
                                <asp:CommandField DeleteText="Xóa" ShowDeleteButton="true" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" Height="150px" Width="150px" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />

                        </asp:GridView>
                    </asp:View>
                    <asp:View ID="ViewThemTSKT" runat="server">
                    <div>
                        <div style="background-color:#ffd800;text-align:center;border-top-left-radius:20px;border-top-right-radius:20px;height:60px">
                            <h2 style="padding-top:15px;font-family:Bahnschrift">Thông Số Kỹ Thuật</h2>
                        </div>
                        <div style="padding:10px"><label style="font-weight:bold;font-size:large">Tìm kiếm theo mã:</label>
                        <asp:TextBox runat="server" ID="txtSeachMaTSKT"></asp:TextBox>
                        <asp:Button runat="server" ID="btnSeachMaTSKT" CssClass="nutchucnang" Text="Tìm" OnClick="btnSeachMaTSKT_Click"/>
                            </div>
                    </div>
                    <asp:GridView runat="server" ID="GridViewTSKT" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" Width="100%" Font-Size="Large" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnRowCancelingEdit="GridViewTSKT_RowCancelingEdit" OnRowDeleting="GridViewTSKT_RowDeleting" OnRowEditing="GridViewTSKT_RowEditing" OnRowUpdating="GridViewTSKT_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="MaHang" HeaderText="Mã" ReadOnly="true" />
                            <asp:BoundField DataField="ManHinh"  HeaderText="Màn hình" />
                            <asp:BoundField DataField="CameraSau" HeaderText="Camera Sau" />
                            <asp:BoundField DataField="Cameratruoc" HeaderText="Camera Trước" />
                            <asp:BoundField DataField="Ram" HeaderText="Ram" />
                            <asp:BoundField DataField="Rom" HeaderText="Rom" />       
                            <asp:BoundField DataField="Pin" HeaderText="Pin" />
                            <asp:BoundField DataField="HDH" HeaderText="Hệ điều hành" />
                            <asp:CommandField ShowEditButton="true" EditText="Chỉnh sửa" UpdateText="Cập nhật" CancelText="Hủy"/>
                            <asp:CommandField ShowDeleteButton="true" DeleteText="Xóa"/>
                        </Columns>

                        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                        <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

                        <RowStyle BackColor="White"></RowStyle>

                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </asp:View>
                    <asp:View ID="ViewThemSanPham" runat="server">
                   <div style="background-color:#ffd800;text-align:center;border-top-left-radius:20px;border-top-right-radius:20px;height:60px">
                            <h2 style="padding-top:15px;font-family:Bahnschrift">Thêm Sản Phẩm</h2>
                        </div>
                       <div style="padding-left:350px;padding-top:20px;background-color:#f6f0cf">
                    <table style="font-size:large">
                        <tr><td>Tên hàng</td><td><asp:TextBox runat="server" ID="txtTen"></asp:TextBox>
                            </td></tr>
                        <tr><td>Hãng sản xuất</td><td><asp:TextBox runat="server" ID="txtHangSX"></asp:TextBox>
                            </td></tr>
                        <tr><td>Giá tiền</td><td><asp:TextBox runat="server" ID="txtGia"></asp:TextBox>
                            <asp:CompareValidator ID="nhapSo" runat="server" ErrorMessage="Vui lòng nhập số!" ControlToValidate="txtGia" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1"></asp:CompareValidator>
                        </td></tr>
                        <tr><td>Hình ảnh</td><td><asp:FileUpload runat="server" ID="upAnh"/></td></tr>
                        <tr><td>Màn hình</td><td><asp:TextBox runat="server" ID="txtManHinh"></asp:TextBox></td></tr>
                        <tr><td>Camera trước</td><td><asp:TextBox runat="server" ID="txtcamTrc"></asp:TextBox></td></tr>
                        <tr><td>Camera Sau</td><td><asp:TextBox runat="server" ID="txtcamSau"></asp:TextBox></td></tr>
                        <tr><td>Ram(GB)</td><td><asp:TextBox runat="server" ID="txtRam"></asp:TextBox>
                            <asp:CompareValidator ID="soRam" runat="server" ErrorMessage="Vui lòng nhập số!" ControlToValidate="txtRam" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1"></asp:CompareValidator>
                        </td></tr>
                        <tr><td>Rom (GB)</td><td><asp:TextBox runat="server" ID="txtRom"></asp:TextBox>
                            <asp:CompareValidator ID="soBoNho" runat="server" ErrorMessage="Vui lòng nhập số!" ControlToValidate="txtRom" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1"></asp:CompareValidator>
                        </td></tr>
                        <tr><td>Pin</td><td><asp:TextBox runat="server" ID="txtPin"></asp:TextBox></td></tr>
                        <tr><td>Hệ điều hành</td><td><asp:TextBox runat="server" ID="txtHDH"></asp:TextBox></td></tr>
                        <tr><td colspan="2" style="text-align:center"><asp:Button CssClass="nutchucnang" ID="btnSubmit" runat="server" Text="Thêm" OnClick="btnSubmit_Click"/></td></tr>
                        <tr><td colspan="2" style="text-align:center">&nbsp;</td></tr>
                     </table>
                           </div>
                </asp:View>
                <asp:View ID="viewHoaDon" runat="server">
                    <div style="background-color:#ffd800;text-align:center;border-top-left-radius:20px;border-top-right-radius:20px;height:60px">
                            <h2 style="padding-top:15px;font-family:Bahnschrift">Thông Tin Hóa Đơn</h2>
                        </div>
                    <div style="padding:10px"><label style="font-weight:bold;font-size:large">Tìm kiếm theo mã:</label>
                    <asp:TextBox runat="server" ID="txtSearchMAHD" style="width: 128px"></asp:TextBox>
                    <asp:Button runat="server" ID="btnSearchHD" CssClass="nutchucnang" OnClick="btnSearchHD_Click" Text="Tìm"/>
                    </div>
                    <asp:GridView runat="server" ID="grViewHoaDon" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" Width="100%" Font-Size="Large" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnSelectedIndexChanging="grViewHoaDon_SelectedIndexChanging" OnRowEditing="grViewHoaDon_RowEditing" OnRowCancelingEdit="grViewHoaDon_RowCancelingEdit" OnRowUpdating="grViewHoaDon_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="MaHD" HeaderText="Mã" ReadOnly="true"/>
                            <asp:BoundField DataField="Username" HeaderText="Tên Tài Khoản" />
                            <asp:BoundField DataField="NguoiDat" HeaderText="Tên Khách Hàng" />
                            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" />
                            <asp:BoundField DataField="NgayXuatHD" HeaderText="Ngày đặt" ReadOnly="true" />
                            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" ReadOnly="true"/>
                            <asp:CommandField ShowSelectButton="true" SelectText="Chi tiết"/>
                            <asp:CommandField ShowEditButton="true" CancelText="Hủy" UpdateText="Cập nhật" EditText="Chỉnh sửa"/>
                        </Columns>

                        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                        <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

                        <RowStyle BackColor="White"></RowStyle>

                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </asp:View>
                <asp:View ID="viewCTHD" runat="server">
                    <div style="background-color:#ffd800;text-align:center;border-top-left-radius:20px;border-top-right-radius:20px;height:60px">
                            <h2 style="padding-top:15px;font-family:Bahnschrift">Chi Tiết Hóa Đơn</h2>
                        </div>
                    <div style="padding:10px;float:right">
                    <asp:Button runat="server" ID="btnQuayLai" CssClass="nutchucnang" Text="Quay lại" OnClick="btnQuayLai_Click" Width="100px"/>
                    </div>
                    <asp:GridView runat="server" ID="grChiTiet" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" Width="100%" Font-Size="Large" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                        <Columns>
                            <asp:BoundField DataField="MaHD" HeaderText="Mã"/>
                            <asp:BoundField DataField="TenHang" HeaderText="Tên hàng" />
                            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                            <asp:BoundField DataField="ThanhTien" HeaderText="Giá" />
                        </Columns>

                        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                        <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

                        <RowStyle BackColor="White"></RowStyle>

                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

