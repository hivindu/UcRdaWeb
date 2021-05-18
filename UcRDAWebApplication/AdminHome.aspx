<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="UcRDAWebApplication.Interface.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
     <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<!--<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
<!--===============================================================================================-->	
	<!--<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />-->
<!--===============================================================================================-->
	<!--<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />-->
<!--===============================================================================================-->
	<!--<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />-->
<!--===============================================================================================-->	
	<!--<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css" />-->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />

    <style>
	    .card-view {

            font-family: Calibri;
            font-size: 32px;
            color: #fff;
            line-height: 1.2;
            text-transform: uppercase;
            font-weight:bold;
			background: #d41872;
             background: -webkit-linear-gradient(left,  #5c1a75, #8a25b1, #c56de8);
            background: -o-linear-gradient(left,  #5c1a75, #8a25b1, #c56de8);
            background: -moz-linear-gradient(left,  #5c1a75, #8a25b1, #c56de8);
            background: linear-gradient(left,  #5c1a75, #8a25b1, #c56de8);
            position: relative;
            z-index: 1;

            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
            min-width: 160px;
            height: 150px;
            border-radius: 21px;
	    }

	</style>
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
                  <section class="content-header">
                              <h1>
                                Dashboard
                              </h1>
                              <ol class="breadcrumb">
                                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                              </ol>
                            </section>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4 card-view">
                            <i class="fa fa-road"></i>
                            <p style="color:white;"> Issues Count :</p>
                            <asp:Label ID="lblIssue" runat="server" Text="0"></asp:Label>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-4 card-view">
                            <i class="fa fa-user"></i><br />
                            <p>Users Count :</p><br />
                            <asp:Label ID="lblWork" runat="server" Text="0"></asp:Label>
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
