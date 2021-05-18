<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkerHome.aspx.cs" Inherits="UcRDAWebApplication.WorkerHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home (MyCity Worker)</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />

    <script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyBCGsEq8HQQahyPFNHMeickXmKWoJ6h6nw&sensor=false"></script>
    <script>  
        function initialize(latvalue, longvalue) {  
            var latvar = latvalue  
            var longvar = longvalue  
            var mapProp = {  
                center: new google.maps.LatLng(latvar, longvalue),  
                zoom: 15,  
                mapTypeId: google.maps.MapTypeId.ROADMAP  
            };  
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("MapArea"), mapProp);  

            var myLatlng = new google.maps.LatLng(latvar, longvar);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map
            });

            (function (marker) {
                // add a on marker click event
                google.maps.event.addListener(marker, "click", function (e) {
                    //show description
   
                    infoWindow.open(map, marker);
                });
            })(marker);
        }  
    </script>
    <script>  
        function MyFunction(latval, longval) {

            document.getElementById("MapArea").style.display = "block";
            initialize(latval, longval);

        }
    </script> 
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
                              <asp:GridView ID="dgIssueList" runat="server" AutoGenerateColumns="False" CssClass="table" AutoGenerateSelectButton="True" ShowHeaderWhenEmpty="True" EmptyDataText = "No Records Found" OnSelectedIndexChanging="dgIssueList_SelectedIndexChanging">
                                  <Columns>
                                      <asp:BoundField DataField="Id" HeaderText="Id" />
                                      <asp:BoundField DataField="IssueId" HeaderText="Issue Id" />
                                      <asp:BoundField DataField="Status" HeaderText="Status" />
                                      <asp:BoundField DataField="Area" HeaderText="Area" />
                                      <asp:BoundField DataField="AssignedDate" HeaderText="Assigned Date" />
                                  </Columns>
                              </asp:GridView>
                              <br />
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
                              <div class="row">
                                  <div class="col-md-12 issue-card" <%--style="box-shadow:0px 1px 1px 0px;border:0px;"--%>>
                                      <h3>More Informations</h3>
                                      <hr />
                                      <div class="row">
<%--                                          <div class="col-md-3">Image :</div>--%>
                                          <div class="col-md-4"> <asp:Image ID="imgIssue" runat="server" Height="200px" Width="300px"/></div>
                                          <div class="col-md-3">Location :</div>
                                          <div class="col-md-5" id="MapArea" style="display:none;height:250px;width:350px;">
                                              <asp:Label ID="lblIId" runat="server" Text="" Visible="false"></asp:Label>
                                          </div>
                                          
                                      </div><br />
                                      <div class="row">
                                          <div class="col-md-3">Reported Date :</div>
                                          <div class="col-md-3"> <asp:Label ID="lblDate" runat="server" Text="N/A"></asp:Label></div>
                                          <div class="col-md-3">Assigned Date :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblAssignedDate" runat="server" Text="N/A"></asp:Label>
                                          </div>
                                          
                                      </div><br />
                                      <div class="row">
                                          <div class="col-md-3">Road Type :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblRoadType" runat="server" Text="N/A"></asp:Label></div>
                                          <div class="col-md-3">Issue Type :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblIssueType" runat="server" Text="N/A"></asp:Label>
                                              <asp:Label ID="lblId" runat="server" Text="" Visible="false"></asp:Label>
                                          </div>       
                                      </div>
                                      <br />
                                      <div class="row">
                                          <div class="col-md-3">Area :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblArea" runat="server" Text="N/A"></asp:Label></div>
                                          <div class="col-md-3">Province :</div>
                                          <div class="col-md-3">
                                              <asp:Label ID="lblProvince" runat="server" Text="N/A"></asp:Label></div>
                                      </div>
                                      <br />
                                      <div class="row">
                                          <div class="col-md-6"></div>
                                          <div class="col-md-3">Update Status</div>
                                          <div class="col-md-2">
                                              <asp:DropDownList ID="dlStatus" runat="server">
                                                  <asp:ListItem>Processing</asp:ListItem>
                                                  <asp:ListItem>Done</asp:ListItem>
                                                  <asp:ListItem>Working</asp:ListItem>
                                                  
                                              </asp:DropDownList></div>
                                          <div class="col-md-1 pull-left"><asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btn btn-warning" OnClick="btnSubmit_Click" /></div>
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
