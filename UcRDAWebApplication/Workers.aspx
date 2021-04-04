<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Workers.aspx.cs" Inherits="UcRDAWebApplication.Workers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Workers List</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
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
                                    
                                    <br />
                                    <table border="0">
                                        <tr style="margin-bottom:2px;">
                                            <td >Name:</td>
                                            <td>:</td>
                                            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr style="margin-bottom:2px;">
                                            <td>NIC</td>
                                            <td>:</td>
                                            <td><asp:TextBox ID="txtNic" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr style="margin-bottom:2px;">
                                            <td>Works In</td>
                                            <td>:</td>
                                            <td>
                                                <asp:DropDownList ID="dlWorksIn" runat="server">
                                                    <asp:ListItem>UC</asp:ListItem>
                                                    <asp:ListItem>RDA</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr style="margin-bottom:2px;">
                                            <td>Location</td>
                                            <td>:</td>
                                            <td><asp:TextBox ID="txtLocation" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr style="margin-bottom:2px;">
                                            <td>Password</td>
                                            <td style="align-content:center">:</td>
                                            <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr style="margin-bottom:2px;">
                                            <td>Type</td>
                                            <td>:</td>
                                            <td><asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem Value="0">Admin</asp:ListItem>
                                                <asp:ListItem Value="1">Worker</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" /></td>
                                            <td>
                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /></td>
                                            <td>
                                                <asp:Button ID="btnDelete" runat="server" Text="Dalete" OnClick="btnDelete_Click" /></td>
                                        </tr>

                                    </table>
                                   
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box">
                                    
                                    <div class="box-body">
                                            <asp:GridView ID="dgWorkers" runat="server">
                                                <Columns>
                                                    <asp:BoundField AccessibleHeaderText="Id" DataField="Id" HeaderText="Id" Visible="False" />
                                                    <asp:BoundField AccessibleHeaderText="Name" DataField="Name" HeaderText="Name" />
                                                    <asp:BoundField AccessibleHeaderText="NIC" HeaderText="NIC" />
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
