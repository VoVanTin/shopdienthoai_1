using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
                hienthi();
        }
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
            Label1.Visible = true;
            lbThongBao.Visible = false;
            GridView1.FooterRow.Cells[3].Text = "Tổng tiền: ";
            GridView1.FooterRow.Cells[4].Text = tongTien().ToString();
        }
        else
        {
            lbThongBao.Text = "Giỏ hàng hiện đang trống!";
            lbThongBao.Visible = true;
            btnThanhToan.Visible = false;
            Label1.Visible = false;
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
        TextBox txtSL = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
        hang.Soluong = int.Parse(txtSL.Text);
        Session["GioHang"] = gioCu;
        Session["SoTien"] = tongTien();
        GridView1.EditIndex = -1;
        hienthi();
    }

    protected void btnThanhToan_Click(object sender, EventArgs e)
    {
        Response.Redirect("DangNhap.aspx");
    }
}