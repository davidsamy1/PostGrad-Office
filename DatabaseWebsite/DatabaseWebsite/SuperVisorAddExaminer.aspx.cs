using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;


namespace DatabaseWebsite
{
    public partial class SuperVisorAddExaminer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ADDexaminer = new SqlCommand("AddExaminer2", conn);
            ADDexaminer.CommandType = CommandType.StoredProcedure;
            int ThesisSerialNo;
            int.TryParse((TextBox8.Text), out ThesisSerialNo);
            DateTime defenseDate;
            DateTime.TryParse(TextBox9.Text, out defenseDate);
            string email = TextBox16.Text;
            string password = TextBox17.Text;
            string name = TextBox10.Text;
            string workfield = TextBox11.Text;
            Boolean isNational = national.Checked;
            if (TextBox8.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox9.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Date", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (email.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter an email ", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (password.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a password ", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (name.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a name ", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (workfield.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter Workfield ", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                ADDexaminer.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
                ADDexaminer.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                ADDexaminer.Parameters.Add(new SqlParameter("@Email", email));
                ADDexaminer.Parameters.Add(new SqlParameter("@Password", password));
                ADDexaminer.Parameters.Add(new SqlParameter("@ExaminerName", name));
                ADDexaminer.Parameters.Add(new SqlParameter("@fieldOfWork", workfield));
                ADDexaminer.Parameters.Add(new SqlParameter("@National", isNational));
                SqlParameter DefenseExist = ADDexaminer.Parameters.Add("@defenseExist", SqlDbType.Int);
                DefenseExist.Direction = ParameterDirection.Output;
                conn.Open();
                ADDexaminer.ExecuteNonQuery();
                if (DefenseExist.Value.ToString() == "0")
                {

                    System.Windows.Forms.MessageBox.Show("Thesis Doesn't exist or Defense Doesn't exist ", "Can not add Examiner", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Examiner added successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                conn.Close();
            }
        
    }
    }
}