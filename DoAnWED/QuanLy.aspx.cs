using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class QuanLy : System.Web.UI.Page
{
    string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            DanhSachSP("");

        }

    }
    //View ThongSoKyThuat
    public void DanhSachTSKT(string ma)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        SqlCommand command = new SqlCommand("select * from THONGSOKYTHUAT where MaHang like '%" + ma + "%'"  , con);
        SqlDataAdapter data = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        data.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridViewTSKT.DataSource = ds;
            GridViewTSKT.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GridViewTSKT.DataSource = ds;
            GridViewTSKT.DataBind();
            int column = grViewSP.Rows[0].Cells.Count;
            GridViewTSKT.Rows[0].Cells.Clear();
            GridViewTSKT.Rows[0].Cells.Add(new TableCell());
            GridViewTSKT.Rows[0].Cells[0].ColumnSpan = column;
            GridViewTSKT.Rows[0].Cells[0].Text = "No record";
        }
    }
    //View DanhSachSanPham
    public void DanhSachSP(string ma)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        SqlCommand command = new SqlCommand("select * from SANPHAM where MaHang like '%" + ma + "%' or TenHang like '%" + ma + "%'", con);
        SqlDataAdapter data = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        data.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grViewSP.DataSource = ds;
            grViewSP.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            grViewSP.DataSource = ds;
            grViewSP.DataBind();
            int column = grViewSP.Rows[0].Cells.Count;
            grViewSP.Rows[0].Cells.Clear();
            grViewSP.Rows[0].Cells.Add(new TableCell());
            grViewSP.Rows[0].Cells[0].ColumnSpan = column;
            grViewSP.Rows[0].Cells[0].Text = "No record";
        }
    }
    
    //public void DanhMucMauMacDinh()
    //{
    //    lbtnDSSP.ForeColor = System.Drawing.Color.Black;
    //    lbtnThemSP.ForeColor = System.Drawing.Color.Black;
    //    lbtnTSKT.ForeColor = System.Drawing.Color.Black;
        
    //}
    //Chọn Danh Muc DSSP
    protected void lbtnDSSP_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        DanhSachSP("");
    }
    //Chon Danh Muc TSKT
    protected void lbtnTSKT_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        DanhSachTSKT("");
    }
    //Chon Danh Muc Them SP
    protected void lbtnThemSP_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    //Tim SP
    protected void btnSearchSP_Click1(object sender, EventArgs e)
    {
        DanhSachSP(txtSearchSP.Text);
    }
    //Tim TSKT
    protected void btnSeachMaTSKT_Click(object sender, EventArgs e)
    {
        DanhSachTSKT(txtSeachMaTSKT.Text);
    }
    //Chuc Nang View SP
    protected void grViewSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grViewSP.EditIndex = -1;
        DanhSachSP(txtSearchSP.Text);
    }

    protected void grViewSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        try
        {
            GridViewRow row = (GridViewRow)grViewSP.Rows[e.RowIndex];
            string ma = row.Cells[0].Text;
            string sql = "delete from SanPham where MaHang = @mahang";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@mahang", ma);
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Xóa thành công')</script>");
        }
        catch
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Vui lòng xóa thông số kỹ thuật của sản phẩm bạn muốn xóa trước!')</script>");
        }
        grViewSP.EditIndex = -1;
        con.Close();
        DanhSachSP(txtSearchSP.Text);
    }
    protected void grViewSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        try
        {
            GridViewRow row = (GridViewRow)grViewSP.Rows[e.RowIndex];
            string ma = row.Cells[0].Text;
            TextBox Ten = (TextBox)row.Cells[1].Controls[0];
            TextBox HangSX = (TextBox)row.Cells[2].Controls[0];
            TextBox Gia = (TextBox)row.Cells[3].Controls[0];
            TextBox Hinh = (TextBox)row.Cells[4].Controls[0];
            grViewSP.EditIndex = -1;
            string sql = "update SanPham set TenHang = @tenhang , HangSX = @hangsx,Gia= @gia , Hinh = @hinh where MaHang=@mahang";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@tenhang", Ten.Text);
            cmd.Parameters.AddWithValue("@hangsx", HangSX.Text);
            cmd.Parameters.AddWithValue("@gia", Gia.Text);
            cmd.Parameters.AddWithValue("@hinh", Hinh.Text);
            cmd.Parameters.AddWithValue("@mahang", ma);
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Cập nhật thành công')</script>");
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Cập nhật thất bại')</script>");
        }
        con.Close();
        DanhSachSP(txtSearchSP.Text);
    }
    protected void grViewSP_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grViewSP.EditIndex = e.NewEditIndex;
        DanhSachSP(txtSearchSP.Text);
    }

    //Chuc Nang View TSKT
    protected void GridViewTSKT_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewTSKT.EditIndex = -1;
        DanhSachTSKT(txtSeachMaTSKT.Text);
    }
    protected void GridViewTSKT_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        try
        {
            GridViewRow row = (GridViewRow)GridViewTSKT.Rows[e.RowIndex];
            string ma = row.Cells[0].Text;
            string sql = "delete from THONGSOKYTHUAT where MaHang=@mahang";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@mahang", ma);
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Xóa thành công')</script>");
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Xóa thất bại')</script>");
        }
        con.Close();
        GridViewTSKT.EditIndex = -1;
        DanhSachTSKT(txtSeachMaTSKT.Text);
    }
    protected void GridViewTSKT_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewTSKT.EditIndex = e.NewEditIndex;
        DanhSachTSKT(txtSeachMaTSKT.Text);
        
    }
    protected void GridViewTSKT_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        try
        {
            GridViewRow row = (GridViewRow)GridViewTSKT.Rows[e.RowIndex];
            string ma = row.Cells[0].Text;
            TextBox Manhinh = (TextBox)row.Cells[1].Controls[0];
            TextBox CameraSau = (TextBox)row.Cells[2].Controls[0];
            TextBox Cameratruoc = (TextBox)row.Cells[3].Controls[0];
            TextBox Ram = (TextBox)row.Cells[4].Controls[0];
            TextBox Rom = (TextBox)row.Cells[5].Controls[0];
            TextBox Pin = (TextBox)row.Cells[6].Controls[0];
            TextBox HDH = (TextBox)row.Cells[7].Controls[0];
            GridViewTSKT.EditIndex = -1;
            string sql = "update THONGSOKYTHUAT set ManHinh= @Manhinh , CameraSau = @CameraSau , Cameratruoc = @Cameratruoc , Ram = @Ram , Rom= @Rom , Pin = @pin, HDH = @HDH where MaHang=@mahang";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@Manhinh", Manhinh.Text);
            cmd.Parameters.AddWithValue("@CameraSau", CameraSau.Text);
            cmd.Parameters.AddWithValue("@Cameratruoc", Cameratruoc.Text);
            cmd.Parameters.AddWithValue("@Ram", Ram.Text);
            cmd.Parameters.AddWithValue("@Rom", Rom.Text);
            cmd.Parameters.AddWithValue("@pin", Pin.Text);
            cmd.Parameters.AddWithValue("@HDH", HDH.Text);
            cmd.Parameters.AddWithValue("@mahang", ma);
            cmd.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Cập nhật thành công')</script>");
        }
        catch
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Cập nhật thất bại')</script>");
        }
        con.Close();
        DanhSachTSKT(txtSeachMaTSKT.Text);
    }

    //Them SP
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (upAnh.FileContent.Length <= 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Vui lòng chọn ảnh!')</script>");
        }
        else if (!upAnh.FileName.EndsWith(".jpeg") && !upAnh.FileName.EndsWith(".png") && !upAnh.FileName.EndsWith(".jpg"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Ảnh không hợp lệ!')</script>");
        }
        else
        {
            string Mahang ="";
            upAnh.SaveAs(Server.MapPath("img/") + upAnh.FileName);
            SqlConnection con = new SqlConnection(conStr);
            string sql1 = "INSERT INTO SANPHAM VALUES (@tenhang,@hangsx,@gia,@hinh)"; // thêm vào sản phẩm
            string execMaHang = "SELECT TOP 1 MaHang FROM SANPHAM ORDER BY MaHang DESC";    //lấy mã hàng của sản phẩm mới thêm
            //Thêm vào bảng sản phẩm
            con.Open();
            SqlCommand cmd = new SqlCommand(sql1, con);
            cmd.Parameters.AddWithValue("@tenhang", txtTen.Text);
            cmd.Parameters.AddWithValue("@hangsx", txtHangSX.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            cmd.Parameters.AddWithValue("@hinh", "img/" + upAnh.FileName);
            cmd.Parameters.AddWithValue("@ram", txtRam.Text);
            cmd.Parameters.AddWithValue("@rom", txtRom.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            //Lấy mã hàng vừa thêm vào
            con.Open();
            cmd = new SqlCommand(execMaHang, con);
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Mahang = reader["MaHang"].ToString();
                    
                }
            }
            con.Close();
            //them vào bảng thongsokythuat
            con.Open();
            string sql2 = "INSERT INTO THONGSOKYTHUAT VALUES (@manhinh,@camerasau,@cameratruoc,@ram,@rom,@pin," + Mahang + ",@hdh)"; // thêm vào thongsokythuat
            cmd = new SqlCommand(sql2, con);
            cmd.Parameters.AddWithValue("@manhinh", txtManHinh.Text);
            cmd.Parameters.AddWithValue("@camerasau", txtcamSau.Text);
            cmd.Parameters.AddWithValue("@cameratruoc", txtcamTrc.Text);
            cmd.Parameters.AddWithValue("@ram", txtRam.Text + " GB");
            cmd.Parameters.AddWithValue("@rom", txtRom.Text + " GB");
            cmd.Parameters.AddWithValue("@pin", txtPin.Text + " GB");
            cmd.Parameters.AddWithValue("@hdh", txtHDH.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Thêm sản phẩm thành công')</script>");
            txtTen.Text = "";
            txtHangSX.Text = "";
            txtGia.Text = "";
            txtRam.Text = "";
            txtRom.Text = "";
            txtManHinh.Text = "";
            txtcamSau.Text = "";
            txtcamTrc.Text = "";
            txtPin.Text = "";
            txtHDH.Text = "";
        }
    }

    //Danh Sach Hoa Don
    public void DanhSachHD(string ma)
    {
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        SqlCommand command = new SqlCommand("select * from HOADON where MaHD like '%" + ma + "%'", con);
        SqlDataAdapter data = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        data.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grViewHoaDon.DataSource = ds;
            grViewHoaDon.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            grViewHoaDon.DataSource = ds;
            grViewHoaDon.DataBind();
            int column = grViewHoaDon.Rows[0].Cells.Count;
            grViewHoaDon.Rows[0].Cells.Clear();
            grViewHoaDon.Rows[0].Cells.Add(new TableCell());
            grViewHoaDon.Rows[0].Cells[0].ColumnSpan = column;
            grViewHoaDon.Rows[0].Cells[0].Text = "No record";
        }
    }

    //Tim Trong View HoaDon
    protected void btnSearchHD_Click(object sender, EventArgs e)
    {
        DanhSachHD(txtSearchMAHD.Text);
    }
    //tu view chitiethd view hoadon
    protected void btnQuayLai_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
        grViewHoaDon.SelectedIndex = -1;
    }
    //chon danh muc hoa don
    protected void lbtnHoaDon_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
        txtSearchMAHD.Text = "";
        DanhSachHD("");
    }
    //Cac chuc nang trong view hoadon
    //Chuc nang chuy sang view chitiethoadon tuong ung voi dong duoc chon va load dulieu len view chitiethd
    protected void grViewHoaDon_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        GridViewRow row = (GridViewRow)grViewHoaDon.Rows[e.NewSelectedIndex];
        String ma = row.Cells[0].Text;
        SqlCommand command = new SqlCommand("select * from CHITIETHD where MaHD like '%" + ma + "%'", con);
        SqlDataAdapter data = new SqlDataAdapter(command);
        DataSet ds = new DataSet();
        data.Fill(ds);
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            grChiTiet.DataSource = ds;
            grChiTiet.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            grChiTiet.DataSource = ds;
            grChiTiet.DataBind();
            int column = grChiTiet.Rows[0].Cells.Count;
            grChiTiet.Rows[0].Cells.Clear();
            grChiTiet.Rows[0].Cells.Add(new TableCell());
            grChiTiet.Rows[0].Cells[0].ColumnSpan = column;
            grChiTiet.Rows[0].Cells[0].Text = "No record";
        }
    }

    protected void grViewHoaDon_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grViewHoaDon.EditIndex = e.NewEditIndex;
        DanhSachHD("");
    }

    protected void grViewHoaDon_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
        //
        SqlConnection con = new SqlConnection(conStr);
        GridViewRow row = (GridViewRow)grViewHoaDon.Rows[e.RowIndex];
        string mahd = row.Cells[0].Text;
        TextBox DiaChi = (TextBox)row.Cells[3].Controls[0];
        grViewHoaDon.EditIndex = -1;
        con.Open();
        string sql = "update HoaDon set DiaChi = @diachi where MaHD = @mahd";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@mahd", mahd);
        cmd.Parameters.AddWithValue("@diachi", DiaChi.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        DanhSachHD("");
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Cập nhật thất bại')</script>");
    }

    protected void grViewHoaDon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grViewHoaDon.EditIndex = -1;
        DanhSachHD("");
    }

}