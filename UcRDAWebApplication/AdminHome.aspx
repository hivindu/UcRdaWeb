<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="UcRDAWebApplication.Interface.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
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
                      <li class="active"><a href="AdminHome.aspx">Home</a></li>
                      <li><a href="Issues.aspx">Issues</a></li>
                      <li><a href="Workers.aspx">Workers</a></li>
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

              <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <p>Issues Count</p>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-4">
                            <p>Users Count</p>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                  </div>
        <%}
            else 
            {
                Response.Redirect("Login.aspx");
            }
        %>
    </form>
</body>
</html>
