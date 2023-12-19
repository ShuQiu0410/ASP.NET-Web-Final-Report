using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //從本機中取得txt檔案
            Label1.Text = "本書簡介 ：<br/>";
            Label1.Text += File.ReadAllText("C:\\Users\\user\\Desktop\\WebApplication1\\WebApplication1\\BookTxt\\"+ Request.QueryString["id"].ToString() +".txt");

            if(Request.QueryString["Id"] == "A001")
            {
                this.form1.Style.Value = "background-color: lightblue;";
            }
        }
    }
}