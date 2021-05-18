<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Issues.aspx.cs" Inherits="UcRDAWebApplication.Issues" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issues List</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>  
	<link rel="stylesheet" type="text/css" href="css/main.css" />
    
    <style type="text/css">  
      html, body, #canvasMap {  
        height: 200px;  
        margin: 0px;  
        padding: 0px  
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
                     <section class="content-header">
                              <h1>
                                Issue List
                              </h1>
                              <ol class="breadcrumb">
                                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                                <li class="active">Issues List</li>
                              </ol>
                            </section>
                        <asp:GridView ID="dgIssues" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" ShowHeaderWhenEmpty="True" EmptyDataText = "No Records Found" AutoGenerateSelectButton="True" OnSelectedIndexChanging="dgIssues_SelectedIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="Id" />
                                <asp:BoundField AccessibleHeaderText="Province" DataField="Province" HeaderText="Province" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="RoadType" HeaderText="Road Type" />
                            </Columns>
                        </asp:GridView>
                    <%  }
                        else
                        {
                    %>
                     <section class="content-header">
                              <h1>
                                Issue List
                              </h1>
                              <ol class="breadcrumb">
                                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                                <li class="active">Issue List</li>
                              </ol>
                            </section>
                        <asp:GridView ID="dgIssuesRda" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" ShowHeaderWhenEmpty="True" EmptyDataText = "No Records Found" CssClass="table table-hover" OnSelectedIndexChanged="dgIssuesRda_SelectedIndexChanged" OnSelectedIndexChanging="dgIssuesRda_SelectedIndexChanging" SelectedIndex="0">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Issue ID" />
                                <asp:BoundField AccessibleHeaderText="Province" DataField="Province" HeaderText="Province" />
                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                <asp:BoundField DataField="RoadType" HeaderText="Road Type" />
 
                            </Columns>
                        </asp:GridView>
                    <%
                        }
                    %>
                    <div class="row issue-card">
                        <h3>Issue Details <i class="fa fa-info-circle" aria-hidden="false" style="font-size:14px"></i></h3>
                        <div class="col-md-4">
                            <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                            <asp:Label ID="lblImage" runat="server" Text=""></asp:Label>  <asp:Image ID="IssueImage" runat="server" Height="200px" Width="300px"/>
                        </div>
                        <div class="col-md-8">
                        <div >
                            <asp:Label ID="lblProvince" runat="server" Text="Province" CssClass="issue-details"></asp:Label>
                            :
                            <asp:Label ID="lblProvinceValue" runat="server" Text="" CssClass="issue-details"></asp:Label>
                        </div>
                        
                            <div >
                                <asp:Label ID="lblDate" runat="server" Text="Date" CssClass="issue-details"></asp:Label>
                                :
                                <asp:Label ID="lblDateValue" runat="server" Text="" CssClass="issue-details"></asp:Label>
                            </div>
                            <div >
                                <asp:Label ID="lblRoadType" runat="server" Text="Road Type" CssClass="issue-details"></asp:Label>
                                :
                                <asp:Label ID="lblRoadTypeValue" runat="server" Text="" CssClass="issue-details"></asp:Label>
                            </div>
                            <div style="margin-bottom: 1em;">
                                <asp:Label ID="lblIssueType" runat="server" Text="Issue Type" CssClass="issue-details"></asp:Label>
                                :
                                <asp:Label ID="lblIssueTypeValue" runat="server" Text="" CssClass="issue-details"></asp:Label>
                            </div>

                            <div >
                                
                            <%if (type == "rda")
                                {%>

                                <asp:DropDownList ID="dlWorkers" runat="server" OnSelectedIndexChanged="dlWorkers_SelectedIndexChanged">
                                    <asp:ListItem>- Worker -</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnAssignToWorker" runat="server" Text="Assign To Worker" CssClass="btn btn-success" OnClick="btnAssignToWorker_Click" />
                                <% }
                                    else
                                    {%>
                                <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-danger btn-remove" OnClick="btnRemove_Click" />
                                <asp:Button ID="btnAssign" runat="server" Text="Assign To RDA" CssClass="btn btn-success btn-rda" OnClick="btnAssign_Click" />
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
        <%}
            else {
                Response.Redirect("Login.aspx");
            }%>
    </form>
</body>
</html>
