<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
    
<body >
    <form id="form1" runat="server">
        <br /><br />
        <div id="pieCanvas" style="top: 0px;left: 0px;position:absolute;height:250px;width:100%;">
            <input type="button"  value="顯示圖表" onclick="Query_Click()" />&nbsp;&nbsp;&nbsp;
            <!-- -->
            <label for="color">Choose color:</label>
            <select id="color">
              <option value="#FF0000">Red</option>
              <option value="#00FF00">Green</option>
              <option value="#0000FF">Blue</option>
              <option value="#FF69B4">Pink</option>
              <option value="#FF7F50">Orange</option>
              <option value="#FFFF00">Yellow</option>
            </select>&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CTxt" runat="server" >座標</asp:TextBox>
            
        </div>
    </form>
</body>
</html>
<script type="text/javascript" src="graph.js"></script>
<script type="text/javascript" src="piechart.js"></script>
<script type="text/javascript">
    var data = [];
    //ajax向後端索取資料
    function Query_Click() {
        WebForm_DoCallback('__Page', '1', RSD, "", null, false);
    }
    function RSD(DFS) {
        //處理後端送過來的資料
        data = DFS.split(",");
        //piechart加入資料
        //要畫出圓餅圖需要給資料，算百分比轉角度，用jg.fillArc填充顏色
        var p = new pie();
        p.add("動作",data[0]);
        p.add("冒險",data[1]);
        p.add("恐怖驚悚",data[2]);
        p.add("卡通動畫",data[3]);
        p.add("恐怖喜劇", data[4]);
        //畫出piechart
        p.render("pieCanvas", "Pie Graph")
    }
         var i;
         function aa() {
             if (i == 1) {
                 //取得選取的色彩，設定畫筆
                 var e = document.getElementById("color");
                 var sel_color = e.options[e.selectedIndex].value;
                 document.all.CTxt.value = event.clientX + "," + event.clientY;
                 jg.setColor(sel_color);
                 jg.setPrintable(true);
                 jg.setStroke(2);
                 jg.drawLine(x, y, event.clientX, event.clientY);
                 jg.paint();
             }
             x = event.clientX;
             y = event.clientY;
         }
         function bb() {
             i = 1;
         }
         function cc() {
             i = 0;
         }
         document.onmousemove = aa;//滑鼠移動
         document.onmousedown = bb;//滑鼠點擊
         document.onmouseup = cc;//滑鼠放開
         var jg = new jsGraphics("pieCanvas");
</script>
