using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Response.Redirect("Admin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int pos;
            string no;
            SqlConnection objCon;
            SqlCommand objCmd;
            string strDbCon, strSQL;
            //string pass = txtPass.Text.Substring(0, txtPass.Text.Length / 2).GetHashCode().ToString() + txtPass.Text.Substring(txtPass.Text.Length / 2).GetHashCode().ToString();
            //lblOutput.Text = pass;
            
            //Session["Admin"] = "acb";
            
            //string pass = txtPass.Text.Substring(0, txtPass.Text.Length / 2).GetHashCode().ToString() + txtPass.Text.Substring(txtPass.Text.Length / 2).GetHashCode().ToString();
            //連接 字串
            strDbCon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("App_Data\\LibraryData.mdf") + ";Integrated Security=True";
            //Update 字串
            strSQL = "SELECT Password FROM Admin WHERE Id = "+ txtID.Text;
            //連接
            objCon = new SqlConnection(strDbCon);
            //命令
            objCmd = new SqlCommand(strSQL, objCon);
            //打開
            objCon.Open();
            object result = objCmd.ExecuteScalar();
            if( result != null)
            {
                string passInput = txtPass.Text + " ";
                string password = result.ToString();
                lblOutput.Text = password;
                lblOutput.Text += passInput ;
                lblOutput.Text += (password == passInput).ToString();
                if (password == passInput)
                {
                    lblOutput.Text = "DEBUG1";
                    Session["Admin"] = txtID;
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    //lblOutput.Text = "DEBUG2";
                    lblOutput.Text = "密碼錯誤";
                    result = null;
                }
            }
            else
            {
                //lblOutput.Text = "DEBUG3";
                lblOutput.Text = "請輸入密碼";
            }
            
        }
    }
}