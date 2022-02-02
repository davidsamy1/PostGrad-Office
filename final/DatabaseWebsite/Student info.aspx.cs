using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseWebsite
{
   
    public partial class Student_viewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Int32 id = Convert.ToInt32(Session["user"]);

                String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand AdminViewStudentProfile = new SqlCommand("AdminViewStudentProfile", conn);
                AdminViewStudentProfile.CommandType = CommandType.StoredProcedure;
                AdminViewStudentProfile.Parameters.Add(new SqlParameter("@sid", id));
                conn.Open();
                AdminViewStudentProfile.ExecuteNonQuery();

                SqlDataAdapter sqlDa = new SqlDataAdapter(AdminViewStudentProfile);
                DataTable data = new DataTable();
                sqlDa.Fill(data);
                GridView1.DataSource = data;
                GridView1.DataBind();

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        //       protected void Button1_Click(object sender, EventArgs e)
        //      {
        //         int id = 6;
        //       Response.Redirect("Studentthesis.aspx?" + id);
        //}
    }
}