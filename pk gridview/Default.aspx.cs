using System;
using System.IO;
using System.Web.UI.WebControls;
public partial class _Default : System.Web.UI.Page
{
    public string sql;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {//gridview重新整理
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {//找到前端的元件
        Label id = GridView1.Rows[e.RowIndex].FindControl("id") as Label;
        TextBox title = GridView1.Rows[e.RowIndex].FindControl("txt_title") as TextBox;
        TextBox director = GridView1.Rows[e.RowIndex].FindControl("txt_director") as TextBox;
        TextBox type = GridView1.Rows[e.RowIndex].FindControl("txt_type") as TextBox;
        TextBox trailer = GridView1.Rows[e.RowIndex].FindControl("txt_trailer") as TextBox;
        DropDownList grade= GridView1.Rows[e.RowIndex].FindControl("list_grade") as DropDownList;
        FileUpload upload = GridView1.Rows[e.RowIndex].FindControl("FileUpload2") as FileUpload;
        if (upload.HasFile)
        {//有上傳新圖要存圖檔
            string fileExtension = Path.GetExtension(upload.PostedFile.FileName);
            string updatedFilename = title.Text + fileExtension;
            upload.PostedFile.SaveAs(Server.MapPath("~/img/") + updatedFilename);
            sql = "update video set director='" + director.Text + "',title='" + title.Text + "',grade='" + grade.SelectedValue + "',type='" + type.Text + "',trailer='" + trailer.Text + "',picture='" + updatedFilename + "' where CStr(vno)='" + Convert.ToInt32(id.Text) + "'";
        }
        else
        {
            sql = "update video set director='" + director.Text + "',title='" + title.Text + "',grade='" + grade.SelectedValue + "',type='" + type.Text + "',trailer='" + trailer.Text  + "' where CStr(vno)='" + Convert.ToInt32(id.Text) + "'";
        }
        //呼叫前台datasouce執行update
        data.UpdateCommand = sql;
        data.Update();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {//取消修改欄位
        GridView1.EditIndex = -1;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {//呼叫前台datasouce執行delete
        Label id = GridView1.Rows[e.RowIndex].FindControl("id") as Label;
        sql = "delete from video where CStr(vno)='" + Convert.ToInt32(id.Text) + "'";
        data.DeleteCommand = sql;
        data.Delete();
    }
}