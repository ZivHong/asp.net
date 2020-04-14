using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
public partial class _Default : Page
{
    //初始化一些資料庫工具
    //sql是操作資料庫的指令，conn是連接資料庫，cmd(sql,conn)是針對連接的資料庫執行指令
    public string sql;
    OleDbDataReader dbread = null;
    OleDbCommand cmd = new OleDbCommand();
    OleDbConnection conn = new OleDbConnection("Provider= Microsoft.Jet.OLEDB.4.0; Data Source = |DataDirectory|/dvd0407.mdb");
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
    }
    protected void Page_Unload(object sender, EventArgs e)
    {
        conn.Close();
    }
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        title_TB.Text = "";
        Director_TB.Text = "";
    }
    protected void add_btn_Click(object sender, EventArgs e)
    {
        //新增資料
        sql = "insert into video(title,director,grade,type) values('" + title_TB.Text + "','" + Director_TB.Text + "','" + grade_DropDownList.SelectedValue + "','" + type_DropDownList.SelectedValue + "')";

        cmd = new OleDbCommand(sql, conn);
        if (title_TB.Text == "" || Director_TB.Text == "")
        {//如果沒有輸入標題或導演就會提示錯誤，dropdwonlist有預設輸入所以不會有空白值
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('欄位不可為空!');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('新增成功!');</script>");
            cmd.ExecuteNonQuery();
        }
    }
    protected void modify_btn_Click(object sender, EventArgs e)
    {//更新資料
        sql = "update video set director='" + Director_TB.Text + "',grade='" + grade_DropDownList.SelectedValue + "',type='" + type_DropDownList.SelectedValue + "' where title='" + title_TB.Text + "'";
        cmd = new OleDbCommand(sql, conn);
        //避免輸入空主鍵及空資料
        if (title_TB.Text == "" || Director_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('欄位不可為空!');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('修改成功!');</script>");
            cmd.ExecuteNonQuery();
        }
    }

    protected void search_btn_Click(object sender, EventArgs e)
    {//查詢資料
        sql = "select title,director,grade,type from video where title ='" + title_TB.Text + "';";
        cmd = new OleDbCommand(sql, conn);
        string[] str = { "Title:", "Director : ", "Grade   : ", "Type     : " };
        OleDbDataReader dbread = null;
        //避免輸入空主鍵
        if (title_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('Title不可為空!');</script>");
        }
        else
        {//因為有回傳查詢結果所以用OleDbDataReader
            dbread = cmd.ExecuteReader();
            dbread.Read();
            for (int i = 0; i < 4; i++)
            {//把查詢結果放入literal
                Literal lit = new Literal();
                try
                {//把literal放入前台的placeholder
                    lit.Text = str[i] + dbread[i];
                    result_placeholder.Controls.Add(lit);
                    result_placeholder.Controls.Add(new LiteralControl("<br/>"));
                }
                catch (InvalidOperationException)
                {//利用try catch來避免輸入不存在的主鍵導致錯誤
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無資料!');</script>");
                    break;
                }
            }
            dbread.Close();
        }
    }
    protected void del_btn_Click(object sender, EventArgs e)
    {//刪除資料
        sql = "delete from video where title='" + title_TB.Text + "'";
        cmd = new OleDbCommand(sql, conn);
        //避免輸入空主鍵
        if (title_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('Title不可為空!');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('刪除成功!');</script>");
            cmd.ExecuteNonQuery();
        }
    }
}