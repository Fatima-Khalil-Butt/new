using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

namespace logintry
{
    public partial class SignUp : System.Web.UI.Page
    {
       // SqlConnection con = new SqlConnection(@"Data Source=SONY\SQLEXPRESS;Initial Catalog=test;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
          //  con.Open();
        }

        protected void btSignup_Click(object sender, EventArgs e)
        {
            // String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString1"].ConnectionString;
            //  SqlCommand query = new SqlCommand("insert into test(Username,Password,Email,Name) values('" + tbUname.Text + "','" + tbPass.Text + "','" + tbEmail.Text + "','" + tbName.Text+"')", con);
            //   using (SqlConnection con = new SqlConnection(CS))
            /*   {
                   string query = "insert into test(Username,Password,Email,Name) values(@Username,@Password,@Email,@Name)";
                   SqlCommand cmd = new SqlCommand(query,con);
                   cmd.Parameters.AddWithValue("@Username", tbUname.Text);
                   cmd.Parameters.AddWithValue("@Password", tbPass.Text);
                   cmd.Parameters.AddWithValue("@Email",tbEmail.Text);
                   cmd.Parameters.AddWithValue("@Name", tbName.Text);
                 //  cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = tbEmail.Text; 

                   con.Open();*/
            //  query.ExecuteNonQuery();
            //  con.Close();
            //Label1.Visible = true;
            //Label1.Text = "Your data stored successfully";
            //  tbUname.Text = "";
            //  tbPass.Text = "";
            //  tbEmail.Text = "";
            //  tbName.Text = "";

            // Response.Redirect("~/Sign In.aspx");
            /* try
             {
                 string Username = tbUname.Text;
                 string Password = tbPass.Text;
                 string Email = tbEmail.Text;
                 string Name = tbName.Text;
                 string cmd = string.Format("insert into test(Username,Password,Email,Name) values('{0}','{1}','{2}','{3}')", Username, Password, Email, Name);
                 int rows = DatabaseConnection.getInstance().exectuteQuery(cmd);
                 lbl.Visible = true;
                 lbl.Text = String.Format("{0} rows affected", rows);

             }
             catch
             {

             } */
             if(tbCPass.Text!=" " && tbPass.Text!=" " && tbUname.Text!=" "&& tbName.Text!=" "&& tbEmail.Text!=" ")
            {
                if (tbPass.Text == tbCPass.Text)
                {
                    @try test = new @try();
                    test.Name = tbName.Text;
                    test.Password = tbPass.Text;
                    test.ConfirmPassword = tbCPass.Text;
                    test.UserName = tbUname.Text;
                    test.Email = tbEmail.Text;
                    test.Usertype = "U";
                    tryEntities1 test1 = new tryEntities1();
                    test1.tries.Add(test);
                    test1.SaveChanges();
                    tbName.Text = " ";
                    tbPass.Text = " ";
                    tbCPass.Text = " ";
                    tbEmail.Text = " ";
                    tbUname.Text = " ";
                    Response.Redirect("~/Sign In.aspx");
                }

            }
             else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Registration Failed";
            }

            

            }
    }
}