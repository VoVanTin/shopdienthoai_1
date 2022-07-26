using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class ThongTinSanPham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
        SqlConnection con = new SqlConnection(conStr);
        //Cách 1
        //Khai báo câu try vấn
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from SanPham sp,THONGSOKYTHUAT ts where ts.MaHang =sp.MaHang and sp.MaHang = @MaHang";
        cmd.Connection = con;

        SqlParameter Par = cmd.CreateParameter();
        Par.ParameterName = "@MaHang";
        Par.Value = Request.QueryString["mh"].ToString();
        cmd.Parameters.Add(Par);
        //Mở kết nối
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        da.SelectCommand = cmd;
        da.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
        //Đóng kết nối
        con.Close();
    }

    protected void btnMuaTiep_Click(object sender, EventArgs e)
    {
        Response.Redirect("TrangChu.aspx");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
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