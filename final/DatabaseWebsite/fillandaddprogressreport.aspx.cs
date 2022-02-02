using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);
            String thesisSerialNo = (thserialno.Text).ToString();
            String progressReportNo = (progno.Text).ToString();
            DateTime progressReportDate = DateTime.Today;
            String Description = (description.Text).ToString();
            String State = (state.Text).ToString();

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AddProgressReport = new SqlCommand("AddProgressReport2", conn);
            SqlCommand FillProgressReport = new SqlCommand("FillProgressReport2", conn);
            FillProgressReport.CommandType = CommandType.StoredProcedure;
            AddProgressReport.CommandType = CommandType.StoredProcedure;
            AddProgressReport.Parameters.Add(new SqlParameter("@studentID", Session["user"]));
            AddProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisSerialNo));
            AddProgressReport.Parameters.Add(new SqlParameter("@progressReportDate", progressReportDate));
            AddProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", progressReportNo));
            FillProgressReport.Parameters.Add(new SqlParameter("@description", Description));
            FillProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", progressReportNo));
            FillProgressReport.Parameters.Add(new SqlParameter("@state", State));
            FillProgressReport.Parameters.Add(new SqlParameter("@studentID", id));
            FillProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisSerialNo));

            conn.Open();
            AddProgressReport.ExecuteNonQuery();
            FillProgressReport.ExecuteNonQuery();
            conn.Close();

        }

        protected void progno_TextChanged(object sender, EventArgs e)
        {

        }
    }
}