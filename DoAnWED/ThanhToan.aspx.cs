using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class ThanhToan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            
        {
            
            hienthi();
            string user = Session["TenDN"].ToString();
            lbUser.Text = user;
            string sotien = Session["SoTien"].ToString();
            lbTongtien.Text = sotien;
            txtNgayDat.Text = DateTime.Now.ToString();
            string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from TaiKhoan where Username = '" + user + "'";
            cmd.Connection = con;
            FormView1.DataSource = cmd.ExecuteReader();
            FormView1.DataBind();
            con.Close();
            
            
        }
    }
    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        string tongtien = Session["SoTien"].ToString();
        string nguoidat = ((Label)FormView1.FindControl("lbHoTen")).Text;
        string user = lbUser.Text;
        string diachi = txtDiaChi.Text;
        string date = txtNgayDat.Text;
        String conStr = "Data source = DESKTOP-NURT2E1\\SQLEXPRESS;Initial Catalog = TNPSH;User ID=sa; Password=123";
        SqlConnection con = new SqlConnection(conStr);
        
        con.Open();
        string cmdStr = "INSERT INTO HOADON VALUES ('" + user + "',N'" + nguoidat + "',N'" + diachi + "'," + tongtien + ",'" + date + "')"; //luu hoa don
        SqlCommand cmd = new SqlCommand(cmdStr, con);
        cmd.ExecuteNonQuery();
        con.Close();
        con.Open();
        string execMAHD = "SELECT TOP 1 MaHD FROM HOADON ORDER BY MAHD DESC";    //lay ma hd
        cmd = new SqlCommand(execMAHD, con);
        var Sca = cmd.ExecuteScalar();
        string maHD = Sca.ToString();
        con.Close();
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        for (int i = 0; i < gioCu.Count; i++)
        {
                    con.Open();
                    GioHang gh = (GioHang)gioCu[i];
                    cmdStr = "INSERT INTO ChitietHD VALUES('" + maHD + "','" + gh.Tenhang + "'," + gh.Soluong + "," + gh.Thanhtien + ")"; //luu CTHD
                    cmd = new SqlCommand(cmdStr, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
        }
        Session["GioHang"] = new ArrayList();
        Session["SoTien"] = 0;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Thanh toán thành công')</script>");
        hienthi();
        txtNgayDat.Text = "";
        
    }

    private void hienthi()
    {

        GridView1.DataSource = Session["GioHang"];
        GridView1.DataBind();

        int soLuong = 0;
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        for (int i = 0; i < gioCu.Count; i++)
        {
            GioHang hang = (GioHang)gioCu[i];
            soLuong = soLuong + hang.Soluong;
        }

        if (GridView1.Rows.Count > 0)
        {
            GridView1.FooterRow.Cells[3].Text = "Tổng tiền: ";
            GridView1.FooterRow.Cells[4].Text = tongTien().ToString();
        }
    }

    int tongTien()
    {
        int tien = 0;
        ArrayList gioHang = (ArrayList)Session["GioHang"];
        for (int i = 0; i < gioHang.Count; i++)
        {
            GioHang gio = (GioHang)gioHang[i];
            tien = tien + gio.Thanhtien;
        }
        return tien;
    }
    protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        hienthi();
    }
    protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        GioHang hang = (GioHang)gioCu[e.RowIndex];
        gioCu.Remove(hang);
        Session["GioHang"] = gioCu;
        Session["SoTien"] = tongTien();
        hienthi();
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        hienthi();
    }
    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        ArrayList gioCu = (ArrayList)Session["GioHang"];
        GioHang hang = (GioHang)gioCu[e.RowIndex];
        TextBox txtSL = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
        hang.Soluong = int.Parse(txtSL.Text);
        Session["GioHang"] = gioCu;
        Session["SoTien"] = tongTien();
        GridView1.EditIndex = -1;
        hienthi();
    }
}