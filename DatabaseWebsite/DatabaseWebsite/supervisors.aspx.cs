using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseWebsite
{
    public partial class supervisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ListSup = new SqlCommand("AdminListSup", conn);
            ListSup.CommandType = CommandType.StoredProcedure;

            conn.Open();
                ListSup.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter(ListSup);
                DataTable da = new DataTable();
                adapter.Fill(da);
                GridView1.DataSource = da;
                GridView1.DataBind();
            conn.Close();
        }
    }
}