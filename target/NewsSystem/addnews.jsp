<%--
  Created by IntelliJ IDEA.
  User: sunbin
  Date: 2017/11/8
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<html>
<head>
    <title>title</title>
</head>
<body>

<script type="text/javascript" src="/ueditor.config.js"></script>
<script type="text/javascript" src="/ueditor.all.js"></script>
<link rel="stylesheet" href="/themes/default/css/ueditor.css">
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
        src="/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    UE.getEditor("container");
    UE.getEditor("container2");
</script>
<style type="text/css">
    .shade {
        position: absolute;
        display: none;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        background: rgba(0, 0, 0, 0.55);
    }

    .shade div {
        width: 300px;
        height: 200px;
        line-height: 200px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -100px;
        margin-left: -150px;
        background: white;
        border-radius: 5px;
        text-align: center;
    }

    .a-upload {
        padding: 4px 10px;
        height: 20px;
        line-height: 20px;
        position: relative;
        cursor: pointer;
        color: #888;
        background: #fafafa;
        border: 1px solid #ddd;
        border-radius: 4px;
        overflow: hidden;
        display: inline-block;
        *display: inline;
        *zoom: 1
    }

    .a-upload input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
        filter: alpha(opacity=0);
        cursor: pointer
    }

    .a-upload:hover {
        color: #444;
        background: #eee;
        border-color: #ccc;
        text-decoration: none
    }
    .img_div{min-height: 100px; min-width: 100px;}
    .isImg{width: 120px; height: 120px; position: relative; float: left; margin-left: 10px;}
    .removeBtn{position: absolute; top: 0; right: 0; z-index: 11; border: 0px; border-radius: 50px; background: red; width: 22px; height: 22px; color: white;}
    .shadeImg{position: absolute;
        display: none;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 15;
        text-align: center;
        background: rgba(0, 0, 0, 0.55);}
    .showImg{width: 400px; height: 500px; margin-top: 140px;}

</style>
<script type="text/javascript">
    function ts() {
        var img_div = $(".img_div");
      var ss=  $("input[name='img']").val($("#5").text());

        alert(ss);
        var filepath =  ss;
        for (var i = 0; i < this.files.length; i++) {
            alert(filepath);
          var  objUrls = getObjectURL(this.files[i]);

            var extStart = filepath.lastIndexOf(".");
            var ext = filepath.substring(extStart, filepath.length).toUpperCase();

            /*
             作者：z@qq.com
             时间：2016-12-10
             描述：鉴定每个图片上传尾椎限制
             * */
            if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                $(".shade").fadeIn(500);
                $(".text_span").text("图片限于bmp,png,gif,jpeg,jpg格式");
                this.value = "";
                $(".img_div").html("");
                return false;
            } else {
                /*
                 若规则全部通过则在此提交url到后台数据库
                 * */
                alert(1111);
              var  img_html = "<div class='isImg'><img src='" + objUrls + "' onclick='javascript:lookBigImg(this)' style='height: 100%; width: 100%;' /><button class='removeBtn' onclick='javascript:removeImg(this)'>x</button></div>";
                img_div.append(img_html);
            }
        }
    }
    var curValue;
       $(function () {
           alert($("#4").text())
           $("input[name='img']").val()
                if($("#4").text()=="fabu"){
                    $("#ff").form("load", "/update.do?id="+$("#3").text());
                    ts();
                }else if($("#4").text()=="caogao") {

                    $("#ff").form("load", "/update.do?id="+$("#3").text());
                    ts();
                }
           $("#groupCombobox").combobox({
               onSelect: function () {

                  curValue = $('#groupCombobox').combobox('getValue');

                   $("#titles").css("color",curValue);
               }
           })
       })
