using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            Response.Redirect("Student info.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("courses.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
          Response.Redirect("getall thesis.aspx");


        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("fillandaddprogressreport.aspx");

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("link and add publications.aspx");
        }
    }
}