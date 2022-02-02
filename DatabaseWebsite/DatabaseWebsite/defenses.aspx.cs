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
   
    public partial class defenses : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand view = new SqlCommand("viewDefenses", conn);
            view.CommandType = CommandType.StoredProcedure;
            //int id = int.Parse(input.Text);
            view.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];




            conn.Open();
                view.ExecuteNonQuery();
                SqlDataAdapter adapter = new SqlDataAdapter(view);
                DataTable da = new DataTable();
                adapter.Fill(da);
                GridView1.DataSource = da;
                GridView1.DataBind();
            conn.Close();
        }

        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("examiner.aspx");
        }

    }
          
}
            /*SqlDataReader reader = view.ExecuteReader();

            if (reader.HasRows)
            {

                String s = "";
                Label label1 = new Label();
                label1.Text = "Title | Student | Supervisor" + "<br/>";
                form1.Controls.Add(label1);
                while (reader.Read())
                {
                    Label label = new Label();
                    s = String.Format("{0} | \t{1} | \t{2}", reader.GetString(0),
                        reader.GetString(1), reader.GetString(2));
                    label.Text = s + "<br/>";
                    form1.Controls.Add(label);
                }
            }
            else
            {
                Console.WriteLine("No rows found.");
            }
            reader.Close();*/