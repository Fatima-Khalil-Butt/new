<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="logintry.Courses" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sign Up</title>
   <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
     </head>
<body>
      <form id="form1" runat="server">
            
         <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx">Online Examination System</a>
                    </div>
                        <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="Sign In.aspx">Sign In</a></li>
                          
                            <li><a href="SignUp.aspx">SignUp</a></li>
                            <li><a href="Questions.aspx">Questions</a></li>
                             <li class="active"><a href="Courses.aspx">Courses</a></li>

                        </ul>
                            </div>
                    </div>
                </div>
             
        </div>
           <div class="container">
           <!---- <div class="form-horizontal">--->
                <h2>Courses</h2>
                <hr />           
        <div class="center-page">
             <asp:HiddenField ID="hfCourseNo" runat="server" />
            <label class="col-xs-11">CourseName</label>
           
             <div class="col-xs-11">
                <asp:TextBox ID="txtCourseName" runat="server" TextMode="MultiLine" Class="form-control" placeholder="CourseName"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="CourseName is required." ControlToValidate="txtCourseName" ForeColor="Red"></asp:RequiredFieldValidator>
           
                 </div>
             <label class="col-xs-11">CourseId</label>
             <div class="col-xs-11">
                <asp:TextBox  ID="txtCourseId" runat="server" Class="form-control" placeholder="CourseId" TextMode="MultiLine"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="CourseId is required." ControlToValidate="txtCourseId" ForeColor="Red"></asp:RequiredFieldValidator>
            
             </div>
            <br />
              <div class="col-xs-11">
                       <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
             </div>
             <div class="col-xs-11">
                <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
            </div>
           
             <div class="col-xs-11">
                  <br />
            <br />
            <br />
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="369px" >
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="CourseName" />
                    <asp:BoundField DataField="CourseId" HeaderText="CourseId" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("CourseNo")%>' OnClick="lnk_OnClick">View</asp:LinkButton>
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkQuestion" runat="server" CommandArgument='<%# Eval("CourseNo")%>' OnClick="lnk_Page">Questions</asp:LinkButton>
                        </ItemTemplate>
                       
                    </asp:TemplateField>
                     
                </Columns>
            </asp:GridView>
            </div>
        </div>
               </div>
    </form>
     <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>