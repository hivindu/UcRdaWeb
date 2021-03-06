<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workers.aspx.cs" Inherits="UcRDAWebApplication.Workers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Workers List</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
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
                        <div class="container">
                            <section class="content-header">
                              <h1>
                                Workers List
                              </h1>
                              <ol class="breadcrumb">
                                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                                <li class="active">Workers List</li>
                              </ol>
                            </section>
                            <div class="row">
                                <div class="col-md-6">
                                    <br />
                                    <h3> <asp:Label ID="lblHeader" runat="server" Text="Details"></asp:Label></h3>
                                    <%
                                        if (Session["error"] != null)
                                        {
                                            string error = Convert.ToString(Session["error"]);
                                            lblErr.Text = error;
                                        %>
                                        <div class='alert alert-danger alert-dismissible'>
                                          <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                                          <h4><i class='icon fa fa-warning'></i> Error!</h4>
                                            <asp:Label ID="lblErr" runat="server" Text=""></asp:Label>
                                        </div>
                                        <%
                                                Session["error"] = null;
                                            }
                                            if(Session["success"]!=null)
                                            {
                                                lblSuc.Text = Convert.ToString(Session["success"]);
                                          %>
                                        <div class='alert alert-success alert-dismissible'>
                                          <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                                          <h4><i class='icon fa fa-check'></i> Success!</h4>
                                            <asp:Label ID="lblSuc" runat="server" Text=""></asp:Label>
                                        </div>
                                        <%
                                                Session["success"] = null;
                                            }
                                        %>
        
                                    <br />
                                    <table border="0">
                                        <tr <%--style="margin-bottom:2px;"--%>>
                                            <td >Name</td>
                                            <td>:<asp:TextBox ID="txtId" runat="server" Visible="false" Width="10px"></asp:TextBox></td>
                                            <td><asp:TextBox ID="txtName" runat="server" ValidateRequestMode="Enabled" CssClass="form-textarea"></asp:TextBox></td>
                                        </tr>
                                        <tr <%--style="margin-bottom:2px;"--%>>
                                            <td>NIC</td>
                                            <td>:</td>
                                            <td><asp:TextBox ID="txtNic" runat="server" ValidateRequestMode="Enabled" CssClass="form-textarea"></asp:TextBox></td>
                                        </tr>
                                        <tr style="margin-bottom:2px;">
                                            <td>Location</td>
                                            <td>:</td>
                                            <td><asp:TextBox ID="txtLocation" runat="server" CssClass="form-textarea"></asp:TextBox></td>
                                        </tr>
                                        <tr <%--style="margin-bottom:2px;"--%>>
                                            <td>Password</td>
                                            <td style="align-content:center">:</td>
                                            <td><asp:TextBox ID="txtPassword" runat="server" ValidateRequestMode="Enabled" CssClass="form-textarea" TextMode="Password"></asp:TextBox></td>
                                        </tr>
                                        <%
                                            if(type=="rda")
                                            { 
                                            %>
                                       <tr style="margin-bottom:1em;">
                                            <td>Type</td>
                                            <td>:</td>
                                            <td><asp:DropDownList ID="dlType" runat="server">
                                                <asp:ListItem Value="0">Admin</asp:ListItem>
                                                <asp:ListItem Value="1">Worker</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <%} %>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-success btn-rda"/></td>
                                            
                                            <td>
                                                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-danger btn-remove"/></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        <div class="row" style="margin-top:2vh;">
                            <div <%--class="col-md-12"--%> >
                                <div class="box">
                                    <div class="box-body">
                                            <asp:GridView ID="dgWorkers" runat="server" AutoGenerateSelectButton="True" ShowHeaderWhenEmpty="True" EmptyDataText = "No Records Found" OnSelectedIndexChanging="dgWorkers_SelectedIndexChanging" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField AccessibleHeaderText="Id" DataField="Id" HeaderText="Id" />
                                                    <asp:BoundField AccessibleHeaderText="Name" DataField="Name" HeaderText="Name" />
                                                    <asp:BoundField AccessibleHeaderText="NIC" HeaderText="NIC" />
                                                    <asp:BoundField DataField="LocationArea" HeaderText="Area" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
        <%}
            else {
                Response.Redirect("Login.aspx");
            } %>
    </form>
</body>
</html>
