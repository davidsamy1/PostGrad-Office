using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class SuperVisorAddDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ADDdefenseGUCIAN = new SqlCommand("AddDefenseGucian2", conn);
            ADDdefenseGUCIAN.CommandType = CommandType.StoredProcedure;
            int ThesisSerialNo;
            int.TryParse((TextBox2.Text), out ThesisSerialNo);
            DateTime defenseDate;
            DateTime.TryParse(TextBox3.Text, out defenseDate);
            string defenselocation = TextBox4.Text;
            if (TextBox2.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox3.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Date", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (defenselocation.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a defense location", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                ADDdefenseGUCIAN.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
                ADDdefenseGUCIAN.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                ADDdefenseGUCIAN.Parameters.Add(new SqlParameter("@DefenseLocation", defenselocation));
                SqlParameter thesisexist = ADDdefenseGUCIAN.Parameters.Add("@thesisExist", SqlDbType.Int);
                thesisexist.Direction = ParameterDirection.Output;
                SqlParameter dup = ADDdefenseGUCIAN.Parameters.Add("@duplicate", SqlDbType.Int);
                dup.Direction = ParameterDirection.Output;
                conn.Open();
                ADDdefenseGUCIAN.ExecuteNonQuery();
                if (thesisexist.Value.ToString() == "0")
                {

                    System.Windows.Forms.MessageBox.Show("Thesis Doesn't exist or registered by non-gucian ", "Can not add Defense", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else if (dup.Value.ToString() == "1")
                {
                    System.Windows.Forms.MessageBox.Show("Defense is already added on that date for that thesis ", "Can not add Defense", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Defense added successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ADDdefensenonGUCIAN = new SqlCommand("AddDefenseNonGucian2", conn);
            ADDdefensenonGUCIAN.CommandType = CommandType.StoredProcedure;
            int ThesisSerialNo;
            int.TryParse((TextBox2.Text), out ThesisSerialNo);
            DateTime defenseDate;
            DateTime.TryParse(TextBox3.Text, out defenseDate);
            string defenselocation = TextBox4.Text;
            if (TextBox2.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox3.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Date", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (defenselocation.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a defense location", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                ADDdefensenonGUCIAN.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
                ADDdefensenonGUCIAN.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                ADDdefensenonGUCIAN.Parameters.Add(new SqlParameter("@DefenseLocation", defenselocation));
                SqlParameter thesisexist = ADDdefensenonGUCIAN.Parameters.Add("@thesisExist", SqlDbType.Int);
                SqlParameter req = ADDdefensenonGUCIAN.Parameters.Add("@Req", SqlDbType.Int);
                thesisexist.Direction = ParameterDirection.Output;
                req.Direction = ParameterDirection.Output;
                SqlParameter dup = ADDdefensenonGUCIAN.Parameters.Add("@duplicate", SqlDbType.Int);
                dup.Direction = ParameterDirection.Output;
                conn.Open();
                ADDdefensenonGUCIAN.ExecuteNonQuery();
                if (thesisexist.Value.ToString() == "0")
                {

                    System.Windows.Forms.MessageBox.Show("Thesis Doesn't exist or registered by gucian ", "Can not add Defense", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else if (dup.Value.ToString() == "1")
                {

                    System.Windows.Forms.MessageBox.Show("Defense is already added on that date for that thesis ", "Can not add Defense", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else if (req.Value.ToString() == "0")
                {
                    System.Windows.Forms.MessageBox.Show("Student Has scored less than 50 in one or more courses", "Can not add defense", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Defense added successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                conn.Close();
            }
        }
    }
}
