using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class TaiKhoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string currentuser = Session["TenDN"].ToString();
            string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from TaiKhoan where Username = '" + currentuser + "'";
            cmd.Connection = con;
            FormView1.DataSource = cmd.ExecuteReader();
            FormView1.DataBind();
            con.Close();
        }

    }

    protected void btnChinhSua_Click(object sender, EventArgs e)
    {
        string currentuser = Session["TenDN"].ToString();
        string user = ((TextBox)FormView1.FindControl("txtUser")).Text;
        string pass = ((TextBox)FormView1.FindControl("txtPass")).Text;
        string hoten = ((TextBox)FormView1.FindControl("txtTen")).Text;
        string email = ((TextBox)FormView1.FindControl("txtEmail")).Text;
        string sdt = ((TextBox)FormView1.FindControl("txtSdt")).Text;
        string gioitinh = ((TextBox)FormView1.FindControl("txtGioitinh")).Text;

        string conStr = "Data Source = DESKTOP-NURT2E1\\SQLEXPRESS; Initial Catalog =TNPSH; User ID=sa; Password=123";
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        string Strcmd = "Update TaiKhoan set Username = '" + user + "',Pass = '" + pass + "',Ten = N'" + hoten + "',Email = '" + email + "',SDT = '" + sdt + "',Gioitinh = N'" + gioitinh + "' where Username = '" + currentuser + "'";
        SqlCommand cmd = new SqlCommand(Strcmd, con);
        int n = cmd.ExecuteNonQuery();
        if (n == 1)
        {
            Session["TenDN"] = user;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Cập nhật thành công!')</script>");
        }

        
    }
}