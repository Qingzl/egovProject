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
  function Fun1(id1,id2) {
    /*正则表达式验证输入的为非零正整数*/
    var reg = /^\+?[1-9][0-9]*$/;
    var inputEle = $("#"+id1);
    var fontEle = $("#"+id2);
    if (!reg.test(inputEle.val().trim())){
      fontEle.text("数据无效");
    }
    if (inputEle[0].name == "regcapinv"){
      var sum = 0;
      var outsum = 0;
      var ctyNames = $(".ctyName_class");
      $.each($(".regcapinv_class"),function (i,e) {
        var v = e.value.trim();
        if (reg.test(v)){
          sum=parseInt(sum)+parseInt(v);
          if ("中国"!=ctyNames[i].innerText){
            outsum=parseInt(outsum)+parseInt(v);
          }
        }
      })
      $("#regcap_id").val(sum!=0?sum:"");
      $("#outregcap_id").val(outsum!=0?outsum:"");
    if (sum != 0 && outsum != 0){
      $("#outScale").text((outsum/sum*100).toFixed(2)+"%");
    }
    }


  }
  function Fun2(id1,id2) {
    var inputEle = $("#"+id1);
    var fontEle = $("#"+id2);
    if (fontEle.text().length > 1){
      fontEle.text("*");
    }


  }


  function addNewline(invregnum,invname,ctyName) {
    /*判断 投资人编号 是否已经存在于表格行中*/
    var hiddens = $(".irn");
    var array = new Array();
    var isexist = false;
    $.each(hiddens,function (i,e) {
      array[i] = e.value;
    })
    $.each(array,function (i,e) {
      if (invregnum == e){
        isexist = true;
      }
    })

    if (!isexist){
      $("#table_id").append("<tr id='tr"+invregnum+"'></tr>");
      $("#tr"+invregnum).append("<td width=\"20%\" bgcolor=\"#FFFFFF\" height=\"20\" class=\"STYLE1\"><div align=\"center\" style=\"padding:5px\" class=\"STYLE2 STYLE1\"><input type='hidden' name='invregnum' class='irn' value='"+invregnum+"'/>"+invname+
              "</div></td>").append("<td width=\"20%\" bgcolor=\"#FFFFFF\" class=\"STYLE1\"><div class='ctyName_class' align=\"center\" style=\"padding:2px\" class=\"STYLE2\">"+ctyName+
              "</div></td>\n").append("<td width=\"20%\" bgcolor=\"#FFFFFF\" class=\"STYLE1\"><div align=\"center\" style=\"padding:5px\" class=\"STYLE2 STYLE1\"><input class='regcapinv_class' type=\"text\" " +
              "name=\"regcapinv\" id='it"+invregnum+"' onblur='Fun1(\"it"+invregnum+"\",\"ft"+invregnum+"\")' onfocus='Fun2(\"it"+invregnum+"\",\"ft"+invregnum+"\")' style=\"width:90px; height:20px; border:solid 1px #035551; color:#000000\"><font id='ft"+invregnum+"' color=\"red\">*</font></div></td>").append("<td width=\"20%\" bgcolor=\"#FFFFFF\" " +
              "class=\"STYLE1\"><div align=\"center\" style=\"padding:2px\" class=\"STYLE2\"><input class='scale_class' type=\"text\" name=\"scale\" id='2it"+invregnum+"' onblur='Fun1(\"2it"+invregnum+"\",\"2ft"+invregnum+"\")' onfocus='Fun2(\"2it"+invregnum+"\",\"2ft"+invregnum+"\")' style=\"width:90px; height:20px; border:solid 1px #035551; " +
              "color:#000000\"><font id='2ft"+invregnum+"' color=\"red\">*</font></div></td>").append("<td width=\"20%\" bgcolor=\"#FFFFFF\" class=\"STYLE1\"><div align=\"center\" style=\"padding:2px\" " +
              "class=\"STYLE2\"><img src=\"../images/delete.jpg\" onclick='$(\"#tr"+invregnum+"\").remove();'/></div></td>");
    }

  }

  $(function () {
    var formItems = [new formItem("外汇登记证号","regno_id","regno_font"),new formItem("企业中文名称","cnname_id","cnname_font"),new formItem("注册资本","regcap_id","regcap_font"),new formItem("外方注册资本","outregcap_id","outregcap_font"),new formItem("注册币种","regcry_id","regcry_font")];
    cfi.onAllFormItem(formItems);
  });

  function insertEn() {
    $("#enForm").submit();
  }

