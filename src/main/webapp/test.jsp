<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--测试$.post的作用--%>
    <title>Title</title>
    <script type="text/javascript" src="/egov_002/js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        function doPost() {
            alert("---doPost---");
            $.post("/egov_002/system/user/test",function (data) {
                if (data == 1){
                    window.alert(data);
                }
            })
        }

        function fun1(x) {
            alert(x);
        }

        function fun2() {
            $("#imggg")[0].onclick=function () {
                fun1(666);
            };
        }

        function fun3() {
            $("#imggg")[0].onclick=null;
        }

        function changeImg() {
           /* $("#imgg").attr("src","/egov_002/images/firstPageDisabled.gif");*/
            $("#imgg").css("cursor","pointer");
            $("#imgg").click(function () {
                fun1();
            });
            $("#imgg").attr("disabled",true);
        }
    </script>
</head>
<body>
    <input type="button" value="发送$.post请求" onclick="doPost()"/>
    <br/>
    <br/>
    <input type="button" value="改变图片路径" onclick="changeImg()"/><br/>
    <img id="imgg" src="/egov_002/images/firstPage.gif"/><br/>
    <img id="imgg2" src="/egov_002/images/firstPage.gif" disabled="disabled"/>


    <hr/>
    <br/>
    <br/>
    <br/>
    <img id="imggg" src="/egov_002/images/firstPage.gif"/><br/><br/>
    <input type="button" value="绑定函数" id="btn1" onclick="fun2()"/>&nbsp;&nbsp;
    <input type="button" value="解除绑定" id="btn2" onclick="fun3()"/>
</body>
</html>
