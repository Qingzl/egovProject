<%@ page import="com.javalearning.entity.system.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
  <script type="text/javascript" src="/egov_002/clander/date.js"></script>
  <script type="text/javascript" src="/egov_002/clander/setday.js"></script>
  <script>document.onclick=function() {}</script>
  <title>无标题文档</title>
  <%

  %>
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
  <script type="text/javascript">
    var totalpagee = 0;
    function pageQuery(pageno) {
      var invregnum = $("#invregnum_id").val().trim();
      var invname = $("#invname_id").val().trim();
      var startdate = $("#startdate_id").val().trim();
      var enddate = $("#enddate_id").val().trim();
      $.post(
              "/egov_002/inv/pagequery",
              {"invregnum":invregnum,"invname":invname,"startdate":startdate,"enddate":enddate,"pageno":pageno},
              function (data) {
                if(data != ""){
                  $("#dataTableBody").empty();
                  totalpagee = data.totalpage;
                  var invests = data.invs;
                  /**/
                  $.each(invests,function (i,e) {
                    $("#dataTableBody").append("<tr>").append("<td height=\"18\" bgcolor=\"#FFFFFF\" class=\"STYLE2\"><div align=\"center\" class=\"STYLE2 STYLE1\" style='cursor:pointer;' onclick='window.opener.addNewline("+e.invregnum+",\""+e.invname+"\",\""+rbUtil.getString(e.cty)+"\");'>"+(i+1+(data.pageno-1)*data.pagesize)+"</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\"  style=\"cursor:pointer\" onclick='checkInv("+e.invregnum+")'>"+e.invregnum+
                            "</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+e.invname+"</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+e.regdate+"</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\"><%=((User)session.getAttribute("user")).getUsername()%></div></td></tr>");
                  });

                  /*共3条纪录，当前第1/1页，每页3条纪录*/
                  $("#span_id").text("共"+data.totalsize+"条纪录，当前第"+pageno+"/"+data.totalpage+"页，每页"+data.pagesize+"条纪录");

                  /*翻页功能*/
                  var isNotFirstPage = pageno > 1;
                  var isNotLastPage = pageno < totalpagee;
                  $("#img1").attr("src","../images/firstPage"+(isNotFirstPage?"":"Disabled")+".gif");
                  $("#img1").css("cursor",isNotFirstPage?"pointer":"");
                  $("#img1")[0].onclick= (isNotFirstPage?function () {pageQuery(1)}:null);


                  $("#img2").attr("src","../images/firstPage"+(isNotFirstPage?"":"Disabled")+".gif");
                  $("#img2").css("cursor",isNotFirstPage?"pointer":"");
                  $("#img2")[0].onclick= (isNotFirstPage?function () {pageQuery(pageno-1)}:null);


                  $("#img3").attr("src","../images/nextPage"+(isNotLastPage?"":"Disabled")+".gif");
                  $("#img3").css("cursor",isNotLastPage?"pointer":"");
                  $("#img3")[0].onclick= (isNotLastPage?function () {pageQuery(pageno+1)}:null);


                  $("#img4").attr("src","../images/nextPage"+(isNotLastPage?"":"Disabled")+".gif");
                  $("#img4").css("cursor",isNotLastPage?"pointer":"");
                  $("#img4")[0].onclick= (isNotLastPage?function () {pageQuery(totalpagee)}:null);


                }
              }
      );

    }

    function clearValue() {
      $("#invregnum_id").val("");
      $("#invname_id").val("");
      $("#startdate_id").val("");
      $("#enddate_id").val("");
    }

    function checkInv(invregnum) {
      document.location="/egov_002/inv/check?invregnum="+invregnum;
    }

    /*跳转到指定页面*/
    function gopage() {
      var v = $("#textfield_id").val().trim();
      if (v >= 1 && v <= totalpagee){
        pageQuery(v);
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
        <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">企业投资人信息登记列表</span></td>
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
              <td width="120" class="STYLE1">投资人登记编号:</td>
              <td width="140" class="STYLE1"><input type="text" id="invregnum_id" name="invregnum" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
              <td width="90" class="STYLE1">投资人名称:</td>
              <td width="130" class="STYLE1" ><input type="text" id="invname_id" name="invname" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
              <td width="60"  nowrap class="STYLE1">登记日期:</td>
              <td class="class1_td alignleft" nowrap>
                <input type="text" id="startdate_id" name="startdate" style="width:75px; height:20px; border:solid 1px #035551; color:#000000">
                <input onclick="setday(document.all.startdate);" type="image" value=" 选择日期 " src="../clander/clander.gif" align="top"/>
                ～
                <input type="text" id="enddate_id" name="enddate" style="width:75px; height:20px; border:solid 1px #035551; color:#000000">
                <input onclick="setday(document.all.enddate);" type="image" value=" 选择日期 " src="../clander/clander.gif" align="top"/>
              </td>
            </tr>
            <tr>
              <td class="STYLE1" colspan="5" align="left"></td>
              <td nowrap class="STYLE1" align="right"><img src="../images/query.jpg" style="cursor:pointer" onclick="pageQuery(1)" />&nbsp;&nbsp;<img src="../images/clear.jpg" style="cursor:pointer" onclick="clearValue()"/>&nbsp;&nbsp;</td>
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
        <td bgcolor="#f3ffe3">
          <table width="99%" id="dataTable" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
            <thead>
            <tr>
              <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
              <td width="20%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">投资人登记编号</div></td>
              <td width="24%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">投资人名称</div></td>
              <td width="10%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">登记日期</div></td>
              <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">经办人</div></td>
            </tr>
            </thead>
            <tbody id="dataTableBody">

            </tbody>
          </table>
        </td>
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
            <td width="25%" height="29" nowrap="nowrap"><span id="span_id" class="STYLE1">共0条纪录，当前第0/0页，每页0条纪录</span></td>
            <td width="75%" valign="top" class="STYLE1"><div align="right">
              <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <span id="imgSpan">
                    <td width="30" height="22" valign="middle"><div align="right"><img id="img1" src="../images/firstPageDisabled.gif" /></div></td>
                    <td width="30" height="22" valign="middle"><div align="right"><img id="img2" src="../images/prevPageDisabled.gif"  /></div></td>
                    <td width="30" height="22" valign="middle"><div align="right"><img id="img3" src="../images/nextPageDisabled.gif" /></div></td>
                    <td width="30" height="22" valign="middle"><div align="right"><img id="img4" src="../images/lastPageDisabled.gif" /></div></td>
                  </span>
                  <td width="59" height="22" valign="middle"><div align="right" class="STYLE2 STYLE1">转到第</div></td>
                  <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <input id="textfield_id" name="textfield" type="text" class="STYLE1" style="height:20px; width:25px;text-align:right" size="5" />
                  </span></td>
                  <td width="23" height="22" valign="middle" class="STYLE2 STYLE1">页</td>
                  <td width="30" height="22" valign="middle"><img src="../images/go.gif" width="37" height="15" onclick="gopage()"/></td>
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
