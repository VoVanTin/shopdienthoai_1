using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class index : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtSearch.Attributes.Add("placeholder", "   Tìm Kiếm .....");
        HyperLink2.Visible = false;
    }

    public TextBox tbSearch
    {
        get { return txtSearch; }
    }
    public Button btSearch
    {
        get { return btnSearch; }
    }
}