</script>
<script type="text/javascript">
    var urls="";
    $(function() {
        var objUrl;
        var img_html;
        $("#myFile").change(function() {
            var img_div = $(".img_div");

            var filepath = $("input[name='img']").val();

            for(var i = 0; i < this.files.length; i++) {

                objUrl = getObjectURL(this.files[i]);
                urls+=","+objUrl;
                var extStart = filepath.lastIndexOf(".");
                var ext = filepath.substring(extStart, filepath.length).toUpperCase();
                /*
                 作者：z@qq.com
                 时间：2016-12-10
                 描述：鉴定每个图片上传尾椎限制
                 * */
                if(ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                    $(".shade").fadeIn(500);
                    $(".text_span").text("图片限于bmp,png,gif,jpeg,jpg格式");
                    this.value = "";
                    $(".img_div").html("");
                    return false;
                } else {
                    /*
                     若规则全部通过则在此提交url到后台数据库
                     * */
                    img_html = "<div class='isImg'><img src='" + objUrl + "' onclick='javascript:lookBigImg(this)' style='height: 100%; width: 100%;' /><button class='removeBtn' onclick='javascript:removeImg(this)'>x</button></div>";
                    img_div.append(img_html);
                }
                alert(urls);

            }
            /*
             作者：z@qq.com
             时间：2016-12-10
             描述：鉴定每个图片大小总和
             * */
            var file_size = 0;
            var all_size = 0;
            for(j = 0; j < this.files.length; j++) {
                file_size = this.files[j].size;
                all_size = all_size + this.files[j].size;
                var size = all_size / 1024;
                if(size > 500) {
                    $(".shade").fadeIn(500);
                    $(".text_span").text("上传的图片大小不能超过100k！");
                    this.value = "";
                    $(".img_div").html("");
                    return false;
                }
            }
            /*
             作者：z@qq.com
             时间：2016-12-10
             描述：鉴定每个图片宽高 以后会做优化 多个图片的宽高 暂时隐藏掉 想看效果可以取消注释就行
             * */
            //					var img = new Image();
            //					img.src = objUrl;
            //					img.onload = function() {
            //						if (img.width > 100 && img.height > 100) {
            //							alert("图片宽高不能大于一百");
            //							$("#myFile").val("");
            //							$(".img_div").html("");
            //							return false;
            //						}
            //					}
            return true;
        });
        /*
         作者：z@qq.com
         时间：2016-12-10
         描述：鉴定每个浏览器上传图片url 目前没有合并到Ie
         * */
        function getObjectURL(file) {
            var url = null;
            if(window.createObjectURL != undefined) { // basic
                url = window.createObjectURL(file);
            } else if(window.URL != undefined) { // mozilla(firefox)
                url = window.URL.createObjectURL(file);
            } else if(window.webkitURL != undefined) { // webkit or chrome
                url = window.webkitURL.createObjectURL(file);
            }
            //console.log(url);

            return url;
        }
    });
    /*
     作者：z@qq.com
     时间：2016-12-10
     描述：上传图片附带删除 再次地方可以加上一个ajax进行提交到后台进行删除
     * */
    function removeImg(r){
        $(r).parent().remove();


    }
    /*
     作者：z@qq.com
     时间：2016-12-10
     描述：上传图片附带放大查看处理
     * */
    function lookBigImg(b){
        $(".shadeImg").fadeIn(500);
        $(".showImg").attr("src",$(b).attr("src"))
    }
    /*
     作者：z@qq.com
     时间：2016-12-10
     描述：关闭弹出层
     * */
    function closeShade(){

        $(".shade").fadeOut(500);
    }
    /*
     作者：z@qq.com
     时间：2016-12-10
     描述：关闭弹出层
     * */
    function closeShadeImg(){

        $(".shadeImg").fadeOut(500);
    }
    var stutas=0;
   function fun(text) {
         if($("#4").text()==5){
             $('#ff').form({
                 url:"/updatenewsno.do?img="+$("input[name='img']").val()+"&stutas="+stutas+"&titlecolor="+curValue+"&id="+$("#3").text(),
                 onSubmit: function(){

                     // do some check
                     // return false to prevent submit;
                 },
                 success:function(data){    // 表单提交成功后的回调函数

                     //console.debug(data);
                     // 由于easyui-form提交,返回的都是字符串,所以需要转换
                     var rs = $.parseJSON(data);

                     // 判断响应内容,操作是否成功
                     alert(rs);
                     // 成功提示
                     if(rs==1) {
                         $.messager.alert("提示", "保存用户成功!!", "info", function () {

                         });
                     }
                 }
             });
             $("#ff").submit();
         }else if($("#4").text()==1){
             $.messager.alert("提示","发布的新闻不能修改!!","info");
         }else {
             if (text == "暂存草稿") {
                 $("#4").text(5)

             } else if (text == "保存") {
                 $("#4").text(1)
             }
             $('#ff').form({
                 url:"/addnews.do?st="+$('#4').text()+"&titlecolor="+$("#groupCombobox").val(),
                 onSubmit: function(){

                     // do some check
                     // return false to prevent submit;
                 },
                 success:function(data){    // 表单提交成功后的回调函数

                     //console.debug(data);
                     // 由于easyui-form提交,返回的都是字符串,所以需要转换
                     var rs = $.parseJSON(data);

                     // 判断响应内容,操作是否成功
                     alert(rs);
                     // 成功提示
                     if(rs==1) {
                         $.messager.alert("提示", "保存用户成功!!", "info", function () {

                         });
                     }
                 }
             });
             $("#ff").submit();
         }
   }


