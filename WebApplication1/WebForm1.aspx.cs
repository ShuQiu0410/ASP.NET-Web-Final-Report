using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = File.ReadAllText("D:\\1208\\WebApplication1\\WebApplication1\\BookTxt\\A001.txt");
            Label1.Text = a;
        }
    }
}