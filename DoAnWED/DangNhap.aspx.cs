using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnDangNhap_Click1(object sender, EventArgs e)
    {
        
        string tenDN = txtUser.Text;
        string matKhau = txtPass.Text;
        String conStr = "Data source = DESKTOP-NURT2E1\\SQLEXPRESS;Initial Catalog = TNPSH; User ID=sa; Password=123";
        using (SqlConnection con = new SqlConnection(conStr))
        {
            String cmdStr = "SELECT COUNT(*) FROM TAIKHOAN WHERE Username = '" + tenDN + "' AND Pass = '" + matKhau + "' AND QUYEN = 1";
            SqlCommand cmd = new SqlCommand(cmdStr, con);
            con.Open();
            int kt = (int)cmd.ExecuteScalar();
            if (kt == 1)
            {
                Session["Quyen"] = 1;
                Session["tenDN"] = tenDN;
                Response.Redirect("TrangChuLogined.aspx");
            }
            else
            {
                cmdStr = "SELECT COUNT(*) FROM TAIKHOAN WHERE Username = '" + tenDN + "' AND Pass = '" + matKhau + "' AND QUYEN = 2";
                cmd = new SqlCommand(cmdStr, con);
                int check = (int)cmd.ExecuteScalar();
                if (check == 1)
                {
                    Session["Quyen"] = 2;
                    Session["tenDN"] = tenDN;
                    Response.Redirect("QuanLy.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác!')</script>");
                }
            }
        }
    }
}