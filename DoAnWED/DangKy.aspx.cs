using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class DangKy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDangKy_Click(object sender, EventArgs e)
    {

        string user = txtUser.Text;
        string ten = txtTen.Text;
        string giotinh = rdGioiTinh.SelectedItem.ToString();
        string email = txtEmail.Text;
        string sdt = txtSdt.Text;
        string pass = txtPass.Text;
        string repass = txtRepass.Text;

        string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select count(*) from TaiKhoan where Email = '" + email + "' or Username = '"+ user+"'" ;
        cmd.Connection = con;

        int kt = (int)cmd.ExecuteScalar();
        if (kt == 0)
        {
            string Strcmd = "Insert into TaiKhoan values('" + user + "','" + pass + "',N'" + ten + "','" + email + "','" + sdt + "',N'" + giotinh + "',1)";
            cmd.CommandText = Strcmd;
            int rs = cmd.ExecuteNonQuery();
            if (rs == 1)
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Đăng ký thành công')</script>");
            txtUser.Text = "";
            txtTen.Text = "";
            txtEmail.Text = "";
            txtSdt.Text = "";
            
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Email hoặc Tên đăng nhập đã tồn tại!')</script>");
            txtUser.Focus();

        }
        con.Close();
    }
}