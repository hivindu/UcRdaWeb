<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issues.aspx.cs" Inherits="UcRDAWebApplication.Issues" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issues List</title>
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
                      <a class="navbar-brand" href="#">MyCity</a>
                    </div>
                    <ul class="nav navbar-nav pull-right">
                      <li ><a href="AdminHome.aspx">Home</a></li>
                      <li class="active"><a href="Issues.aspx">Issues</a></li>
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
                    <%
                        if (type == "rda")
                        {
                    %>
                        <asp:GridView ID="dgIssues" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
                            <Columns>
                                <asp:BoundField DataField="Id" Visible="False" />
                                <asp:ImageField AccessibleHeaderText="Image" HeaderText="Image">
                                </asp:ImageField>
                                <asp:BoundField AccessibleHeaderText="Province" DataField="Province" HeaderText="Province" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="RoadType" HeaderText="Road Type" />
                                <asp:ButtonField ButtonType="Button" Text="Assign To Worker" />
                            </Columns>
                        </asp:GridView>
                    <%  }
                        else
                        {
                    %>
                        <asp:GridView ID="dgIssuesRda" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
                            <Columns>
                                <asp:BoundField DataField="Id" Visible="False" />
                                <asp:ImageField AccessibleHeaderText="Image" HeaderText="Image">
                                </asp:ImageField>
                                <asp:BoundField AccessibleHeaderText="Province" DataField="Province" HeaderText="Province" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="RoadType" HeaderText="Road Type" />
                                <asp:ButtonField ButtonType="Button" CommandName="Assign" Text="Assign To RDA" />
 
                            </Columns>
                        </asp:GridView>
                    <%
                        }
                    %>
                    <div class="row">
                        <div>
                            <asp:Label ID="lblProvince" runat="server" Text="Province"></asp:Label> : <asp:Label ID="lblProvinceValue" runat="server" Text=""></asp:Label>
                        </div>
                        <div></div>
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>
        <%}
            else {
                Response.Redirect("Login.aspx");
            }%>
    </form>
</body>
</html>
