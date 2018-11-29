<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Questions.aspx.cs" Inherits="logintry.Questions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Questions</title>
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
                            <li><a href="Courses.aspx">Courses</a></li>
                             <li class="active"><a href="Questions.aspx">Questions</a></li>

                        </ul>
                            </div>
                    </div>
                </div>
             
        </div>
          
           <div class="container">
           <!---- <div class="form-horizontal">--->
                <h2>Questions</h2>
                <hr />           
        <div class="center-page">
             <div class="col-xs-11">
               <asp:HiddenField ID="hfQuestionNo" runat="server" />
            </div>
             <asp:HiddenField ID="hfCourseNo" runat="server" />
            <label class="col-xs-11">Questions</label>
           
             <div class="col-xs-11">
                <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Class="form-control" placeholder="Question"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Question is required." ControlToValidate="txtQuestion" ForeColor="Red"></asp:RequiredFieldValidator>
 
                 </div>
             <label class="col-xs-11">Option1</label>
             <div class="col-xs-11">
                <asp:TextBox  ID="txtOption1" runat="server" Class="form-control" placeholder="Option1" TextMode="MultiLine"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Option1 is required." ControlToValidate="txtCourseId" ForeColor="Red"></asp:RequiredFieldValidator>
            
             </div>
             <label class="col-xs-11">Option2</label>
             <div class="col-xs-11">
                <asp:TextBox  ID="txtOption2" runat="server" Class="form-control" placeholder="Option2" TextMode="MultiLine"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Option2 is required." ControlToValidate="txtOption2" ForeColor="Red"></asp:RequiredFieldValidator>
            
             </div>
             <label class="col-xs-11">Option3</label>
             <div class="col-xs-11">
                <asp:TextBox  ID="txtOption3" runat="server" Class="form-control" placeholder="Option3" TextMode="MultiLine"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Option3 is required." ControlToValidate="txtOption3" ForeColor="Red"></asp:RequiredFieldValidator>
            
             </div>
             <label class="col-xs-11">Option4</label>
             <div class="col-xs-11">
                <asp:TextBox  ID="txtOption4" runat="server" Class="form-control" placeholder="Option4" TextMode="MultiLine"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Option4 is required." ControlToValidate="txtOption4" ForeColor="Red"></asp:RequiredFieldValidator>
            
             </div>
             <label class="col-xs-11">Answer</label>
             <div class="col-xs-11">
                <asp:TextBox  ID="txtAnswer" runat="server" Class="form-control" placeholder="Answer" TextMode="MultiLine"  ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Answer is required." ControlToValidate="txtAnswer" ForeColor="Red"></asp:RequiredFieldValidator>
            
             </div>
             <div class="col-xs-11">
                 <asp:HiddenField ID="HiddenField1" runat="server" />  
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="280px">
                <Columns>
                    <asp:BoundField DataField="Question" HeaderText="Question" />
                    <asp:BoundField DataField="Option1" HeaderText="Option1" />
                    <asp:BoundField DataField="Option2" HeaderText="Option2" />
                    <asp:BoundField DataField="Option3" HeaderText="Option3" />
                    <asp:BoundField DataField="Option4" HeaderText="Option4" />
                    <asp:BoundField DataField="Answer" HeaderText="Answer" />
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkview" runat="server" CommandArgument='<%# Eval("QuestionNo")%>' OnClick="lnk_OnClick">View</asp:LinkButton>
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