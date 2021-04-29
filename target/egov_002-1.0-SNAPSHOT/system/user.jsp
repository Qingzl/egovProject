<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        int pageno =Integer.valueOf(request.getParameter("pageno")) ;
        int pageAmount = Integer.valueOf(request.getParameter("pageAmount"));
        int pagesize = Integer.valueOf(request.getParameter("pagesize"));
        int usersAmount = Integer.valueOf(request.getParameter("usersAmount"));
    %>
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
            var para = ${param.usersJson};
            if (para != null){
                var usersJson = para;
                $("#tbody_id").empty();
                $.each(usersJson,function (index,ele) {
                    var orgtype = ele.orgtype;
                    if (orgtype == ""){
                        orgtype = "系统管理员";
                    }else if (orgtype == 0){
                        orgtype = "外汇管理局";
                    }else {
                        orgtype = "银行";
                    }
                    $("#tbody_id").append("<tr>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE1\"><input name=\"usercode\" type=\"checkbox\" class=\"STYLE2\" value='"+ele.usercode+"' onclick='controlUpdateAndDeleteImage()'/></div>" +
                        "</td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\" class=\"STYLE2\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+(index+1+(<%=pageno%>-1)*<%=pagesize%>)+"</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+ele.usercode+
                        "</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" class=\"STYLE2 STYLE1\">"+ele.username+ "</div></td>").append("<td height=\"18\" bgcolor=\"#FFFFFF\"><div align=\"center\" ><a href=\"#\">"+orgtype+"</a></div></td></tr>");
                })
            }

            controlUpdateAndDeleteImage();
        })

        /*自定义函数必须定义在script脚本块中，不能放在$()中*/
        /*功能：翻页函数*/
        function go(no) {
            document.location="/egov_002/system/user/pagequery?pageno="+no;
        }

        /*功能：跳转到指定页码*/
        function goToPage() {
            var orderPageno = $("#textfield_id").val();
            if (orderPageno >= 1 && orderPageno <= <%=pageAmount%>){
                go(orderPageno);
            }
        }

        /*功能：user.jsp中复选框和修改删除图片按钮的联动*/
        /*功能：取消全选*/
        function controlUpdateAndDeleteImage() {
            var checkedAmount = 0;
            var checkboxAmount = 0;
            var $checkboxs = $(":checkbox:gt(0)");
            $.each($checkboxs,function (index,ele) {
                checkboxAmount = (index + 1);
                if (ele.checked){
                    checkedAmount++;
                }
            })

            var $updateImage = $("#updateIamge_id");
            var $deleteImage = $("#deleteIamge_id");
            if (checkedAmount == 0){
                $updateImage[0].src = "../images/update_disabled.jpg";
                $updateImage[0].disabled = true;
                $deleteImage[0].src = "../images/delete_disabled.jpg";
                $deleteImage[0].disabled = true;
            }else if(checkedAmount == 1){
                $updateImage[0].src = "../images/update.jpg";
                $updateImage[0].disabled = false;
                $deleteImage[0].src = "../images/delete.jpg";
                $deleteImage[0].disabled = false;
            }else{
                $updateImage[0].src = "../images/update_disabled.jpg";
                $updateImage[0].disabled = "true";
                $deleteImage[0].src = "../images/delete.jpg";
                $deleteImage[0].disabled = "false";

            }

            $(":checkbox:eq(0)")[0].checked = checkedAmount == checkboxAmount;
        }

        /*功能：复选框的多选和取消多选*/
        /*全选*/
        function selectAllCheckboxs() {
            var $checkboxs = $(":checkbox:gt(0)");
            $.each($checkboxs,function (index,ele) {
                ele.checked = $(":checkbox:eq(0)")[0].checked;
            })
            controlUpdateAndDeleteImage();
        }

        /*根据用户编码查询用户*/
        function doQueryUserByUsrcode() {
            $("#queryUserByUsercode_form").submit();
        }

        /*删除用户*/
        function goDelete() {
            window.confirm("确认删除吗");
            var $form = $("#queryUserByUsercode_form");
            $form[0].action="/egov_002/system/user/delete";
            $form.submit();
        }
    </script>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15" height="30"><img src="../images/tab_03.gif" width="15" height="30" /></td>
                <td width="1101" background="../images/tab_05.gif"><img src="../images/311.gif" width="16" height="16" /> <span class="STYLE4">系统用户列表</span></td>
                <td width="281" background="../images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="STYLE1"><div align="center"><img src="../images/add.jpg" style="cursor:pointer" onclick="document.location='/egov_002/system/userAdd.jsp'"/></div></td>
                            </tr>
                        </table></td>
                        <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="STYLE1"><div align="center"><input id="updateIamge_id" type="image" src="../images/update_disabled.jpg" style="cursor:pointer" onclick="doQueryUserByUsrcode()"/></div></td>
                            </tr>
                        </table></td>
                        <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="STYLE1"><div align="center"><input type="image" id="deleteIamge_id" src="../images/delete_disabled.jpg" style="cursor:hand" onclick="goDelete()"/></div></td>
                            </tr>
                        </table></td>
                    </tr>
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
                    <form id="queryUserByUsercode_form" action="/egov_002/system/user/queryUserByUsercode" method="post">
                        <input id="inputHidden" type="hidden" name="updatePageno" value="<%=pageno%>"/>
                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#0e6f68" >
                            <tr>
                                <td width="6%" height="26" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1"><input id="firstCheckbox_id" type="checkbox" name="checkbox62" value="checkbox" onclick="selectAllCheckboxs()"/></div></td>
                                <td width="8%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">序号</div></td>
                                <td width="12%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">用户代码</div></td>
                                <td width="24%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">用户姓名</div></td>
                                <td width="38%" height="18" background="../images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">机构类型</div></td>
                            </tr>
                            <tbody id="tbody_id">

                            </tbody>
                        </table>
                    </form>
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
                        <td width="25%" height="29" nowrap="nowrap"><span class="STYLE1">共<%=usersAmount%>条纪录，当前第<%=pageno%>/<%=pageAmount%>页，每页<%=pagesize%>条纪录</span></td>
                        <td width="75%" valign="top" class="STYLE1"><div align="right">
                            <table width="352" height="20" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/firstPage<%=pageno>1 ? "" : "Disabled"%>.gif" <%=pageno>1?"style='cursor:pointer' onclick='go(1)'":""%> /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/prevPage<%=pageno>1 ? "" : "Disabled"%>.gif" <%=pageno>1?"style='cursor:pointer' onclick='go("+(pageno-1)+")'":""%> /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/nextPage<%=pageno < pageAmount ? "" : "Disabled"%>.gif" <%=pageno<pageAmount?"style='cursor:pointer' onclick='go("+(pageno+1)+")'":""%> /></div></td>
                                    <td width="30" height="22" valign="middle"><div align="right"><img src="../images/lastPage<%=pageno < pageAmount ? "" : "Disabled"%>.gif" <%=pageno<pageAmount?"style='cursor:pointer' onclick='go("+pageAmount+")'":""%> /></div></td>
                                    <td width="59" height="22" valign="middle"><div align="right">转到第</div></td>
                                    <td width="25" height="22" valign="middle"><span class="STYLE7">
                    <input id="textfield_id" name="textfield" type="text" class="STYLE1" style="height:14px; width:25px;text-align:right" size="5" />
                  </span></td>
                                    <td width="23" height="22" valign="middle">页</td>
                                    <td width="30" height="22" valign="middle"><img src="../images/go.gif" width="37" height="15" onclick="goToPage()"/></td>
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

