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

    public partial class Student_thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);


            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand getCoursesinfo = new SqlCommand("getCoursesinfo", conn);
            getCoursesinfo.CommandType = CommandType.StoredProcedure;
            getCoursesinfo.Parameters.Add(new SqlParameter("@studentId", id));
            conn.Open();
            getCoursesinfo.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(getCoursesinfo);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            GridView1.DataSource = da;
            GridView1.DataBind();
            conn.Close();

        }


    }
}