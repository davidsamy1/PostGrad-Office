using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;


namespace DatabaseWebsite
{
    public partial class SuperVisorEvaluateReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Eval = new SqlCommand("EvaluateProgressReport2", conn);
            Eval.CommandType = CommandType.StoredProcedure;



            int ThesisSerialNo;
            int.TryParse((TextBox2.Text), out ThesisSerialNo);
            int ProgressNo;
            int.TryParse((TextBox3.Text), out ProgressNo);
            int Evaluation;
            int.TryParse((TextBox4.Text), out Evaluation);
            if (TextBox2.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can not Eval Report ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox3.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Progress report No", "Can not Eval Report", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox4.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter an Evaluation from 0 to 3", "Can not Eval Report", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                Eval.Parameters.Add(new SqlParameter("@supervisorID", id));
                Eval.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
                Eval.Parameters.Add(new SqlParameter("@progressReportNo", ProgressNo));
                Eval.Parameters.Add(new SqlParameter("@evaluation", Evaluation));
                SqlParameter exist = Eval.Parameters.Add("@exist", SqlDbType.Int);
                exist.Direction = ParameterDirection.Output;

                conn.Open();
                Eval.ExecuteNonQuery();
                if (exist.Value.ToString() == "0")
                {

                    System.Windows.Forms.MessageBox.Show("Thesis/Progress report Doesn't exist or Supervised by another Supervisor ", "Can not Eval Report", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Progress Report Evaluated successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                conn.Close();
            }
        }
    }
}