using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace logintry
{
    public partial class Questions : System.Web.UI.Page
    {
       

        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-G5G0278;Initial Catalog=Courses;Integrated Security=true;");
        public static string question = "";
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();

            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            hfQuestionNo.Value = "";
            hfCourseNo.Value = "";
            txtQuestion.Text = txtOption1.Text = txtOption2.Text = txtOption3.Text = txtOption4.Text = txtAnswer.Text = "";
           
            btnAdd.Text = "ADD";
            btnDelete.Enabled = false;

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            hfCourseNo.Value = Courses.sendtext;

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("QuestionCreateOrUpdate", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@QuestionNo", (hfQuestionNo.Value == "" ? 0 : Convert.ToInt32(hfQuestionNo.Value)));
            sqlCmd.Parameters.AddWithValue("@Question", txtQuestion.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Option1", txtOption1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Option2", txtOption2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Option3", txtOption3.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Option4", txtOption4.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Answer", txtAnswer.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@CourseNo", Convert.ToInt32(hfCourseNo.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            string quesNO = hfQuestionNo.Value;
            Clear();
            if (quesNO == "")
                lblSuccessMessage.Text = "Added Successfully";
            else
                lblSuccessMessage.Text = "Updated Succesfully";
            FillGridView();
        }
        void FillGridView()
        {
            hfCourseNo.Value = Courses.sendtext;
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllQuestionsOfCourse", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@CourseNo", (Convert.ToInt32(hfCourseNo.Value)));
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            GridView1.DataSource = dtbl;
            GridView1.DataBind();


        }
        protected void lnk_OnClick(object sender, EventArgs e)
        {
            hfCourseNo.Value = Courses.sendtext;
            int questionNo = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewQuestionById", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;

            sqlDa.SelectCommand.Parameters.AddWithValue("@CourseNo", Convert.ToInt32(hfCourseNo.Value));
            sqlDa.SelectCommand.Parameters.AddWithValue("@QuestionNo", questionNo);


            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfQuestionNo.Value = questionNo.ToString();

            txtQuestion.Text = dtbl.Rows[0]["Question"].ToString();
            txtOption1.Text = dtbl.Rows[0]["Option1"].ToString();
            txtOption2.Text = dtbl.Rows[0]["Option2"].ToString();
            txtOption3.Text = dtbl.Rows[0]["Option3"].ToString();
            txtOption4.Text = dtbl.Rows[0]["Option4"].ToString();
            txtAnswer.Text = dtbl.Rows[0]["Answer"].ToString();
            hfCourseNo.Value = Courses.sendtext;

            btnAdd.Text = "Update";
            btnDelete.Enabled = true;
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            hfCourseNo.Value = Courses.sendtext;
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("DeleteQuestionsFromCourseAndQuestionTable", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@CourseNo", Convert.ToInt32(hfCourseNo.Value));
            sqlCmd.Parameters.AddWithValue("@QuestionNo", Convert.ToInt32(hfQuestionNo.Value));

            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Deleted Successfully";
        }
        protected void lnk_load(object sender, EventArgs e)
        {
            Server.Transfer(path: "~/Courses.aspx");
        }
    }
}
