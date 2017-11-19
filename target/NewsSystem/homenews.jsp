<%--
  Created by IntelliJ IDEA.
  User: sunbin
  Date: 2017/9/6
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    function clic() {
        var rowData = $("#userGridw").datagrid("getSelected");
        var c;
        if(rowData.stutasnames=="草稿"){
            c="caogao";
        }else if(rowData.stutasnames=="发布"){
            c="fabu";
        }
        else if(rowData.stutasnames=="审核"){
            c="shenhe";
        }
        else if(rowData.stutasnames=="驳回"){
            c="bohui";
        }
        else if(rowData.stutasnames=="删除"){
            c="shanchu";
        }
        $("#mainTabs2").tabs
        (
            "add", {
                title: "编辑" + rowData.stutasnames,

                closable: true,
                href: "/addnews.jsp?id=" + rowData.id + "&status=" + c+"&img="+rowData.img
    }
        )

    }
    $(function () {
        function deptFormatter(val,row,index){
            return val?val.name:"";
        }

        function myFormatter(value, row, index){
            return "<a href='#' onclick='clic()'>"+value+"</a>";
        }
        $(function(){

            // 初始化表格
            $("#userGridw").datagrid({
                url : "/homenews.do",
                fit : true,
                fitColumns : true,
                pagination : true,

                columns:[[
                    {field : 'id' ,
                        checkbox : true},

                    {field:'title',title:'标题',width:1, formatter:myFormatter
                    },
                    {field:'newstype',title:'栏目',width:1,formatter:function (value,row,index) {
                       return value.typename
                    }},
                    {field:'zan',title:'点赞',width:1},
                    {field:'click',title:'点击数',width:1},
                    {field:'stutasnames',title:'状态',width:1},
                    {field:'user',title:'创建者',width:1},
                    {field:'date',title:'更新时间',width:1},
                    {field:'img',title:"",width:1,hidden:'true'}
                ]],
                toolbar : [{
                    text : "添加",
                    iconCls : "icon-add",
                    handler:function(){
                     //   $.messager.alert("提示","添加成功");
                        $("#mainTabs2").tabs
                        (
                            "add", {
                                title: "添加国内",

                                closable: true,
                                href: "/addnews.jsp"
                            }
                        )

                    }
                },{
                    text : "删除",
                    iconCls : "icon-remove",
                    handler:function(){


                        obj = document.getElementsByName("id");
                        check_val = [];
                        for(k in obj){
                            if(obj[k].checked)

                                check_val.push(obj[k].value);
                        }

                        $('#userGridw').datagrid({url:'/delete.do?id='+check_val,

                            queryParams:{method:'post' }
                        });

                    }
                },/*{
                    text : "编辑",
                    iconCls : "icon-edit",
                    handler:function(){
                        //$.messager.alert("提示","编辑....");
                        // 获取,并判断编辑数据的有效性
                        var rowData = $("#userGridw").datagrid("getSelected");

                        if(!rowData){
                            $.messager.alert("提示","请选中一行数据!!","info");
                        }else {

                            // 打开对话框
                            $("#userFormsw").form("clear");
                            $("#userDlgsw").dialog("open");

                            // 加载行数据
                            $("#userFormsw").form("load", "/proselect.do?id="+rowData.id);

                        }
                    }
                },{
                    text : "删除",
                    iconCls : "icon-remove",
                    handler:function(){
                        obj = document.getElementsByName("id");
                        check_val = [];
                        for(k in obj){
                            if(obj[k].checked)
                                check_val.push(obj[k].value);
                        }

                        $('#userGridw').datagrid({url:'/prodelete.do?id='+check_val,

                            queryParams:{method:'post' }
                        });

                    }
                },{
                    text : "刷新",
                    iconCls : "icon-reload",
                    handler:function(){
                        //$.messager.alert("提示","刷新....");
                        $('#userGrid').datagrid('reload');
                    }
                },*/{
                    text: '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题 ：<input type="text" id="userAccounts"/>'
                },{
                    text : "查询",
                    handler:function() {
                       var stutas= $("input[name='stutas']:checked").val();
                       if(stutas==undefined){
                           stutas=0;
                       }
                        var typename=$("#userAccounts").val();
                        $('#userGridw').datagrid({url:'/prolists.do?stutas='+stutas,

                            queryParams:{method:'post', title:typename }
                        });
                        $('#userGridw').datagrid('getPager').pagination({
                            pageSize: 10,//每页显示的记录条数，默认为10 
                            pageList: [5,10,15],//可以设置每页记录条数的列表 
                            beforePageText: '第',//页数文本框前显示的汉字 
                            afterPageText: '页    共 {pages} 页',
                            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',

                        });
                        $("#userAccounts").val(typename);
                    }
                }
                ,{
                    text:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：<input type="radio" name="stutas" value="1" />' +
                    '发布<input type="radio" name="stutas" value="2" />' +
                    '审核<input type="radio" name="stutas" value="3" />' +
                    '驳回<input type="radio" name="stutas" value="4" />' +
                    '删除<input type="radio" name="stutas" value="5" />' +
                    '草稿'

                    },
                  /*  {
                    text : "导出报表",
                    handler:function(){
                        var typename=$("#userAccounts").val();
                        window.location.href="/proexal.do?typename="+typename;


                    }
                }*/

                ]
            });
            $('#userGridw').datagrid('getPager').pagination({
                pageSize: 10,//每页显示的记录条数，默认为10 
                pageList: [5,10,15],//可以设置每页记录条数的列表 
                beforePageText: '第',//页数文本框前显示的汉字 
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',

            });
            // 初始化对话框
            $("#userDlgsw").dialog({
                title:"编辑面板",
                width: 300,
                height :300,
                closed:true,
                modal : true,
                buttons:[
                    {
                        text : "保存",
                        iconCls : "icon-save",
                        handler:function(){
                           // $.messager.alert("提示","保存成功");
                            $("#userFormsw").submit();
                        }
                    }, {
                        text : "取消",
                        iconCls : "icon-cancel",
                        handler:function(){
                          //  $.messager.alert("提示","取消成功");
                            $("#userDlgsw").dialog("close");
                        }
                    }
                ]
            });
            $("#userDlgw").dialog({
                title:"添加面板",
                width: 300,
                height :300,
                closed:true,
                modal : true,
                buttons:[
                    {
                        text : "保存",
                        iconCls : "icon-save",
                        handler:function(){

                           //$.messager.alert("提示","保存成功");
                            $("#userFormw").submit();
                        }
                    }, {
                        text : "取消",
                        iconCls : "icon-cancel",
                        handler:function(){
                            //$.messager.alert("提示","取消成功");
                            $("#userDlgw").dialog("close");
                        }
                    }
                ]
            });

            // 初始化form
            $('#userFormw').form({
                url:"/proinsert.do",
                onSubmit: function(){

                    // do some check
                    // return false to prevent submit;
                },
                success:function(data){    // 表单提交成功后的回调函数

                    //console.debug(data);
                    // 由于easyui-form提交,返回的都是字符串,所以需要转换
                    var rs = $.parseJSON(data);

                    // 判断响应内容,操作是否成功

                    // 成功提示
                    $.messager.alert("提示","保存用户成功!!","info",function(){
                        // 刷新表格
                        $('#userGridw').datagrid('load');

                        // 关闭对话框
                        $("#userDlgw").dialog("close");
                    });

                }
            });
            $('#userFormsw').form({
                url:"/proupdate.do",
                onSubmit: function(){

                    // do some check
                    // return false to prevent submit;
                },
                success:function(data){    // 表单提交成功后的回调函数

                    //console.debug(data);
                    // 由于easyui-form提交,返回的都是字符串,所以需要转换
                    var rs = $.parseJSON(data);

                    // 判断响应内容,操作是否成功

                    // 成功提示
                    $.messager.alert("提示","保存用户成功!!","info",function(){
                        // 刷新表格
                        $('#userGridw').datagrid('load');

                        // 关闭对话框
                        $("#userDlgsw").dialog("close");
                    });

                }
            });
            // 当前页面初始化完毕,手动初始化"验证输入框组件"
            $("input").validatebox({

            });
        });

    })

