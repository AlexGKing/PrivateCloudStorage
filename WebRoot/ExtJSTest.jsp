<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'ExtJSTest.jsp' starting page</title>
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="css/KitchenSink-all.css"/>
<script type="text/javascript" src="js/all-classes.js"></script>


<script type="text/javascript"> 
	Ext.define('KitchenSink.view.grid.ArrayGrid', {
    extend: 'Ext.grid.Panel',
    requires: [
        'Ext.grid.column.Action'
    ],
    xtype: 'array-grid',
    store: 'Companies',
    stateful: true,
    collapsible: true,
    multiSelect: true,
    stateId: 'stateGrid',
    height: 350,
    title: 'Array Grid',
    viewConfig: {
        stripeRows: true,
        enableTextSelection: true
    },

    initComponent: function () {
        this.width = 650;
        this.columns = [
            {
                text     : 'Company',
                flex     : 1,
                sortable : false,
                dataIndex: 'company'
            },
            {
                text     : 'Price',
                width    : 75,
                sortable : true,
                renderer : 'usMoney',
                dataIndex: 'price'
            },
            {
                text     : 'Change',
                width    : 80,
                sortable : true,
                renderer : function(val) {
                    if (val > 0) {
                        return '<span style="color:' + '#73b51e' + ';">' + val + '</span>';
                    } else if (val < 0) {
                        return '<span style="color:' + '#cf4c35' + ';">' + val + '</span>';
                    }
                    return val;
                },
                dataIndex: 'change'
            },
            {
                text     : '% Change',
                width    : 100,
                sortable : true,
                renderer : function(val) {
                    if (val > 0) {
                        return '<span style="color:' + '#73b51e' + '">' + val + '%</span>';
                    } else if (val < 0) {
                        return '<span style="color:' + '#cf4c35' + ';">' + val + '%</span>';
                    }
                    return val;
                },
                dataIndex: 'pctChange'
            },
            {
                text     : 'Last Updated',
                width    : 115,
                sortable : true,
                renderer : Ext.util.Format.dateRenderer('m/d/Y'),
                dataIndex: 'lastChange'
            },
            {
                menuDisabled: true,
                sortable: false,
                xtype: 'actioncolumn',
                width: 50,
                items: [{
                    iconCls: 'sell-col',
                    tooltip: 'Sell stock',
                    handler: function(grid, rowIndex, colIndex) {
                        var rec = grid.getStore().getAt(rowIndex);
                        Ext.Msg.alert('Sell', 'Sell ' + rec.get('company'));
                    }
                }, {
                    getClass: function(v, meta, rec) {
                        if (rec.get('change') < 0) {
                            return 'alert-col';
                        } else {
                            return 'buy-col';
                        }
                    },
                    getTip: function(v, meta, rec) {
                        if (rec.get('change') < 0) {
                            return 'Hold stock';
                        } else {
                            return 'Buy stock';
                        }
                    },
                    handler: function(grid, rowIndex, colIndex) {
                        var rec = grid.getStore().getAt(rowIndex),
                            action = (rec.get('change') < 0 ? 'Hold' : 'Buy');

                        Ext.Msg.alert(action, action + ' ' + rec.get('company'));
                    }
                }]
            }
        ];

        this.callParent();
    }
});
</script>


<link rel="stylesheet" type="text/css" href="css/ext-all.css"/>
<script type="text/javascript" src="js/Ext.Base.js"></script>

<script type="text/javascript" src="js/ext-all.js"></script>

-->


	<link href="ext/resources/css/ext-all.css" rel="stylesheet">
		<link href="ext/resources/css/xtheme-gray.css"
			rel="stylesheet">
		<script type="text/javascript"
			src="ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="ext/ext-all.js"></script>
		<script type="text/javascript"	src="ext/build/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript"> 
Ext.onReady(function(){
//Ext.MessageBox.alert("Hello","Hello ExtJS");
var win = new Ext.Window({ title: "Hello", width: 300, height: 200, html: '<h1>Hello Easy ExtJS Open Source Window</h1>' }); 
win.show(); 
});
</script>
  </head>
  <body>
  </body>
</html>
