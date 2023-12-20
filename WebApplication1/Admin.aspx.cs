using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("Login.aspx");
            }else
            {
                lblID.Text = "目前登入的是 : " + Session["Admin"];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(true)
            {
                lblOutput.Text = null ;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //登出
            Session["Admin"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            int pos;
            string no;
            SqlConnection objCon;
            SqlCommand objCmd;
            string strDbCon, strSQL;
            if (e.CommandName == "Select")
            {
                pos = Convert.ToInt32(e.CommandArgument);
                no = GridView1.DataKeys[pos].Value.ToString();
                //連接 字串
                strDbCon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("App_Data\\\\LibraryData.mdf") + ";Integrated Security=True";
                //Delete 字串
                strSQL = "DELETE FROM Rant WHERE (Id='" + no + "')";
                //strSQL = "UPDATE Book SET Is_rant = false WHERE (ISBN='" + no + "')";
                //連接
                objCon = new SqlConnection(strDbCon);
                //命令
                objCmd = new SqlCommand(strSQL, objCon);
                //打開
                objCon.Open();
                objCmd.ExecuteNonQuery();
                objCon.Close();
                GridView1.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            //設定借閱與歸還日
            DateTime D = DateTime.Now;
            DateTime DD = D.AddDays(60);
            SqlConnection objCon;
            SqlCommand objCmd;
            string strDbCon, strSQL;
            //連接 字串
            strDbCon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("App_Data\\LibraryData.mdf") + ";Integrated Security=True";
            //select 字串
            strSQL = "SELECT Name FROM Book WHERE ISBN = '" + TextBox1.Text +"'";
            //連接
            objCon = new SqlConnection(strDbCon);
            //命令
            objCmd = new SqlCommand(strSQL, objCon);
            //打開
            objCon.Open();
            object result = objCmd.ExecuteScalar();
            if(result != null)
            {
                string name = result.ToString();
                objCon.Close();
                strSQL = "SELECT Author FROM Book WHERE ISBN = '" + TextBox1.Text + "'";
                objCon = new SqlConnection(strDbCon);
                objCmd = new SqlCommand(strSQL, objCon);
                objCon.Open();
                result = objCmd.ExecuteScalar();
                string author = result.ToString();
                objCon.Close();
                strSQL = "INSERT INTO Rant (Id, name, Author, ISBN, datefrom, dateto) VALUES ('" + txtID.Text + "', N'" + name + "', N'" + author + "', '" + TextBox1.Text + "', '" + D.ToString("yyyy-MM-dd") + "', '" + DD.ToString("yyyy-MM-dd") + "')";
                objCon = new SqlConnection(strDbCon);
                objCmd = new SqlCommand(strSQL, objCon);
                objCon.Open();
                objCmd.ExecuteNonQuery();
                objCon.Close();

            }
        }
    }
}