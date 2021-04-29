<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>外汇业务信息管理平台_用户登录</title>
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			overflow:hidden;
		}
		.STYLE1 {
			font-size: 12px;
			color: #a1c8c6;
		}
		.STYLE4 {color: #FFFFFF; font-size: 12px; }
		-->
		</style>

		<script type="text/javascript" src="/egov_002/js/jquery-3.5.1.js"></script>
		<script type="text/javascript" src="/egov_002/js/egov.js"></script>
		<script type="text/javascript">
			function userLogin() {
				var formItems = [new formItem("用户名","usercode_id"),new formItem("密码","userpswd_id"),new formItem("机构类型","orgtype_id")];
				var msg = "";
				$.each(formItems,function (i,e) {
					if ($("#"+e.input_id).val().trim() == ""){
						msg = msg + e.label + "不能为空！ "
					}
				})

				var usercodeValue = $("#usercode_id").val().trim();
				var userpswdValue = $("#userpswd_id").val().trim();
				var orgtypeValue = $("#orgtype_id").val().trim();
				if (msg == ""){
					$.post("/egov_002/login",
							{"usercode":usercodeValue,"userpswd":userpswdValue,"orgtype":orgtypeValue},
							function (data) {
								if (data == 0){
									alert("用户名密码错误！");
								}else{
								    document.location="/egov_002/main.html";
                                }
							}
					);
				}else{
					alert(msg);
				}



			}


		</script>
	</head>
	<body>
		<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr><td bgcolor="035551">&nbsp;</td></tr>
			<tr>
				<td height="311" background="img/login_03.gif">
					<table width="758" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr><td height="210" background="img/login1.jpg">&nbsp;</td></tr>
						<tr>
							<td height="101">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
		            					<td width="446" height="101" background="img/login_06.jpg">&nbsp;</td>
		            					<td width="156">
		            						<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
							                		<td width="40%" height="22"><span class="STYLE4">机构类型</span></td>
							                		<td width="71" height="22">
										            <select id="orgtype_id" name="orgtype" style="width:100px; height:20px; border:solid 1px #035551; color:#000000">
                                                                                          <option value=""></option>
                                                                                          <option value="0">外汇管理局</option>
                                                                                          <option value="1"selected>银行</option>
										            </select>
							                		</td>
							              		</tr>
												<tr>
							                		<td height="22"><span class="STYLE4">用户代码</span></td>
							                		<td width="71" height="22"><input id="usercode_id" type="text" name="usercode" value="1" style="width:100px; height:20px; border:solid 1px #035551; color:#000000"></td>
							              		</tr>
							              		<tr>
							                		<td height="22"><span class="STYLE4">用户密码</span></td>
							                		<td height="22"><input id="userpswd_id" type="password" name="userpswd" value="123" style="width:100px; height:22px; border:solid 1px #035551; color:#000000"></td>
							              		</tr>
							              		<tr>
							                		<td height="25">&nbsp;</td>
							                		<td height="25"><button style="width:40px;height:25px" onclick="userLogin()"><img src="img/login_dl.gif" width="37" height="19" border="0"></button><button style="width:40px;height:25px"><img src="img/login_qx.gif" width="37" height="19"></button></td>
							                	</tr>
											</table>
										</td>
										<td width="156" background="img/login_09.gif">&nbsp;</td>
		          					</tr>
		        				</table>
		        			</td>
		      			</tr>
		    		</table>
		    	</td>
		  	</tr>
		  	<tr>
		    	<td bgcolor="1f7d78">&nbsp;</td>
		  	</tr>
		  	<tr>
		    	<td bgcolor="1f7d78"><div align="center"><span class="STYLE1">-- 北京动力节点 2012 --</span></div></td>
		  	</tr>
		</table>
	</body>
</html>