</script>

<div class="easyui-panel" title="详细信息"  layout="fit" >
  <center> <form id="ff" method="post" action="/addlist.do" >
        <table cellpadding="5" style="width:100% ;align-content:center">
            <tr>
                <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;所属栏目:</td>
                <td>
                    <select class="easyui-combobox" name="typeid"><option value="1">国内新闻</option><option value="2">国际新闻</option></select>
                </td>
                <td>是否有会员限制:</td>
                <td><select class="easyui-combobox" name="huiyuan"><option value="1">有</option><option value="2">无</option></select></td>


            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章标题:</td>
                <td><input id="titles" class="easyui-textbox" name="title" data-options="required:true"></input></td>
                <td>权重:</td>
                <td> <input class="easyui-textbox"  name="quanzhong" data-options="required:true"></input></td>
                      </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题颜色:</td>
                <td> <select id="groupCombobox" class="easyui-combobox" name="titlecolor"  ><option value="red">红色</option><option value="blue">蓝色</option><option value="yellow">黄色</option>
                    <option style="color: #00ee00" value="#00ee00">绿色</option> <option style="color: #222222" value="#222222">黑色</option></select></td>
                <td>关键词:</td>
                <td><input class="easyui-textbox" type="text" name="selectword" data-options="required:true"></input></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发文机关:</td>
                <td><input class="easyui-textbox" type="text" name="job" data-options="required:true"></input></td>
            </tr>
           <tr>
               <td colspan="4">   <hr></td>
           </tr>
           <tr>
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章图片(最多四张):</td>
               <td>
                   <div class="img_div">
                   </div>
                   <a href="javascript:;" class="a-upload">
                       <input type="file" name="img" id="myFile" multiple="multiple">点击这里上传文件
                   </a>
                   <div class="shade" onclick="javascript:closeShade()">
                       <div class="">
		<span class="text_span">

		</span>
                       </div>
                   </div>
                   <div class="shadeImg" onclick="javascript:closeShadeImg()">
                       <div class="">
                           <img class="showImg" src="">
                       </div>
                   </div>
               </td>
           </tr>
            <tr>
                    </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;摘要:</td>
                <td><textarea id="container" name="contextone"
                              style="width: 800px; height: 200px; margin: 0 auto;"></textarea></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;内容:</td>
                <td><textarea id="container2" name="context"
                              style="width: 800px; height: 200px; margin: 0 auto;"></textarea></td>
            </tr>
        </table>
    </form>
  </center>


    <div>
      <center> <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:70px" onclick="fun(this.text)" >保存</a>
         <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:140px" onclick="fun(this.text)" >暂存草稿</a></center>
    </div>
    <p id="3" hidden>${param.id}</p>
    <p id="4" hidden>${param.status}</p>
    <p id="5" hidden>${param.img}</p>
</div>
</body>
</html>
