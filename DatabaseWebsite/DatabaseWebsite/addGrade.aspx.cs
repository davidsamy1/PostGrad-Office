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
    public partial class addGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String Grade = grade.Text;
            String Thesis = thesis.Text;
            String Date = date.Text;




            SqlCommand loginProc = new SqlCommand("AddDefenseGrade2", conn);
            loginProc.CommandType = CommandType.StoredProcedure;
            loginProc.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];
            loginProc.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = Thesis;
            loginProc.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.Date)).Value = Date;
            loginProc.Parameters.Add(new SqlParameter("@grade", SqlDbType.VarChar)).Value = Grade;
            SqlParameter flag = loginProc.Parameters.Add("@flag", SqlDbType.Int);
            flag.Direction = System.Data.ParameterDirection.Output;
            if(Thesis == "" || Date == "" || Grade == "")
            {
                Label label = new Label();
                label.Text = "NULL Input";
                label.CssClass = "fail";
                form1.Controls.Add(label);
            }
            else
            {

                conn.Open();
                loginProc.ExecuteNonQuery();
                conn.Close();
                if (flag.Value.ToString() == "1")
                {
                    Label label = new Label();
                    label.Text = "Added Grade Successfully";
                    label.CssClass = "success";
                    form1.Controls.Add(label);
                }
                else
                {
                    Label label = new Label();
                    label.Text = "Wrong Input";
                    label.CssClass = "fail";
                    form1.Controls.Add(label);
                }
            }

        }

        protected void back(object sender, EventArgs e)
        {
            Response.Redirect("examiner.aspx");
        }
    }
}