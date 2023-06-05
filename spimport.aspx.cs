using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.Common;

public partial class spimport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("redirectto.aspx");
    }

    SqlConnection con = new SqlConnection("Data Source=Dhiraj;Initial Catalog=CombineDB;Integrated Security=True");
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ConStr = "";
        string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
        string path = Server.MapPath("~/MyFolder/" + FileUpload1.FileName);
        FileUpload1.SaveAs(path);
        if (ext.Trim() == ".xls")
        {
            ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
        }
        else if (ext.Trim() == ".xlsx")
        {
            ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
        }
        OleDbConnection connection = new OleDbConnection(ConStr);
        OleDbCommand command = new OleDbCommand("select * from [Sheet1$]", connection);
        connection.Open();
        DbDataReader dr = command.ExecuteReader();
        SqlBulkCopy bulkInsert = new SqlBulkCopy(con);  
        bulkInsert.DestinationTableName = "tblusdrate";
        con.Open();
        bulkInsert.WriteToServer(dr);  
        BindGrid();
    }
    void BindGrid()
    {
        SqlCommand cmd = new SqlCommand("sp_selecttblusdrate", con);
        SqlDataAdapter sd = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sd.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "StatusReport" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView1.GridLines = GridLines.Both;
        GridView1.HeaderStyle.Font.Bold = true;
        GridView1.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
    }
}