</script>
</head>

<body>
<form id="enForm" action="/egov_002/en/add" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">新设外商企业登记-录入</span></td>
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
          <tr>
            <td width="100" height="26" class="STYLE1" colspan="4"><div align="center" style="padding:5px" class="STYLE2 STYLE1"><font color="#FFFFFF"><B>企业基本信息</B></font></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">组织机构代码:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="hidden" name="orgcode" value="<%=request.getParameter("orgcode")%>"><%=request.getParameter("orgcode")%></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">外汇登记证号:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="regno_id" type="text" name="regno" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font id="regno_font" color="red">*</font></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">企业中文名称:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="cnname_id" type="text" name="cnname" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font id="cnname_font" color="red">*</font></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">企业英文名称:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="enname" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">联系人:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="contactman" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">联系电话:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input type="text" name="contacttel" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"></div></td>
          </tr>
          <tr>
            <td width="100" height="26" class="STYLE1" colspan="4"><div align="center" width="100%" style="padding:5px" class="STYLE2 STYLE1"><font color="#FFFFFF"><B>企业资金情况信息</B></font></div></td>
          </tr>        
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">注册资本:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="regcap_id" type="text" name="regcap" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font id="regcap_font" color="red">*</font></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">注册币种:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2">
		      <select id="regcry_id" name="regcry" style="WIDTH:100px">
		        <option value=""></option>
		        <option value="000">人名币</option>
		        <option value="001">美元</option>
		        <option value="002">日元</option>
		        <option value="003">欧元</option>
		      </select> <font id="regcry_font" color="red">*</font></div></td>
          </tr>
          <tr>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">外方注册资本:</div></td>
            <td width="250" bgcolor="#FFFFFF" class="STYLE1"><div align="left" style="padding:2px" class="STYLE2"><input id="outregcap_id" type="text" name="outregcap" style="width:150px; height:20px; border:solid 1px #035551; color:#000000"><font id="outregcap_font" color="red">*</font></div></td>
            <td width="100" bgcolor="#FFFFFF" height="26" class="STYLE1"><div align="right" style="padding:5px" class="STYLE2 STYLE1">外方出资比例:</div></td>
            <td bgcolor="#FFFFFF" class="STYLE1"><div id='outScale' align="left" style="padding:2px" class="STYLE2">0%</div></td>
          </tr>
          <tr>
            <td width="100" height="26" class="STYLE1" colspan="4"><div align="center" style="padding:5px" class="STYLE2 STYLE1"><font color="#FFFFFF"><B>投资者资金及利润分配</B></font></div></td>
          </tr> 
          <tr>
            <td width="100%" bgcolor="#FFFFFF" class="STYLE1" colspan="4">
                <table border="0" width="100%" height="100%" cellpadding="0" cellspacing="1" bgcolor="#0e6f68">
		          <tr>
		            <td width="20%" bgcolor="#CCCCCC" height="20" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1">投资者名称</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2">国别</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:5px" class="STYLE2 STYLE1">注册资本出资额</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2">利润分配比例</div></td>
		            <td width="20%" bgcolor="#CCCCCC" class="STYLE1"><div align="center" style="padding:2px" class="STYLE2"><img src="../images/query.jpg" onclick="window.open('orgcodeSelect.jsp', '选择组织机构代码', 'width=720, height=400, scrollbars=no')"/></div></td>
		          </tr>
		          <tbody id="table_id">


                  </tbody>
                </table>
            </td>
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
          <tr height="30"><td bgcolor="#FFFFFF" height="30" class="STYLE1" colspan="2" align="center"><img src="../images/ok.jpg" style="cursor: pointer" onclick="insertEn()"/>&nbsp;&nbsp;<img src="../images/back.jpg" style="cursor:pointer" onclick="document.location='newInputOrg.jsp'"/></td></tr>
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
