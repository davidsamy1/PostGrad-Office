using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;

namespace DatabaseWebsite
{
    public partial class Thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ListTheses = new SqlCommand("AdminViewAllTheses", conn);
            ListTheses.CommandType = CommandType.StoredProcedure;

            SqlCommand OngoingThesis = new SqlCommand("AdminViewOngoingThesis", conn);
            OngoingThesis.CommandType = CommandType.StoredProcedure;


            conn.Open();
            ListTheses.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ListTheses);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            ListThesesGrid.DataSource = da;
            ListThesesGrid.DataBind();

            OngoingThesis.ExecuteNonQuery();
            SqlDataAdapter Ongoing = new SqlDataAdapter(OngoingThesis);
            DataTable OngoingTable = new DataTable();
            Ongoing.Fill(OngoingTable);
            OngoingGrid.DataSource = OngoingTable;
            OngoingGrid.DataBind();

            conn.Close();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e) {  
            ListThesesGrid.PageIndex = e.NewPageIndex;
            string connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ListTheses = new SqlCommand("AdminViewAllTheses", conn);
            ListTheses.CommandType = CommandType.StoredProcedure;

            SqlCommand OngoingThesis = new SqlCommand("AdminViewOngoingThesis", conn);
            OngoingThesis.CommandType = CommandType.StoredProcedure;


            conn.Open();
            ListTheses.ExecuteNonQuery();
            SqlDataAdapter sqlDa = new SqlDataAdapter(ListTheses);
            DataTable da = new DataTable();
            sqlDa.Fill(da);
            ListThesesGrid.DataSource = da;
            ListThesesGrid.DataBind();

            OngoingThesis.ExecuteNonQuery();
            SqlDataAdapter Ongoing = new SqlDataAdapter(OngoingThesis);
            DataTable OngoingTable = new DataTable();
            Ongoing.Fill(OngoingTable);
            OngoingGrid.DataSource = OngoingTable;
            OngoingGrid.DataBind();

            conn.Close();
        }

    

       
    }
}