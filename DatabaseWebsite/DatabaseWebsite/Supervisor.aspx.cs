using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ViewInfo(object sender, EventArgs e)
        {
            Int32 id= Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewMyInfo = new SqlCommand("SupViewProfile2", conn);
            ViewMyInfo.CommandType = CommandType.StoredProcedure;
            //should get it from login page//

            ViewMyInfo.Parameters.Add(new SqlParameter("@supervisorID", id));

            conn.Open();
            ViewMyInfo.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ViewMyInfo);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            GridView1.DataSource = da;
            GridView1.DataBind();
            conn.Close();

        }

        protected void UpdateInfo(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand UpdateMyInfo = new SqlCommand("UpdateSupProfile", conn);
            UpdateMyInfo.CommandType = CommandType.StoredProcedure;
            
            string newname = Name.Text;
            string newfaculty = Faculty.Text;
            if (newname.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Name", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (newfaculty.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Faculty", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                UpdateMyInfo.Parameters.Add(new SqlParameter("@supervisorID", id));
                UpdateMyInfo.Parameters.Add(new SqlParameter("@name", newname));
                UpdateMyInfo.Parameters.Add(new SqlParameter("@faculty", newfaculty));

                conn.Open();
                UpdateMyInfo.ExecuteNonQuery();
                conn.Close();
            }

        }


        protected void ViewAllStudentYears(object sender, EventArgs e)
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
            GridView2.DataSource = da;
            GridView2.DataBind();
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ADDdefenseGUCIAN = new SqlCommand("AddDefenseGucian2", conn);
            ADDdefenseGUCIAN.CommandType = CommandType.StoredProcedure;
            int ThesisSerialNo;
            int.TryParse((TextBox2.Text), out ThesisSerialNo );
            DateTime defenseDate;
            DateTime.TryParse(TextBox3.Text,out defenseDate);
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
                if (thesisexist.Value.ToString()== "0")
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

        protected void Button4_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ADDdefensenonGUCIAN = new SqlCommand("AddDefenseNonGucian2", conn);
            ADDdefensenonGUCIAN.CommandType = CommandType.StoredProcedure;
            int ThesisSerialNo;
            int.TryParse((TextBox5.Text), out ThesisSerialNo);
            DateTime defenseDate;
            DateTime.TryParse(TextBox6.Text, out defenseDate);
            string defenselocation = TextBox7.Text;
            if (TextBox5.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can not update Info", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox6.Text.Length == 0)
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
                else if(req.Value.ToString() == "0")
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

        protected void Button6_Click(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Eval = new SqlCommand("EvaluateProgressReport2", conn);
            Eval.CommandType = CommandType.StoredProcedure;

            

            int ThesisSerialNo;
            int.TryParse((TextBox12.Text), out ThesisSerialNo);
            int ProgressNo;
            int.TryParse((TextBox13.Text), out ProgressNo);
            int Evaluation;
            int.TryParse((TextBox14.Text), out Evaluation);
            if (TextBox12.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can not Eval Report ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox13.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Progress report No", "Can not Eval Report", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (TextBox14.Text.Length == 0)
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

        protected void Button7_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Cancel = new SqlCommand("CancelThesis2", conn);
            Cancel.CommandType = CommandType.StoredProcedure;

          
            int ThesisSerialNo;
            int.TryParse((TextBox15.Text), out ThesisSerialNo);
            
            if (TextBox15.Text.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please Enter a Serial No.", "Can cancel Thesis ", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            else
            {
               
                Cancel.Parameters.Add(new SqlParameter("@ThesisSerialNo", ThesisSerialNo));
                SqlParameter exist = Cancel.Parameters.Add("@exist", SqlDbType.Int);
                SqlParameter req = Cancel.Parameters.Add("@Req", SqlDbType.Int);
                exist.Direction = ParameterDirection.Output;
                req.Direction = ParameterDirection.Output;

                conn.Open();
                Cancel.ExecuteNonQuery();
                if (exist.Value.ToString() == "0")
                {

                    System.Windows.Forms.MessageBox.Show("Thesis Doesn't exist ", "Can not cancel thesis", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else if(req.Value.ToString()=="0")
                {
                    System.Windows.Forms.MessageBox.Show("last Progress report of that thesis is not 0  ", "Can not cancel thesis", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Thesis cancelled successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                conn.Close();
            }
        }


    }
}