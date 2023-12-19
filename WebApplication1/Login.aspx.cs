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
            /*
            
            string pass = txtPass.Text.Substring(0, txtPass.Text.Length / 2).GetHashCode().ToString() + txtPass.Text.Substring(txtPass.Text.Length / 2).GetHashCode().ToString();
            
            這裡原本要做簡單加密，但是一些小問題 最終我放棄原本的方案
            起初的想法是使用gethashcode函式 但由於其只有32bit的大小 我想要用兩個合併 但是gethashcode會出現負值 因此不好將其儲存
            但是由於程式最終出現bug才是我放棄的主要原因
            gethashcode只能實現一部份概念 並無法真正抵擋攻擊 請注意!!
            
            */
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
                if (password == passInput) //正確
                {
                    lblOutput.Text = "DEBUG1";
                    Session["Admin"] = txtID;
                    Response.Redirect("Admin.aspx");
                }
                else //密碼錯誤
                {
                    //lblOutput.Text = "DEBUG2";
                    lblOutput.Text = "密碼錯誤";
                    result = null;
                }
            }
            else //回傳資料庫密碼值為空
            {
                //lblOutput.Text = "DEBUG3";
                lblOutput.Text = "請輸入正確ID";
            }
            
        }
    }
}