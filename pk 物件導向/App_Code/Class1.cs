using System.Data.OleDb;

namespace mydb //定義一個namespace
{
    public class DB  //創造一個叫DB的物件

    { //封裝欄位，protected 表示可適用於該物件及其繼承的物件
        protected OleDbDataReader dbread = null;
        protected OleDbCommand cmd = new OleDbCommand();
        protected OleDbConnection conn = new OleDbConnection("Provider= Microsoft.Jet.OLEDB.4.0; Data Source = |DataDirectory|/dvd0407.mdb");
    }
    public class Nonquery : DB  //繼承DB
    {
        public void Execute(string sql)  //public 是大家都可用
        {
            conn.Open();
            cmd = new OleDbCommand(sql, conn);
            cmd.ExecuteNonQuery();    //執行nonquery程式，沒有從資料庫取資料
            conn.Close();
        }
    }
    public class Query : DB   //繼承DB
    {
        public string Execute(string sql)
        {
            string result = "";
            cmd = new OleDbCommand(sql, conn);
            conn.Open();
            dbread = cmd.ExecuteReader();   //執行reader，讀取資料庫回傳資料
            dbread.Read();//開始讀取
            for (int i = 0; i < 4; i++)    //把讀來的結果放進result
            {
                result += dbread.GetString(i) + ",";//用逗號分隔欄位，方便後台處理字串
            }
            dbread.Close();
            conn.Close();
            return result;  //回傳result給呼叫此物件的程式
        }
    }
}
