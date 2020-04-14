using System;
using System.Data.OleDb;
public partial class _Default : System.Web.UI.Page
{
    public string sql;
    OleDbDataReader dbread = null;
    OleDbCommand cmd = new OleDbCommand();
    OleDbConnection conn = new OleDbConnection("Provider= Microsoft.Jet.OLEDB.4.0; Data Source = |DataDirectory|/dvd0407.mdb");
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        //從資料庫裏面抓各個類型的影片數量
        sql = "select (select count(type) from video where type = '動作') AS Expr1, (select count(type) from video where type = '冒險') AS Expr2, (select count(type) from video where type = '恐怖驚悚') AS Expr3, (select count(type) from video where type = '卡通動畫') AS Expr4, (select count(type) from video where type = '恐怖喜劇') AS Expr5 FROM video; ";
        cmd = new OleDbCommand(sql, conn);
        dbread = cmd.ExecuteReader();
        if (dbread.Read())
        {//把資料庫的資料存到前端的hiidenfield
            HF.Value += dbread[0] + ",";
            HF.Value += dbread[1] + ",";
            HF.Value += dbread[2] + ",";
            HF.Value += dbread[3] + ",";
            HF.Value += dbread[4];
        }
        conn.Close();
    }
    
}