</script>

<table id="userGridw" data-height="300px">

</table>
<div id="userDlgw" data-height="100px">
    <form id="userFormw" action="/proinsert.do" method="post">
        <table align="center" style="margin-top: 10px; width: auto;height: auto">
            <tr>
                <td>供应商编号:</td>
                <td><input name="proCode" class="easyui-validatebox" /></td>
            </tr>
            <tr>
                <td>供应商名称:</td>
                <td><input name="proName" id="productNames" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>供应商负责人:</td>
                <td><input name="proContact"  class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input name="proPhone" id="productUnit" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>地址:</td>
                <td><input name="proAddress" id="productCount" class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>传真:</td>
                <td><input name="proFax" id="totalPrice" class="easyui-validatebox" required="true"/></td>
            </tr>

        </table>
    </form>
</div>
<div id="userDlgsw" data-height="100px">
    <form id="userFormsw" action="/proupdate.do" method="post">
        <table align="center" style="margin-top: 10px; width: auto;height: auto">
            <tr>
                <td>供应商编号:</td>
                <td><input name="proCode" class="easyui-validatebox" readonly/></td>
            </tr>
            <tr>
                <td>供应商名称:</td>
                <td><input name="proName"  class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>供应商负责人:</td>
                <td><input name="proContact"  class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>电话:</td>
                <td><input name="proPhone"  class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>地址:</td>
                <td><input name="proAddress"  class="easyui-validatebox" required="true"/></td>
            </tr>
            <tr>
                <td>传真:</td>
                <td><input name="proFax"  class="easyui-validatebox" required="true"/></td>
            </tr>

        </table>
    </form>
</div>


</center>
</body>
</html>
