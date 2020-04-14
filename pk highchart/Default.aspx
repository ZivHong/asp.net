<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>影片類型</title>
        <script type="text/javascript" src="/js/jquery.min.js"></script>
		<script type="text/javascript">
            function init() {
		        var c = document.all.HF.value;//取得hiddenfield裡面的值
		        var p1 = 0, p2 = 0, p3 = 0, p4 = 0, p5 = 0;
		        var s = c.split(",");//HF裡面的值做分段
		        p1 = parseInt(s[0]);
		        p2 = parseInt(s[1]);
		        p3 = parseInt(s[2]);
		        p4 = parseInt(s[3]);
		        p5 = parseInt(s[4]);
		       $(document).ready(function() {
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'container',//表格呈現在id為contaoner的div
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false
                        },
                        title: {
                            text: 'Video Type'
                        },
                        tooltip: {//滑鼠在圖上的提示資訊
                           formatter: function() {
                                        return '<b>'+ this.series.name +'</b>: '+ this.point.percentage.toFixed(2)+"%";
                                    }
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {//圖上的標籤
                                    enabled: true,
                                    color: '#000000',
                                    connectorColor: '#000000',
                                    formatter: function() {
                                        return '<b>'+ this.point.name +'</b>: '+ this.y;
                                    }
                                }
                            }
                        },
                        series: [{
                            type: 'pie',
                            name: 'portion',
                            data: [
                                ['動作',    p1],
                                ['冒險',    p2],
                                ['恐怖驚悚',p3],
                                ['卡通動畫',p4],
                                ['恐怖喜劇',p5]
                            ]
                        }]
                    });
                });
		    };
		</script>
	</head>
	<body onload="init();">
        <script src="/js/highcharts.js"></script>
        <script src="/js/exporting.js"></script>
        <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
        <form id="form1" runat="server">
            <div>
                <div id="myCanvas" style="position:relative;left:0px;top:0px;height:250px;width:100%;"></div>
                <asp:HiddenField ID="HF" runat="server" />    
            </div>
        </form>
	</body>
</html>
