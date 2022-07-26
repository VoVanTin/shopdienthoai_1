using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class TrangChu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
            SqlConnection con = new SqlConnection(conStr);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select * from SANPHAM";
            cmd.Connection = con;
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            da.SelectCommand = cmd;
            da.Fill(dt);
            DL_SP.DataSource = dt;
            DL_SP.DataBind();
            con.Close();
        }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        Master.btSearch.Click += BtnSearch_click;
    }

    private void BtnSearch_click(object sender, EventArgs e)
    {
        string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
        SqlConnection con = new SqlConnection(conStr);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TenHang", Master.tbSearch.Text);
        cmd.CommandText = "select * from SANPHAM where TenHang like '%' + @TenHang + '%'";
        cmd.Connection = con;
        con.Open();

        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        da.SelectCommand = cmd;
        da.Fill(dt);
        DL_SP.DataSource = dt;
        DL_SP.DataBind();
        con.Close();

    }
    protected void DL_SP_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Them")
        {
            ArrayList gioCu = (ArrayList)Session["GioHang"];
            Label gia = (Label)e.Item.FindControl("lbGia");
            int dg = Convert.ToInt32(gia.Text);
            Session["SoTien"] = (int)Session["SoTien"] + dg;

            GioHang hangMoi = new GioHang();
            //hangMoi.Ms = int.Parse(DataListTatCaSP.DataKeys[e.Item.ItemIndex].ToString());
            hangMoi.Mahang = (e.CommandArgument.ToString());
            hangMoi.Tenhang = ((Label)e.Item.FindControl("lbTen")).Text;
            hangMoi.Gia = dg;
            hangMoi.Soluong = 1;
            int n = ktHangTonTai(hangMoi.Mahang);
            if (n == -1)
            {
                gioCu.Add(hangMoi);
            }
            else
            {
                GioHang nhapHang = (GioHang)gioCu[n];
                nhapHang.Soluong = nhapHang.Soluong + 1;

            }
            Session["GioHang"] = gioCu;
            Response.Redirect(Request.RawUrl);
        }
    }

    public int ktHangTonTai(string mahang)
    {
        ArrayList giocu = (ArrayList)Session["GioHang"];
        for (int i = 0; i < giocu.Count; i++)
        {
            GioHang gh = (GioHang)giocu[i];
            if (gh.Mahang == mahang)
                return i;
        }
        return -1;

    }
}