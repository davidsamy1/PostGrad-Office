using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class Registeration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            
            String email = Email.Text;
            String pass = password.Text;
            
            String validation = @"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
            if (email.Length==0)
            {
                System.Windows.Forms.MessageBox.Show("Please enter email ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (pass.Length == 0)
            {
                System.Windows.Forms.MessageBox.Show("Please enter password ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (Regex.IsMatch(email,validation))
            {
                if (DropDownList1.SelectedValue == "Gucian")
                {
                    SqlCommand registerGUCproc = new SqlCommand("StudentRegister2", conn);
                    registerGUCproc.CommandType = CommandType.StoredProcedure;
                    SqlCommand addgucianPhone = new SqlCommand("addGucianPhone", conn);
                    addgucianPhone.CommandType = CommandType.StoredProcedure;

                    string FirstName = TextBox1.Text;
                    string LastName = TextBox2.Text;
                    string type = TextBox3.Text;
                    string Faculty = TextBox4.Text;
                    string address = TextBox5.Text;
                    int phone;

                    if (FirstName.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter firstname ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (LastName.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter lastname ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (type.Length == 0 )
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter Thesis type ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if(type.ToLower() != "phd" && type.ToLower() != "master")
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter Thesis type either PHD or Master ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (Faculty.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter faculty ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (address.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter address ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (TextBox6.Text.Length == 0 || !int.TryParse(TextBox6.Text, out phone))
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter phone no. ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {

                        registerGUCproc.Parameters.Add(new SqlParameter("@password", pass));
                        registerGUCproc.Parameters.Add(new SqlParameter("@Gucian", true));
                        registerGUCproc.Parameters.Add(new SqlParameter("@email", email));
                        registerGUCproc.Parameters.Add(new SqlParameter("@firstname", FirstName));
                        registerGUCproc.Parameters.Add(new SqlParameter("@lastname", LastName));
                        registerGUCproc.Parameters.Add(new SqlParameter("@type", type));
                        registerGUCproc.Parameters.Add(new SqlParameter("@faculty", Faculty));
                        registerGUCproc.Parameters.Add(new SqlParameter("@address", address));
                        SqlParameter success = registerGUCproc.Parameters.Add("@success", SqlDbType.Int);
                        success.Direction = ParameterDirection.Output;
                        addgucianPhone.Parameters.Add(new SqlParameter("@PhoneNo", phone.ToString()));
                        conn.Open();
                        registerGUCproc.ExecuteNonQuery();
                        
                        if (success.Value.ToString() == "0")
                        {

                            System.Windows.Forms.MessageBox.Show("Email aready registered ", "Registeration Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                        }
                        else
                        {
                            addgucianPhone.ExecuteNonQuery();
                            
                            System.Windows.Forms.MessageBox.Show("Gucian Registered Successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Response.Redirect("Login.aspx");
                        }
                        conn.Close();
                    }
                }
                else if (DropDownList1.SelectedValue == "Non Gucian")
                {
                    SqlCommand registerNOnGUCianproc = new SqlCommand("StudentRegister2", conn);
                    registerNOnGUCianproc.CommandType = CommandType.StoredProcedure;
                    SqlCommand addnongucianPhone = new SqlCommand("addNonGucianPhone", conn);
                    addnongucianPhone.CommandType = CommandType.StoredProcedure;

                    string FirstName = TextBox1.Text;
                    string LastName = TextBox2.Text;
                    string type = TextBox3.Text;
                    string Faculty = TextBox4.Text;
                    string address = TextBox5.Text;
                    int phone;

                    if (FirstName.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter firstname ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (LastName.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter lastname ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (type.Length == 0 )
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter Thesis type either PHD or Master ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (type.ToLower() != "phd" && type.ToLower() != "master")
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter Thesis type either PHD or Master ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (Faculty.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter faculty ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (address.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter address ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (TextBox6.Text.Length == 0 || !int.TryParse(TextBox6.Text, out phone))
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter phone no. ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {

                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@password", pass));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@Gucian", false));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@email", email));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@firstname", FirstName));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@lastname", LastName));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@type", type));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@faculty", Faculty));
                        registerNOnGUCianproc.Parameters.Add(new SqlParameter("@address", address));
                        SqlParameter success = registerNOnGUCianproc.Parameters.Add("@success", SqlDbType.Int);
                        success.Direction = ParameterDirection.Output;
                        addnongucianPhone.Parameters.Add(new SqlParameter("@PhoneNo", phone.ToString()));
                        conn.Open();
                        registerNOnGUCianproc.ExecuteNonQuery();

                        if (success.Value.ToString() == "0")
                        {

                            System.Windows.Forms.MessageBox.Show("Email aready registered ", "Registeration Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                        }
                        else
                        {
                            addnongucianPhone.ExecuteNonQuery();

                            System.Windows.Forms.MessageBox.Show("Non Gucian Registered Successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Response.Redirect("Login.aspx");
                        }
                        conn.Close();
                    }
                }
                else
          if (DropDownList1.SelectedValue == "Examiner")
                {
                    SqlCommand registerExaminerproc = new SqlCommand("examinerRegister", conn);
                    registerExaminerproc.CommandType = CommandType.StoredProcedure;

                    string name = TextBox1.Text;
                    string fieldofwork = TextBox2.Text;
                    Boolean isNational = CheckBox1.Checked;

                    if (name.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter name ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (fieldofwork.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter field of work ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {


                        registerExaminerproc.Parameters.Add(new SqlParameter("@password", pass));
                        registerExaminerproc.Parameters.Add(new SqlParameter("@email", email));
                        registerExaminerproc.Parameters.Add(new SqlParameter("@name", name));
                        registerExaminerproc.Parameters.Add(new SqlParameter("@fieldofwork", fieldofwork));
                        registerExaminerproc.Parameters.Add(new SqlParameter("@national", isNational));
                        SqlParameter success = registerExaminerproc.Parameters.Add("@success", SqlDbType.Int);
                        success.Direction = ParameterDirection.Output;
                        conn.Open();
                        registerExaminerproc.ExecuteNonQuery();
                        conn.Close();
                        if (success.Value.ToString() == "0")
                        {

                            System.Windows.Forms.MessageBox.Show("Email aready registered ", "Registeration Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                        }
                        else
                        {

                            System.Windows.Forms.MessageBox.Show("Examiner Registered Successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Response.Redirect("Login.aspx");
                        }
                    }
                }
                else
          if (DropDownList1.SelectedValue == "SuperVisor")
                {
                    SqlCommand registerSupervisorproc = new SqlCommand("SupervisorRegister2", conn);
                    registerSupervisorproc.CommandType = CommandType.StoredProcedure;
                    string name = TextBox1.Text;
                    string faculty = TextBox2.Text;
                    if (name.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter name ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else if (faculty.Length == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter faculty ", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                    registerSupervisorproc.Parameters.Add(new SqlParameter("@password", pass));
                    registerSupervisorproc.Parameters.Add(new SqlParameter("@email", email));
                    registerSupervisorproc.Parameters.Add(new SqlParameter("@name", name));
                    registerSupervisorproc.Parameters.Add(new SqlParameter("@faculty", faculty));
                    SqlParameter success = registerSupervisorproc.Parameters.Add("@success", SqlDbType.Int);
                    success.Direction = ParameterDirection.Output;
                   
                    conn.Open();
                    registerSupervisorproc.ExecuteNonQuery();
                    conn.Close();

                    if (success.Value.ToString() == "0")
                    {

                        System.Windows.Forms.MessageBox.Show("Email aready registered ", "Registeration Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }
                    else
                    {

                        System.Windows.Forms.MessageBox.Show("SuperVisor Registered Successfully", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Response.Redirect("Login.aspx");
                    }
                   
                }
                
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Not valid email form", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
          
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                Label1.Text = "First name";
                Label2.Text = "Last name";
                TextBox1.Visible = true;
                Label1.Visible = true;
                TextBox2.Visible = true;
                Label2.Visible = true;
                TextBox3.Visible = true;
                Label3.Visible = true;
                TextBox4.Visible = true;
                Label4.Visible = true;
                TextBox5.Visible = true;
                Label5.Visible = true;
                Label7.Visible = false;
                CheckBox1.Visible = false;
                TextBox6.Visible = true;
                Label6.Visible = true;
            }
           else if (DropDownList1.SelectedIndex == 1)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";

                Label1.Text = "First Name";
                Label2.Text = "Last Name";
                TextBox1.Visible = true;
                Label1.Visible = true;
                TextBox2.Visible = true;
                Label2.Visible = true;
                TextBox3.Visible = true;
                Label3.Visible = true;
                TextBox4.Visible = true;
                Label4.Visible = true;
                TextBox5.Visible = true;
                Label5.Visible = true;
                TextBox6.Visible = true;
                Label6.Visible = true;

                Label7.Visible = false;
                CheckBox1.Visible = false;
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";

                TextBox5.Visible = false;
                TextBox4.Visible = false;
                TextBox3.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label1.Text = "Name";
                Label2.Text = "Faculty";
                Label7.Visible = false;
                CheckBox1.Visible = false;
                TextBox6.Visible = false;
                Label6.Visible = false;
            } 
            else if(DropDownList1.SelectedIndex == 3)
            {
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";

                TextBox5.Visible = false;
                TextBox4.Visible = false;
                TextBox3.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label1.Text = "Name";
                Label2.Text = "Field of work";
                Label7.Visible = true;
                CheckBox1.Visible = true;
                TextBox6.Visible = false;
                Label6.Visible = false;
            }
        }
    }
}