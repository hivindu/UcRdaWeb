<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkerHome.aspx.cs" Inherits="UcRDAWebApplication.WorkerHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home (MyCity Worker)</title>
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
                      <a class="navbar-brand" href="#">My City</a>
                    </div>
                    <ul class="nav navbar-nav pull-right">
                      <li ><a href="WorkerHome.aspx">Home</a></li>
                        <li><a href="Logout.aspx">Log Out</a></li>
                    </ul>
                       </div>
           </nav>
                      <div class="container">
                          <section class="content-header">
                               <h1>Issue List</h1>
                               <ol class="breadcrumb">
                               <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                               </ol>
                         </section>
                          <section class="content-body">
                              <asp:GridView ID="dgIssueList" runat="server"></asp:GridView>

                              <div class="row">
                                  <div class="col-md-12" style="box-shadow:0px 1px 1px 0px;border:0px;">
                                      <h3>More Informations</h3>
                                      <hr />
                                      <div class="row">
                                          <div class="col-md-3">Image :</div>
                                          <div class="col-md-3"> <asp:Image ID="Image1" runat="server" Height="150px" Width="150px"/></div>
                                          <div class="col-md-3">Province :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblProvince" runat="server" Text="N/A"></asp:Label></div>
                                      </div><br />
                                      <div class="row">
                                          <div class="col-md-3">Date :</div>
                                          <div class="col-md-3"> <asp:Label ID="lblDate" runat="server" Text="N/A"></asp:Label></div>
                                          <div class="col-md-3">Issue Type :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblIssueType" runat="server" Text="N/A"></asp:Label>
                                          </div>
                                      </div><br />
                                      <div class="row">
                                          <div class="col-md-3">Road Type :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblRoadType" runat="server" Text="N/A"></asp:Label></div>
                                          <div class="col-md-3">Location :</div>
                                          <div class="col-md-3">Map implementation</div>
                                      </div>
                                      <br />
                                      <div class="row">
                                          <div class="col-md-6"></div>
                                          <div class="col-md-3">Update Status</div>
                                          <div class="col-md-3">
                                              <asp:DropDownList ID="dlStatus" runat="server">
                                                  <asp:ListItem>Processing</asp:ListItem>
                                                  <asp:ListItem>Done</asp:ListItem>
                                              </asp:DropDownList><asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btn btn-warning" /></div>
                                      </div>
                                  </div>
                              </div>
                          </section>
                      </div>
                 

          <%}
            else {
                Response.Redirect("Login.aspx");
            } %>
        <div>

        </div>
    </form>
</body>
</html>
