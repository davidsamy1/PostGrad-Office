using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class SuperVisorStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewStudents = new SqlCommand("ViewSupStudentsYears", conn);
            ViewStudents.CommandType = CommandType.StoredProcedure;


            ViewStudents.Parameters.Add(new SqlParameter("@supervisorID", id));

            conn.Open();
            ViewStudents.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ViewStudents);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            GridView1.DataSource = da;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewAllStPub = new SqlCommand("ViewAStudentPublications", conn);
            ViewAllStPub.CommandType = CommandType.StoredProcedure;
            int id;
            if (Studentid.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter an id", "Can not view Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                id = Int16.Parse(Studentid.Text);
                ViewAllStPub.Parameters.Add(new SqlParameter("@StudentID", id));

                conn.Open();
                ViewAllStPub.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter(ViewAllStPub);
                DataTable da = new DataTable();
                sqlDa.Fill(da);
                if (da.Rows.Count != 0)
                {
                    GridView3.DataSource = da;
                    GridView3.DataBind();

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Invalid ID", "Can not view Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                conn.Close();
            }

        }
    }
}