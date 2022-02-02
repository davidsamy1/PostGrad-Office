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
    public partial class link_and_add_publications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Int32 id = Convert.ToInt32(Session["user"]);

            String connStr = WebConfigurationManager.ConnectionStrings["DatabaseWebsite"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String Title = (title1.Text).ToString();
            String Host = (host.Text).ToString();
            String Date = (date.Text).ToString();
            String Place = (place.Text).ToString();
            String thesisSerialnumber = (TextBox5.Text).ToString();
            
            char Checked;
            if (accpted.Checked = true)
            {
                Checked = '1';
            }
            else
            {
                Checked = '0';
            }
            SqlCommand addPublication = new SqlCommand("addPublication", conn);
            SqlCommand linkPublication = new SqlCommand("linkPubThesis", conn);
            SqlCommand getpublicationid = new SqlCommand("getpublicationid", conn);
            addPublication.CommandType = CommandType.StoredProcedure;
            addPublication.Parameters.Add(new SqlParameter("@title", Title));
            addPublication.Parameters.Add(new SqlParameter("@PubDate", Date));
            addPublication.Parameters.Add(new SqlParameter("@host", Host));
            addPublication.Parameters.Add(new SqlParameter("@place", Place));
            addPublication.Parameters.Add(new SqlParameter("@accepted", Checked));
            linkPublication.Parameters.Add(new SqlParameter("@thesisSerialNo", thesisSerialnumber));
            SqlParameter id1 = getpublicationid.Parameters.Add("@PubID", SqlDbType.Int);
           
            id1.Direction = ParameterDirection.Output;
            
         conn.Open();
            addPublication.ExecuteNonQuery();
            getpublicationid.ExecuteNonQuery();
            linkPublication.Parameters.Add(new SqlParameter("@PubID", id1));
            linkPublication.ExecuteNonQuery();
            
            

            conn.Close();
        }
    }
}