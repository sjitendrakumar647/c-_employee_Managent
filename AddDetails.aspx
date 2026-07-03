<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDetails.aspx.cs" Inherits="CrudOperations.AddDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body class="bg-light">

    <form id="form1" runat="server">

        <div class="container mt-5">

            <div class="row justify-content-center">

                <div class="col-lg-8">

                    <div class="card shadow-lg border-0">

                        <div class="card-header bg-primary text-white text-center">
                            <h3>Employee Registration</h3>
                        </div>

                        <div class="card-body">

                            <!-- First Name -->
                            <div class="mb-3">
                                <label class="form-label fw-bold">First Name</label>

                                <asp:TextBox ID="txtFirstName"
                                    runat="server"
                                    CssClass="form-control"></asp:TextBox>

                                <asp:RequiredFieldValidator
                                    ID="req1"
                                    runat="server"
                                    ControlToValidate="txtFirstName"
                                    ErrorMessage="Please Enter First Name"
                                    ForeColor="Red"
                                    ValidationGroup="A"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <!-- Email -->
                            <div class="mb-3">

                                <label class="form-label fw-bold">Email</label>

                                <asp:TextBox ID="txtemail"
                                    runat="server"
                                    CssClass="form-control"></asp:TextBox>

                                <asp:RequiredFieldValidator
                                    ID="email"
                                    runat="server"
                                    ControlToValidate="txtemail"
                                    ErrorMessage="Please Enter Email"
                                    ForeColor="Red"
                                    ValidationGroup="A"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>

                                <br />

                                <asp:RegularExpressionValidator
                                    ID="revEmail"
                                    runat="server"
                                    ControlToValidate="txtemail"
                                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                    ErrorMessage="Please Enter Valid Email"
                                    ForeColor="Red"
                                    ValidationGroup="A"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>

                            </div>

                            <!-- Gender -->
                            <div class="mb-3">

                                <label class="form-label fw-bold d-block">Gender</label>

                                <asp:RadioButtonList
                                    ID="rdGender"
                                    runat="server"
                                    RepeatDirection="Horizontal"
                                    CssClass="form-check">

                                    <asp:ListItem Text=" Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text=" Female" Value="Female"></asp:ListItem>

                                </asp:RadioButtonList>

                                <asp:RequiredFieldValidator
                                    ID="gender"
                                    runat="server"
                                    ControlToValidate="rdGender"
                                    ErrorMessage="Please Select Gender"
                                    ForeColor="Red"
                                    ValidationGroup="A"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>

                            </div>

                            <!-- Course -->
                            <div class="mb-4">

                                <label class="form-label fw-bold">Course</label>

                                <asp:DropDownList
                                    ID="ddlCourse"
                                    runat="server"
                                    CssClass="form-select">

                                    <asp:ListItem Text="-- Select Course --" Value=""></asp:ListItem>
                                    <asp:ListItem Text="B.Sc" Value="B.Sc"></asp:ListItem>
                                    <asp:ListItem Text="B.Tech" Value="B.Tech"></asp:ListItem>

                                </asp:DropDownList>

                                <asp:RequiredFieldValidator
                                    ID="course"
                                    runat="server"
                                    ControlToValidate="ddlCourse"
                                    InitialValue=""
                                    ErrorMessage="Please Select Course"
                                    ForeColor="Red"
                                    ValidationGroup="A"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>

                            </div>

                           <!--file upload-->
                            <div class="mb-3">
                                <label class="form-label fw-bold">Upload pdf</label>

                                <asp:FileUpload ID="fuPDF" runat="server" CssClass="form-control" />
                            </div>

                            <!-- Submit Button -->
                            <div class="text-center">

                                <asp:Button
                                    ID="btnsubmit"
                                    runat="server"
                                    Text="Register Employee"
                                    CssClass="btn btn-primary btn-lg px-5"
                                    ValidationGroup="A"
                                    OnClick="btnsubmit_Click" />

                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <!-- Student Table -->

            <div class="row mt-5">

                <div class="col-12">

                    <div class="card shadow">

                        <div class="card-header bg-success text-white">
                            <h4 class="mb-0">Registered Eployees</h4>
                        </div>

                        <div class="card-body table-responsive">

                            <asp:Table
                                ID="tblStudents"
                                runat="server"
                                CssClass="table table-bordered table-hover table-striped align-middle">

                                <asp:TableHeaderRow CssClass="table-dark">
                                    <asp:TableHeaderCell>ID</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Gender</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Course</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>PDF</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Action</asp:TableHeaderCell>
                                </asp:TableHeaderRow>

                            </asp:Table>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>