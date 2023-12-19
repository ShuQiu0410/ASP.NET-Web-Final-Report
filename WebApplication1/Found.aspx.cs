using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Found : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(txtIndex.Text != null)
            {
                //查詢字串
                string cmd = "SELECT * FROM [Book] WHERE ([" + RadioButtonList1.SelectedValue + "] LIKE '%' + @Id + '%')";
                SqlDataSource1.SelectCommand = cmd;
                SqlDataSource1.DataBind();
            }
        }
    }
}