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
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String Name = name.Text;
            String Field = field.Text;
            Int32 id = Convert.ToInt32(Session["user"]);


            if (!(Name == "") && !(Field == "")) {
                SqlCommand loginProc = new SqlCommand("updateExaminer", conn);
                loginProc.CommandType = CommandType.StoredProcedure;
                loginProc.Parameters.Add(new SqlParameter("@id", id));
                loginProc.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = Name;
                loginProc.Parameters.Add(new SqlParameter("@field", SqlDbType.VarChar)).Value = Field;
                conn.Open();
                loginProc.ExecuteNonQuery();
                conn.Close();
                Label label = new Label();
                label.Text = "Updated Successfully";
                label.CssClass = "success";
                form1.Controls.Add(label);
            }
            else
            {
                if (!(Name == "") && (Field == ""))
                {
                    SqlCommand loginProc = new SqlCommand("updateExaminer2", conn);
                    loginProc.CommandType = CommandType.StoredProcedure;
                    loginProc.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];
                    loginProc.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = Name;
                    conn.Open();
                    loginProc.ExecuteNonQuery();
                    conn.Close();
                    Label label = new Label();
                    label.Text = "Updated Successfully";
                    label.CssClass = "success";
                    form1.Controls.Add(label);
                }
                else
                {
                    if ((Name == "") && !(Field == ""))
                    {
                        SqlCommand loginProc = new SqlCommand("updateExaminer3", conn);
                        loginProc.CommandType = CommandType.StoredProcedure;
                        loginProc.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];
                        loginProc.Parameters.Add(new SqlParameter("@field", SqlDbType.VarChar)).Value = Field;
                        conn.Open();
                        loginProc.ExecuteNonQuery();
                        conn.Close();
                        Label label = new Label();
                        label.Text = "Updated Successfully";
                        label.CssClass = "success";
                        form1.Controls.Add(label);
                    }
                    else
                    {
                        Label label = new Label();
                        label.Text = "Null Input";
                        label.CssClass = "fail";
                        form1.Controls.Add(label);

                    }
                }
            }
            


            
        }
        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("examiner.aspx");
        }
    }
}
