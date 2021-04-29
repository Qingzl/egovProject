<%@ page import="com.javalearning.entity.system.User" %>
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
  <script type="text/javascript" src="/egov_002/js/egov.js"></script>
  <script>
   $(function () {
      var userJson = ${param.userJson};
      $("#div_id").text(userJson.usercode);
      $("#username_id").val(userJson.username);
      $("#userpswd_id").val(userJson.userpswd);
      $("#checkpswd_id").val(userJson.userpswd);
      $("#orgtype_id").val(userJson.orgtype);
      $("#hiddenInput").val(userJson.usercode);
    })

   /*功能：表单校验*/
   var formItem1 = new formItem("用户姓名","username_id","username_font");
   var formItem2 = new formItem("机构类型","orgtype_id","orgtype_font");
   var formItem3 = new formItem("用户密码","userpswd_id","userpswd_font");
   var formItem4 = new formItem("确认密码","checkpswd_id","checkpswd_font");
   $(function () {
     var formItem12 = [formItem1,formItem2];
     var formItem34 = [formItem3,formItem4];
     cfi.onAllFormItem(formItem12);
     cfi.onAllFormItem(formItem34);
   })

   function goUserUpdate() {
     var formItem1234 = [formItem1,formItem2,formItem3,formItem4];
     if (cfi.checkForm(formItem1234)){
       $("#updateForm").submit();
     }

   }

  </script>
</head>

<body>
<form id="updateForm" action="/egov_002/system/user/update" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">修改系统用户</span></td>
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

        <td bgcolor="#f3ffe3">
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
              <tr height="26"></tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户代码</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div id="div_id" align="left" style="padding:2px" class="STYLE2"></div><input id="hiddenInput" type="hidden" name="usercode"/></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户姓名</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="username_id" type="text" name="username" style="width:100px; height:20px; border:solid 1px #035551; color:#000000" >&nbsp;<font id="username_font" color='red'>*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">用户密码</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="userpswd_id" type="password" name="userpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font id="userpswd_font" color='red'>*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">确认密码</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="checkpswd_id" type="password" name="checkpswd" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">&nbsp;<font id="checkpswd_font" color='red'>*</font></div></td>
              </tr>
              <tr>
                <td width="200" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">机构类型</div></td>
                <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
                  <select id="orgtype_id" name="orgtype" style="width:105px; height:20px; border:solid 1px #035551; color:#000000">
                    <option value=""></option>
                    <option value="0">外汇管理局</option>
                    <option value="1">银行</option>
                  </select>&nbsp;<font id="orgtype_font" color='red'>*</font></div>
                </td>
              </tr>
            </table>
        </td>
        <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
          <tr height="26"><td bgcolor="#FFFFFF" height="26" class="STYLE1" colspan="2" style="padding-top:5px;padding-left:200px"><img src="../images/save.jpg" style="cursor:hand" onclick="goUserUpdate()" />&nbsp;&nbsp;<img src="../images/clear.jpg" style="cursor:hand" /></td></tr>
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
