<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignedTask.aspx.cs" Inherits="UcRDAWebApplication.AssignedTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AssignedTasks</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">  
      html, body, #canvasMap {  
        height: 200px;  
        margin: 0px;  
        padding: 0px  
      }  
    </style> 
	<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
         <%
             string uname =Convert.ToString(Session["username"]);
             if (uname != "")
             {
        %>
        <nav class="navbar navbar-inverse">
                  <div class="container-fluid">
                    <div class="navbar-header">
                      <a class="navbar-brand" href="#">MyCity</a>
                    </div>
                    <ul class="nav navbar-nav pull-right">
                      <li ><a href="AdminHome.aspx">Home</a></li>
                      <li><a href="Issues.aspx">Issues</a></li>
                      <li><a href="Workers.aspx">Workers</a></li>
                        <%
                            string type = Convert.ToString(Session["type"]);
                            if (type == "rda")
                            {
                        %>
                       <li class="active"><a href="AssignedTask.aspx">Assigned Tasks</a></li>
                        <%  }
                            %>
                        <li><a href="Logout.aspx">Log Out</a></li>
                    </ul>
                  </div>
           </nav>
           <div class="container">
               <section class="content-header">
               <h1>Assigned Task List</h1>
               <ol class="breadcrumb">
               <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Assinged Task List</li>
               </ol>
         </section>
               <section>

                   <asp:GridView ID="dgAssignedTask" runat="server" ShowHeaderWhenEmpty="True" EmptyDataText = "No Records Found" AutoGenerateColumns="False" Width="100%">
                       <Columns>
                           <asp:BoundField DataField="WorkerName" HeaderText="Name" />
                           <asp:BoundField DataField="IssueId" HeaderText="Issue ID" />
                           <asp:BoundField DataField="Status" HeaderText="Status" />
                           <asp:BoundField DataField="AssignedDate" HeaderText="Assigned Date" />
                       </Columns>
                   </asp:GridView>

               </section>
           </div>     
        <%}
            else {
                Response.Redirect("Login.aspx");
            } %>
    </form>
</body>
</html>
