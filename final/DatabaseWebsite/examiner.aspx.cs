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
    public partial class examiner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edit(object sender, EventArgs e)
        {
            Response.Redirect("edit.aspx");
        }

        protected void defenses(object sender, EventArgs e)
        {

            Response.Redirect("defenses.aspx");

        }

        protected void addComment(object sender, EventArgs e)
        {
            Response.Redirect("addComment.aspx");
        }

        protected void addGrade(object sender, EventArgs e)
        {
            Response.Redirect("addGrade.aspx");
        }

        protected void search(object sender, EventArgs e)
        {
            Response.Redirect("search.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("defenses.aspx");

        }
    }
}