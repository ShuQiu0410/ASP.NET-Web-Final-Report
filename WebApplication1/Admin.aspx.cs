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
            Session["Admin"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //lblOutput.Text = "DEBUG";
            int pos;
            string no;
            SqlConnection objCon;
            SqlCommand objCmd;
            string strDbCon, strSQL;
            if (e.CommandName == "Select")
            {
                //lblOutput.Text = "WORK";
                pos = Convert.ToInt32(e.CommandArgument);
                no = GridView1.DataKeys[pos].Value.ToString();
                //lblOutput.Text+= no;
                //連接 字串
                strDbCon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("App_Data\\\\LibraryData.mdf") + ";Integrated Security=True";
                //Update 字串
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

            DateTime D = DateTime.Now;
            DateTime DD = D.AddDays(60);
            SqlConnection objCon;
            SqlCommand objCmd;
            string strDbCon, strSQL;
            strDbCon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("App_Data\\LibraryData.mdf") + ";Integrated Security=True";
            //Update 字串
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
                lblOutput.Text = "DEBUG";
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
                //strSQL = "UPDATE Book SET Is_rant = true WHERE (ISBN='" + TextBox1.Text + "')";
                //objCon = new SqlConnection(strDbCon);
                //objCmd = new SqlCommand(strSQL, objCon);
                //objCon.Open();
                //objCmd.ExecuteNonQuery();
                //objCon.Close();

            }
        }
    }
}