using System;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class _Default : Page
{//引入class裡封裝好的物件
    mydb.Nonquery nq_func = new mydb.Nonquery(); //無回傳值
    mydb.Query q_func = new mydb.Query();//有回傳值
    public string sql;
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        title_TB.Text = "";
        Director_TB.Text = "";
    }
    protected void add_btn_Click(object sender, EventArgs e)
    {
        sql = "insert into video(title,director,grade,type) values('" + title_TB.Text + "','" + Director_TB.Text + "','" + grade_DropDownList.SelectedValue + "','" + type_DropDownList.SelectedValue + "')";
        
        if (title_TB.Text == "" || Director_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('欄位不可為空!');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('新增成功!');</script>");
            nq_func.Execute(sql); // 執行nonquery func
        }
    }
    protected void modify_btn_Click(object sender, EventArgs e)
    {
        sql = "update video set director='" + Director_TB.Text + "',grade='" + grade_DropDownList.SelectedValue + "',type='" + type_DropDownList.SelectedValue + "' where title='" + title_TB.Text + "'";
        if (title_TB.Text == "" || Director_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('欄位不可為空!');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('修改成功!');</script>");
            nq_func.Execute(sql);  // 執行nonquery func
        }
    }

    protected void search_btn_Click(object sender, EventArgs e)
    {
        string data_str = "";
        sql = "select title,director,grade,type from video where video.title ='" + title_TB.Text + "';";
        string[] label_str = { "Title:", "Director : ", "Grade   : ", "Type     : " };
        if (title_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('Title不可為空!');</script>");
        }
        else
        {
            for (int i = 0; i < 4; i++)
            {
                Literal lit = new Literal();
                try
                {
                    data_str = q_func.Execute(sql);//接收class的return 值
                    string[] sarray = data_str.Split(',');  //以","分割成新陣列
                    lit.Text = label_str[i] + sarray[i];  //資料加上每個label
                    result_placeholder.Controls.Add(lit);
                    result_placeholder.Controls.Add(new LiteralControl("<br/>"));
                }
                catch (InvalidOperationException)
                {
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無資料!');</script>");
                    break;
                }
                catch(IndexOutOfRangeException)
                {
                    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無資料!');</script>");
                    break;
                }
            }
        }
    }
    protected void del_btn_Click(object sender, EventArgs e)
    {
        sql = "delete from video where title='" + title_TB.Text + "'";
        if (title_TB.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('Title不可為空!');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('刪除成功!');</script>");
            nq_func.Execute(sql);  // 執行nonquery func
        }
    }
}