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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // protected void Supervisors(object sender, EventArgs e)
        // {
        //     string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
        //     //create a new connection
        //     SqlConnection conn = new SqlConnection(connStr);

        //     SqlCommand ListSup = new SqlCommand("AdminListSup", conn);
        //     ListSup.CommandType = CommandType.StoredProcedure;

        //     conn.Open();
        //     ListSup.ExecuteNonQuery();
        //     conn.Close();

        //     conn.Open();
        //     ListSup.ExecuteNonQuery();
        //     SqlDataAdapter sqlDa = new SqlDataAdapter(ListSup);
        //     DataTable da = new DataTable();
        //     sqlDa.Fill(da);
        //     ListSupGrid.DataSource = da;
        //     ListSupGrid.DataBind();
        //     conn.Close();
        // }


        protected void ThesisRedirect(object sender, EventArgs e)
        {
            Response.Redirect("Thesis.aspx");
        }
    }
}