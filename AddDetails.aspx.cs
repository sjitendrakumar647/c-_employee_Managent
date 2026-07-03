using CrudOperations.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudOperations
{
    public partial class AddDetails : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            LoadStudents();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Request.QueryString["success"] == "1")
                //{
                //    ClientScript.RegisterStartupScript(
                //        this.GetType(),
                //        "msg",
                //        "alert('Student Registered Successfully');",
                //        true);
                //}
                //LoadStudents();
            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string pdfPath = "";
                    if (fuPDF.HasFile)
                    {
                        string extension = Path.GetExtension(fuPDF.FileName).ToLower();
                        if(extension != ".pdf")
                        {
                            ScriptManager.RegisterStartupScript(
                                this,
                                GetType(),
                                "msg",
                                "alert('only pdf files are allowed');",
                                true);
                            return;
                        }
                        string fileName = Guid.NewGuid().ToString() + extension;

                        string savePath = Server.MapPath("~/PDFs/") + fileName;

                        fuPDF.SaveAs(savePath);

                        pdfPath = "~/PDFs/" + fileName;
                    }
                    StudentDAL dal = new StudentDAL();

                    dal.InsertStudent(
                        txtFirstName.Text.Trim(),
                        txtemail.Text.Trim(),
                        rdGender.SelectedValue,
                        ddlCourse.SelectedValue,
                        pdfPath);

                    // Clear controls
                    txtFirstName.Text = "";
                    txtemail.Text = "";
                    rdGender.ClearSelection();
                    ddlCourse.SelectedIndex = 0;

                    // Reload table
                    LoadStudents();

                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "msg",
                        "alert('Employee Registered Successfully');",
                        true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "err",
                    $"alert('{ex.Message.Replace("'", "\\'")}');",
                    true);
            }
        }

        // LOAD STUDENT DATA

        private void LoadStudents()
        {
            StudentDAL dal = new StudentDAL();

            DataTable dt = dal.GetStudents();

            // Remove all rows except the header
            while (tblStudents.Rows.Count > 1)
            {
                tblStudents.Rows.RemoveAt(1);
            }

            foreach (DataRow dr in dt.Rows)
            {
                TableRow row = new TableRow();

                row.Cells.Add(new TableCell() { Text = dr["ID"].ToString() });
                row.Cells.Add(new TableCell() { Text = dr["NAME"].ToString() });
                row.Cells.Add(new TableCell() { Text = dr["EMAIL"].ToString() });
                row.Cells.Add(new TableCell() { Text = dr["GENDER"].ToString() });
                row.Cells.Add(new TableCell() { Text = dr["COURSE"].ToString() });

                // PDF Download Link
                TableCell pdfCell = new TableCell();

                LinkButton lnkDownload = new LinkButton();

                lnkDownload.Text = "Download PDF";
                lnkDownload.CommandArgument = dr["PDFPath"].ToString();
                lnkDownload.Click += DownloadPDF_Click;
                lnkDownload.CausesValidation = false;

                pdfCell.Controls.Add(lnkDownload);

                row.Cells.Add(pdfCell);


                // Delete Button
                Button btnDelete = new Button();

                btnDelete.Text = "Delete";
                btnDelete.CssClass = "btn btn-danger btn-sm";
                btnDelete.CommandArgument = dr["ID"].ToString();

                btnDelete.Command += BtnDelete_Command;

                btnDelete.CausesValidation = false;
                btnDelete.UseSubmitBehavior = false;

                TableCell actionCell = new TableCell();
                actionCell.Controls.Add(btnDelete);

                row.Cells.Add(actionCell);

                tblStudents.Rows.Add(row);
            }

        }


        //DOWNLOAD PDF
        protected void DownloadPDF_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            string filePath = btn.CommandArgument;

            string physicalPath = Server.MapPath(filePath);

            if (System.IO.File.Exists(physicalPath))
            {
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AppendHeader(
                    "Content-Disposition",
                    "attachment; filename=" + System.IO.Path.GetFileName(physicalPath));
                Response.TransmitFile(physicalPath);
                Response.End();
            }
            else
            {
                ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "msg",
                    "alert('File not found.');",
                    true);
            }
        }

        protected void BtnDelete_Command(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            int id = Convert.ToInt32(btn.CommandArgument);

            StudentDAL dal = new StudentDAL();

            dal.DeleteStudent(id);

            LoadStudents();

            ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "msg",
                "alert('Record Deleted Successfully');",
                true);
        }
    }
}