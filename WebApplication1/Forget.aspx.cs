using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection objCon;
            SqlCommand objCmd;
            string strDbCon, strSQL;
            //連接 字串
            strDbCon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("App_Data\\\\LibraryData.mdf") + ";Integrated Security=True";
            //Delete 字串
            strSQL = "DELETE FROM Admin WHERE (Id='" + TextBox1.Text + "')";
            //連接
            objCon = new SqlConnection(strDbCon);
            //命令
            objCmd = new SqlCommand(strSQL, objCon);
            //打開
            objCon.Open();
            objCmd.ExecuteNonQuery();
            objCon.Close();
            TextBox1.Visible = false;
            Button1.Visible = false;

            Label1.Text = "連密碼登記不得 我也幫不了你<br/>明天不用來了！！";
        }
    }
}