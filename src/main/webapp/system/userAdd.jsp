<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}

-->
</style>

  <script type="text/javascript" src="/egov_002/js/jquery-3.5.1.js"></script>
  <script type="text/javascript">
    $(function () {
      var usercodeEle = $("#usercode_id");
      var ucFontEle = $("#usercode_font");
      usercodeEle.blur(function () {
        if (usercodeEle.val().trim().length==0){
          ucFontEle.text("用户代码不能为空！");
        }else {
          var usercodeValue = usercodeEle.val();
          $.post("/egov_002/system/user/queryUserByAjax",
                  {"usercode":usercodeValue},
                  function (data) {
                    if (data == 1){
                      ucFontEle.text("用户代码已存在");
                    }else{
                      ucFontEle.text("*");
                    }
                  }
          )
        }
      })
      usercodeEle.focus(function () {
        if (ucFontEle.text().length>1){
          if (ucFontEle.text() != "用户代码已存在"){
            usercodeEle.val("");
            ucFontEle.text("*");
          }
        }
      })

      $("#saveImg").click(function () {

        $("#usercode_id").focus();
        $("#usercode_id").blur();

        $("#username_id").focus();
        $("#username_id").blur();

        $("#userpswd_id").focus();
        $("#userpswd_id").blur();

        $("#checkpswd_id").focus();
        $("#checkpswd_id").blur();

        var v1 = $("#usercode_font").text().length;
        var v2 = $("#username_font").text().length;
        var v3 = $("#userpswd_font").text().length;
        var v4 = $("#checkpswd_font").text().length;
        if (v1==1&&v2==1&&v3==1&&v4==1){
          $("#form_id").submit();
        }
      })
    })

    usernameFun = function(){
      if ($("#username_id").val().trim().length==0){
        $("#username_font").text("用户姓名不能为空！");
      }
    }
    usernameFun1 = function(){
      if ($("#username_font").text().length>1){
        $("#username_id").val("");
        $("#username_font").text("*");
      }
    }

    userpswdFun1 = function(){
      if ($("#userpswd_id").val().trim().length==0){
        $("#userpswd_font").text("密码不能为空！");
      }
      if ($("#checkpswd_id").val().trim() != $("#userpswd_id").val().trim()){
        $("#checkpswd_font").text("密码不一致！");
      }
    }
    userpswdFun2 = function(){
      if ($("#userpswd_font").text().length>1){
        $("#userpswd_id").val("");
        $("#userpswd_font").text("*");
      }
    }

    checkpswdFun1 = function(){
      if ($("#checkpswd_id").val().trim() != $("#userpswd_id").val().trim()){
        $("#checkpswd_font").text("密码不一致！");
      }
    }
    checkpswdFun2 = function(){
      if ($("#checkpswd_font").text().length>1){
        $("#checkpswd_font").text("*");
      }
    }
  </script>
</head>

<body>
  <form action="/egov_002/system/user/add" method="post" id="form_id">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
            <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">新增系统用户</span></td>
            <td width="281" background="../images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            </table></td>
            <td width="14"><img src="../images/tab_07.gif" width="14" height="30" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9" background="../images/tab_12.gif">&nbsp;</td>
            <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
              <tr height="26"></tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户代码</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="usercode" id="usercode_id" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font color='red' id="usercode_font">*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户姓名</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="username" id="username_id" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" onblur="usernameFun()" onfocus="usernameFun1()"/>&nbsp;<font color='red' id="username_font">*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户密码</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="password" name="userpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"id="userpswd_id" onblur="userpswdFun1()" onfocus="userpswdFun2()">&nbsp;<font id="userpswd_font" color='red'>*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">确认密码</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="password" name="checkpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" id="checkpswd_id" onblur="checkpswdFun1()" onfocus="checkpswdFun2()">&nbsp;<font id="checkpswd_font" color='red'>*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">机构类型</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                <select name="orgtype" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                  <option value=""></option>
                  <option value="0">外汇管理局</option>
                  <option value="1">银行</option>
                </select>&nbsp;<font color='red'>*</font></div></td>
              </tr>
            </table></td>
            <td width="9" background="../images/tab_16.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="9" background="../images/tab_12.gif">&nbsp;</td>
            <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
              <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px"><img src="../images/save.jpg" style="cursor:pointer" id="saveImg" />&nbsp;&nbsp;<img src="../images/clear.jpg" style="cursor:hand" /></td></tr>
            </table></td>
            <td width="9" background="../images/tab_16.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15" height="29"><img src="../images/tab_20.gif" width="15" height="29" /></td>
            <td background="../images/tab_21.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="75%" valign="top" class="STYLE1"><div align="left">
                  <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="62" height="22" valign="middle"></td>
                      <td width="50" height="22" valign="middle"></td>
                    </tr>
                  </table>
                </div></td>
              </tr>
            </table></td>
            <td width="14"><img src="../images/tab_22.gif" width="14" height="29" /></td>
          </tr>
        </table></td>
      </tr>
    </table>
  </form>
</body>
</html>
