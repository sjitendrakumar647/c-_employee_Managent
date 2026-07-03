using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CrudOperations.DAL
{
    public class StudentDAL
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public int InsertStudent(string name, string email, string gender, string course, string pdfPath)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("INSERT_DATA", con); // INSERT_DATA stored procedure for "Employee" table

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@NAME", name);
                cmd.Parameters.AddWithValue("@EMAIL", email);
                cmd.Parameters.AddWithValue("@GENDER", gender);
                cmd.Parameters.AddWithValue("@COURSE", course);
                cmd.Parameters.AddWithValue("@PDFPATH", pdfPath);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }

        public DataTable GetStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("GET_ALL_DATA", con);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                return dt;
            }
        }

        public int DeleteStudent(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE_DATA", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();

                return cmd.ExecuteNonQuery();
            }
        }
    }
}