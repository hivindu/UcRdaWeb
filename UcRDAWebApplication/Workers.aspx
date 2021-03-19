<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workers.aspx.cs" Inherits="UcRDAWebApplication.Workers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Workers List</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
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
                      <a class="navbar-brand" href="#">WebSiteName</a>
                    </div>
                    <ul class="nav navbar-nav pull-right">
                      <li ><a href="AdminHome.aspx">Home</a></li>
                      <li><a href="Issues.aspx">Issues</a></li>
                      <li class="active"><a href="Workers.aspx">Workers</a></li>
                        <%
                            string type = Convert.ToString(Session["type"]);
                            if (type == "rda")
                            {
                        %>
                       <li><a href="AssignedTask.aspx">Assigned Tasks</a></li>
                        <%  }
                            %>
                        <li><a href="Logout.aspx">Log Out</a></li>
                    </ul>
                  </div>
                </nav>
        <%}
            else {
                Response.Redirect("Login.aspx");
            } %>
    </form>
</body>
</html>
