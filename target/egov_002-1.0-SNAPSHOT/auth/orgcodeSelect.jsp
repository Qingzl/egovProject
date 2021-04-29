<%@ page import="com.javalearning.entity.system.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="../clander/date.js"></script>
<script type="text/javascript" src="../clander/setday.js"></script>
<script>document.onclick=function() {}</script>
<title>外商投资企业选择</title>
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
<script>
  var totalPage = 0;
  function pageQueryEn(pageno) {
    var orgcodeValue = $("#orgcode_id").val().trim();
    var cnnameValue = $("#cnname_id").val().trim();
    var startdateValue = $("#startdate_id").val().trim();
    var enddateValue = $("#enddate_id").val().trim();
    if (startdateValue != "" && enddateValue != "" && startdateValue > enddateValue){
      alert("登记日期范围错误，请重新填写");
      return;
    }
    $.post(
         "/egov_002/en/pagequery",
          {"orgcode":orgcodeValue,"cnname":cnnameValue,"startdate":startdateValue,"enddate":enddateValue,"pageno":pageno},
          function (data) {
            if (data != null){
              totalPage = data.totalpage;
              $("#dataTableBody").empty();
              $.each(data.invs,function (i,e) {
                $("#dataTableBody").append("<tr id='tr"+e.orgcode+"'></tr>");
                $("#tr"+e.orgcode).append("<td height=\"18\" bgcolor=\"#FFFFFF\" class=\"STYLE2\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+(i+1+(pageno-1)*data.pagesize)+
                  "</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\" style=\"cursor:pointer\" onclick=\"window.opener.setOrgcode('"+e.orgcode+"');window.close();\">"+
                  e.orgcode+"</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+
                  e.cnname+"</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+
                  e.regdate+"</div></td>").append(" <td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\" " +
                  "><%=((User)session.getAttribute("user")).getUsername()%></div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">详细</div></td>");
              });

              $("#nowrap_span").text("共"+data.totalsize+"条纪录，当前第"+pageno+"/"+totalPage+"页，每页"+data.pagesize+"条纪录");

              var isNotFirstPage = pageno > 1;
              var isNotLastPage = pageno < totalPage;
              $("#img1").attr("src","../images/firstPage"+(isNotFirstPage?"":"Disabled")+".gif");
              $("#img1").css("cursor",(isNotFirstPage?"pointer":""));
              $("#img1")[0].onclick=(isNotFirstPage?function () {pageQueryEn(1)}:null);

              $("#img2").attr("src","../images/prevPage"+(isNotFirstPage?"":"Disabled")+".gif");
              $("#img2").css("cursor",(isNotFirstPage?"pointer":""));
              $("#img2")[0].onclick=(isNotFirstPage?function () {pageQueryEn(pageno-1)}:null);

              $("#img3").attr("src","../images/nextPage"+(isNotLastPage?"":"Disabled")+".gif");
              $("#img3").css("cursor",(isNotLastPage?"pointer":""));
              $("#img3")[0].onclick=(isNotLastPage?function () {pageQueryEn(pageno+1)}:null);

              $("#img4").attr("src","../images/lastPage"+(isNotLastPage?"":"Disabled")+".gif");
              $("#img4").css("cursor",(isNotLastPage?"pointer":""));
              $("#img4")[0].onclick=(isNotLastPage?function () {pageQueryEn(totalPage)}:null);

            }
          }
    );
  }

  function clearV() {
    $("#orgcode_id").val("");
    $("#cnname_id").val("");
    $("#startdate_id").val("");
    $("#enddate_id").val("");
  }

  function gopage() {
    var v = $("#textfield_id").val().trim();
    if (v >= 1 && v <= totalPage){
      pageQueryEn(v);
    }
  }



</script>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">外商投资企业列表</span></td>
        <td width="281" background="../images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="14"><img src="../images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr height="5">
          <td width="9" background="../images/tab_12.gif">&nbsp;</td>
          <td bgcolor="#f3ffe3">&nbsp;</td>
          <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
      <tr>
        <td width="9" background="../images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3">
        	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
        	    <tr>
        	        <td width="120" class="STYLE1">组织机构代码:</td>
        	        <td width="140" class="STYLE1"><input id="orgcode_id" type="text" name="orgcode" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
        	        <td width="90" class="STYLE1">企业中文名称:</td>
        	        <td width="130" class="STYLE1" ><input id="cnname_id" type="text" name="cnname" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
				    <td width="60"  nowrap class="STYLE1">登记日期:</td>
				    <td class="class1_td alignleft" nowrap>
				        <input id="startdate_id" type="text" name="startdate" style="width:75px; height:20px; border:solid 1px #035551; color:#000000" >
				        <input onclick="setday(document.all.startdate);" type="image" value=" 选择日期 " name="button004" src="../clander/clander.gif" align="top"/>
				  ～
				  <input type="text" id="enddate_id" name="enddate" style="width:75px; height:20px; border:solid 1px #035551; color:#000000" >
				  <input onclick="setday(document.all.enddate);" type="image" value=" 选择日期 " name="button004" src="../clander/clander.gif" align="top"/>
				      </td> 
        	    </tr>
        	    <tr>
        	        <td class="STYLE1" colspan="5" align="left"></td>
        	        <td nowrap class="STYLE1" align="right"><button style="width:68px;height:27px;cursor: pointer" onclick="pageQueryEn(1)" ><img src="../images/query.jpg" /></button>&nbsp;&nbsp;<button style="width:68px;height:27px;cursor:pointer" onclick="clearV()"><img src="../images/clear.jpg" /></button>&nbsp;&nbsp;</td>
        	    </tr>
        	</table>
        </td>
        <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
      <tr height="10">
          <td width="9" background="../images/tab_12.gif">&nbsp;</td>
          <td bgcolor="#f3ffe3">&nbsp;</td>
          <td width="9" background="../images/tab_16.gif">&nbsp;</td>
      </tr>
  </table>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" id="dataTable" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
        <thead class="class1_thead">
          <tr>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
            <td width="20%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">组织机构代码</div></td>
            <td width="24%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">企业中文名称</div></td>
            <td width="10%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">登记日期</div></td>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">经办人</div></td>
            <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">投资比例</div></td>
          </tr>
          </thead>
          <tbody id="dataTableBody">

          </tbody>
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
            <td width="25%" height="29" nowrap="nowrap"><span id="nowrap_span" class="STYLE1">共3条纪录，当前第1/1页，每页3条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="30" height="22" valign="middle"><div align="right"><img id="img1" src="../images/firstPageDisabled.gif" /></div></td>
                  <td width="30" height="22" valign="middle"><div align="right"><img id="img2" src="../images/prevPageDisabled.gif"  /></div></td>
                  <td width="30" height="22" valign="middle"><div align="right"><img id="img3" src="../images/nextPageDisabled.gif" /></div></td>
                  <td width="30" height="22" valign="middle"><div align="right"><img id="img4" src="../images/lastPageDisabled.gif" /></div></td>
                  <td width="59" height="22" valign="middle"><div align="right" class="STYLE2 STYLE1">转到第</div></td>
                  <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <input id="textfield_id" name="textfield" type="text" class="STYLE1" style="height:20px; width:25px;text-align:right" size="5" />
                  </span></td>
                  <td width="23" height="22" valign="middle" class="STYLE2 STYLE1">页</td>
                  <td width="30" height="22" valign="middle"><img id="imgGo" src="../images/go.gif" width="37" height="15" onclick="gopage()"/></td>
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
</body>
</html>
