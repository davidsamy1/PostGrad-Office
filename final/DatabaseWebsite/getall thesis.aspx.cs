using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand getallthesis = new SqlCommand("getallthesis", conn);
            getallthesis.CommandType = CommandType.StoredProcedure;
            getallthesis.Parameters.Add(new SqlParameter("@id", id));
            conn.Open();
            getallthesis.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(getallthesis);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            GridView1.DataSource = da;
            GridView1.DataBind();
            conn.Close();

        }
    }
}