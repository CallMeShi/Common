<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->

<!-- 引入 Bootstrap -->
<link href="${APP_PATH }/static/bootstrap4.1.3/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- 包括所有已编译的插件 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<!-- 		修改员工模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<!-- 					员工名输入栏 -->
						<div class="form-group">
							<label for="input_empName" class="col-sm-3 control-label">员工名</label>
							<div class="col-sm-8">
								<p class="form-control-static" id="empName_update_input">email@example.com</p>
							</div>
							<!-- 							性别选择栏 -->
							<label for="input_gender" class="col-sm-3 control-label">性别</label>
							<div class="col-sm-8">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="男"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="女"> 女
								</label>
							</div>
							</label>
						</div>
						<!-- 						邮箱 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="email_update_input"
									name="email" placeholder="输入您的邮箱"> <span
									class="help-block"></span>
							</div>
						</div>
						<!-- 						部门名 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">所在部门</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_update_select">


								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_Btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 添加员工模态框 -->
	<!-- Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<!-- 					员工名输入栏 -->
						<div class="form-group">
							<label for="input_empName" class="col-sm-3 control-label">员工名</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="empName"
									id="empName_add_input" placeholder="员工姓名"> <span
									class="help-block"></span>
							</div>
							<!-- 							性别选择栏 -->
							<label for="input_gender" class="col-sm-3 control-label">性别</label>
							<div class="col-sm-8">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="男"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="女"> 女
								</label>
							</div>
							</label>
						</div>
						<!-- 						邮箱 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-8">
								<input type="email" class="form-control" id="email_add_input"
									name="email" placeholder="输入您的邮箱"> <span
									class="help-block"></span>
							</div>
						</div>
						<!-- 						部门名 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">所在部门</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_add_select">


								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_Btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 	操作成功模态框 -->
	<div class="modal fade bs-example-modal-sm" id="emp_save_success_modal"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		style="margin-top: 100px;">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<h4 style="text-align: center; color: #0000ff">用户信息保存成功</h4>
			</div>
		</div>
	</div>
	</div>
	<div class="container">
		<!-- 	标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>

		</div>
		<!-- 	按钮 -->
		<div class="row">
			<div class="col-md-3 col-md-offset-3"
				style="margin-left: 80%; padding: 2px;">
				<button class="btn btn-primary" id="emp_add_model_btn">新增</button>
				<button class="btn btn-danger" id="delEmpBtn">删除</button>
			</div>
		</div>
		<!-- 	表格 -->
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-12">
				<table class="table-hover table" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息	数据 -->
		<div class="row">
			<!--  分页文字信息 总记录数，总页码 -->
			<div class="col-md-5" id="page_info_area">
				当前第<span style="color: #0000ff" id="pageNum"></span>页,总共<span
					style="color: #0000ff" id="pages"></span>页,总共有<span
					style="color: #0000ff" id="total"></span>条记录
			</div>

			<div class="col-md-5">
				<nav aria-label="Page navigation" id="page_nav_area">
					<ul class="pagination" id="pageUl">
					</ul>
				</nav>
			</div>


			<div class="form-inline col-md-2">
				<div class="pagination form-group ">
					<input class="form-control"
						style="width: 90px; margin-left: -10px; padding-right: 10px;"
						type="text" min="1" max="${result.extend.pageinfo.pages}"
						id="pageindex" name="pageindex" placeholder="跳转到该页" /> <input
						class="btn btn-danger" type="button" id="selectPageBtn" value="确定" />
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		// 		总记录数
		var totalRecord;
		// 		当前的页码
		var currentPage;
		// 1.页面加载以后，发送Ajax请求，拿到分页数据
// 		选中的盒子数量
		var checkItemBoxNum;
		$(function() {
			to_page(1);

		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH }/emps",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					// 			console.log(result)
					// 			解析并显示员工数据
					build_emps_table(result);
					// 					记录数，页数，当前页
					build_page_info(result);
					// 					数据分页导航栏信息
					build_page_nav(result);

				}
			});
		}

		function build_emps_table(result) {
			// 			清空table 表格
			$("#emps_table tbody").empty();
			var emps = result.extend.pageinfo.list;
			$
					.each(
							emps,
							function(index, item) {
								var checkBoxItemTd = $("<td><input type='checkbox' class='check-item' /></td>");
								var empIdTd = $("<td></td>").append(item.empId);
								var empNameTd = $("<td></td>").append(
										item.empName);
								var genderTd = $("<td></td>").append(
										item.gender == '男' ? '男' : '女');
								var emailTd = $("<td></td>").append(item.email);
								var deptNameTd = $("<td></td>").append(
										item.department.deptName);
								// 				编辑按钮
								var editBtn = $("<Button></Button>")
										.addClass(
												"btn btn-primary btn-sm update-Btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil ")
														.append("编辑"));
								editBtn.attr("update_id", item.empId);
								// 					删除按钮
								var delBtn = $("<Button></Button>")
										.addClass(
												"btn btn-danger btn-sm delete-Btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-trash")
														.append("删除"));
								delBtn.attr("del_id", item.empId);
								// 				将两个按钮合并到一个单元格里
								var BtnTd = $("<td></td>").append(editBtn)
										.append(" ").append(delBtn)

								// 				<button class="btn btn-primary btn-sm">
								// 				<span class="glyphicon glyphicon-pencil "></span> 编辑
								// 			</button>
								// 			<button class="btn btn-danger btn-sm">
								// 				<span class="	glyphicon glyphicon-trash"></span> 删除
								// 			</button>
								$("<tr></tr>").append(checkBoxItemTd).append(
										empIdTd).append(empNameTd).append(
										genderTd).append(emailTd).append(
										deptNameTd).append(BtnTd).appendTo(
										"#emps_table tbody");
							});
		}

		// 		解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area span").empty();

			/* 			$("#page_info_area").append("当前为"+result.extend.pageinfo.pageNum+"页    总共有"
			 +result.extend.pageinfo.pages+"页    总共有"
			 +result.extend.pageinfo.total+"条记录"); */
			$("#pageNum").append(result.extend.pageinfo.pageNum);
			currentPage = result.extend.pageinfo.pageNum;
			$("#pages").append(result.extend.pageinfo.pages);
			$("#total").append(result.extend.pageinfo.total);
			totalRecord = result.extend.pageinfo.total;
		}

		// 		调到指定页面		
		$("#selectPageBtn").click(function() {
			if (pageindex != null) {
				to_page($("#pageindex").val());
				$("#pageindex").val() = null;
			}

		});
		// 		选择的页码

		// 		解析显示分页条
		function build_page_nav(result) {
			// 			page_nav_area
			// 			首页
			$("#pageUl").empty();
			var pageUl = $("#pageUl");
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			// 			首页点击事件
			firstPageLi.click(function() {
				to_page(1);
			});
			// 			前一页
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;").attr("href", "#"));
			if (result.extend.pageinfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}
			// 			前一页点击事件
			prePageLi.click(function() {
				to_page(result.extend.pageinfo.pageNum - 1);
			});
			// 			后一页
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;").attr("href", "#"));
			// 			后一页点击事件
			nextPageLi.click(function() {
				to_page(result.extend.pageinfo.pageNum + 1);
			});

			// 			末页
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			// 			末页点击事件
			lastPageLi.click(function() {
				to_page(result.extend.pageinfo.pages);
			});

			if (result.extend.pageinfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}
			// 			添加首页，前一页在Ul标签中
			pageUl.append(firstPageLi).append(prePageLi);

			$.each(result.extend.pageinfo.navigatepageNums, function(index,
					item) {

				var numLi = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				if (result.extend.pageinfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				pageUl.append(numLi);
			});
			// 			添加下一页，末页在Ul标签中
			pageUl.append(nextPageLi).append(lastPageLi);
		}

		// 		点击新增按钮  重置form表单样式
		function restForm(ele) {
			// 			模态框的表单样式重置
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}

		// 		点击新增按钮新增模态框的事件
		$("#emp_add_model_btn").click(function() {
			restForm($("#empAddModal form"))
			// 			移除保存按钮的属性
			$(this).removeAttr("ajax-validate");
			// 			清空下拉列表
			$("#dept_add_select").empty();
			// 			发送Ajax请求。弹出部门信息。显示在下拉列表中	
			getDepts("#dept_add_select");
			// 			弹出模态框
			$("#empAddModal").modal({
				backdrop : "static"
			});

		});
		// 		查出所有部门信息并显示在下拉列表中
		function getDepts(ele) {
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					// 					dept_add_select
					// 					$("#dept_add_select")
					$.each(result.extend.depts, function() {
						var optionEle = $("<option></option>").append(
								this.deptName).attr("value", this.deptId);

						// 						把列表的每个单元加入到下拉列表中
						optionEle.appendTo(ele);
					});
				}
			});
		}
		// 		校验表单数据
		function validate_add_form() {

			var empName = $("#empName_add_input").val();
			// 			用户名的正则表达式
			var regName = /(^[A-Za-z0-9_-]{6,16}$)|(^[\u4e00-\u9fa5]{1,20}$)/;
			if (!regName.test(empName)) {
				show_validate_msg("#empName_add_input", "error",
						"员工姓名的长度为6-16的英文和数字或者1-20位汉字");

				return false;
			} else {
				show_validate_msg("#empName_add_input", "success", "");

			}
			// 			email的正则表达式

			// 			email_add_input
			var email = $("#email_add_input").val();
			var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");

			}
			return true;
		}
		// 		校验信息的通用方法
		function show_validate_msg(ele, status, msg) {
			// 			清除当前元素的样式
			$(ele).parent().removeClass("has-success has-error");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		// 		效验用户名是否可用   员工名输入框内容发生改变时，监听事件
		$("#empName_add_input").change(
				function() {
					// 			发送Ajax请求用户名是否可用
					var empName = this.value;
					// 			重置保存按钮的属性
					$.ajax({
						url : "${APP_PATH}/checkuser",
						data : "empName=" + empName,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#empName_add_input",
										"success", "用户名可用");
								$("#emp_save_Btn").attr("ajax-validate",
										"success");
							} else {

								if (result.extend.va_msg == "inputerror") {
									show_validate_msg("#empName_add_input",
											"error",
											"员工姓名的长度为6-16的英文和数字或者1-20位汉字");
									$("#emp_save_Btn").attr("ajax-validate",
											"error");
								} else {
									show_validate_msg("#empName_add_input",
											"error", "员工姓名已存在，请重新输入");
									$("#emp_save_Btn").attr("ajax-validate",
											"error");
								}
							}

						}
					});
				});

		// 		为添加员工的模态框中的保存员工按钮绑定监听事件

		$(document)
				.on(
						"click",
						"#emp_save_Btn",
						function() {
							// 			alert($("#empAddModal form").serialize())

							// 			先对要提交的内容交给服务器进行效验
							if (!validate_add_form()) {
								return false;
							}
							// 						验证员工是否存在,如果存在

							if ($(this).attr("ajax-validate") == "error") {
								return false;
							}

							$
									.ajax({
										url : "${APP_PATH}/emp",
										type : "POST",
										// 				数据序列化
										data : $("#empAddModal form")
												.serialize(),
										success : function(result) {
											// 					alert(result.msg);

											// 					如果校验成功  
											if (result.code == 100) {
												//	 					关闭模态框
												$("#empAddModal").modal('hide');
												// 					打开用户保存成功模态框
												$("#emp_save_success_modal")
														.modal();
												// 					两秒之后关闭用户保存成功模态框
												setTimeout(
														function() {
															$(
																	"#emp_save_success_modal")
																	.modal(
																			'hide');
														}, 1200);
												//	 					来到最后一页，显示新添加的员工信息
												to_page(totalRecord);
											} else {
												if (undefined != result.extend.errorFields.email) {
													// 							显示员工邮箱错误信息；
													show_validate_msg(
															"#email_add_input",
															"error", "邮箱不正确");
												}
												if (undefined != result.extend.errorFields.empName) {
													// 							显示员工邮箱错误信息；
													show_validate_msg(
															"#empName_add_input",
															"error",
															"员工姓名的长度为6-16的英文和数字或者1-20位汉字");
												}
											}

										}

									});
						});
		// 		点击编辑按钮，绑定监听事件
		$(document).on("click", ".update-Btn", function() {
			// 			清空下拉列表

			$("#dept_update_select").empty();
			// 			查询员工信息
			getEmp($(this).attr("update_id"));
			// 			查询部门信息
			getDepts("#dept_update_select");
			// 			把员工id的值，传递给Btn
			$("#emp_update_Btn").attr("update_id", $(this).attr("update_id"));
			// 			把emp_save_Btn按钮的update_id属性的值，设置为id
			// 			弹出员工编辑模态框
			$("#empUpdateModal").modal({
				backdrop : "static"
			});

		});

		function getEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;

					$("#empName_update_input").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val(
							[ empData.gender ]);
					$("#empUpdateModal select").val([ empData.dId ]);
				}
			})
		}

		// 		点击员工编辑模态框中的保存按钮
		$(document).on("click", "#emp_update_Btn ", function() {
			var email = $("#email_update_input").val();
			var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			if (!regEmail.test(email)) {
				show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_update_input", "success", "");

			}
			// 			将emp_update_Btn的属性值赋值给id
			var empId = $("#emp_update_Btn").attr("update_id");
			updateEmp(empId);
			/* 保存成功，关闭模态框 */

		});
		function updateEmp(empId) {
			$.ajax({
				url : "${APP_PATH}/emp/" + empId,
				type : "PUT",
				data : $("#empUpdateModal form").serialize(),
				success : function(result) {
					// 					关闭模态框

					$("#empUpdateModal").modal('hide');
					$("#emp_save_success_modal").modal();
					// 					两秒之后关闭用户保存成功模态框
					setTimeout(function() {
						$("#emp_save_success_modal").modal('hide');
					}, 1200);

					to_page(currentPage);
				}
			});
		}

		// 		点击删除Btn删除员工信息
		$(document).on("click", ".delete-Btn", function() {

			var empId = $(this).attr("del_id");
			var empName = $(this).parents("tr").find("td:eq(1)").text();
			if (confirm("确认删除员工【" + empName + "】?")) {
				deleteEmp(empId);
			}

		});
		// 		删除员工
		function deleteEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "DELETE",
				success : function(result) {
					to_page(currentPage);
				}
			});
		}
		// 		全选的监听事件
		$("#check_all").click(function() {
			// 			attr获取自定义属性的值 prop获取基本属性值
			$(this).prop("checked");
			$(".check-item").prop("checked", $(this).prop("checked"));
		});

		// 		根据选中的单选框的数量来设置是否选中全选框
		$(document)
				.on(
						"click",
						".check-item",
						function() {
							// 			选中的单选框的数量是否与该页的单选框数量相同  相同则为flag=true
							var flag = $(".check-item:checked").length == $(".check-item").length
							$("#check_all").prop("checked", flag);
							
						});

		// 		删除所有选中的员工   
		$("#delEmpBtn").click(function() {
			checkItemBoxNum = $(".check-item:checked").length
			if(checkItemBoxNum == 0){
				alert("未选中任何要删除的员工");
				return false;
			}
					var empNames = "";
					var empIds = "";
					$.each($(".check-item:checked"), function() {
						
						empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
						empNames += $(this).parents("tr").find("td:eq(2)")
								.text()
								+ ",";

					});
					var ids = empIds.substring(0, empIds.length - 1);
					empNames = empNames.substring(0, empNames.length - 1);
					if (confirm("是否批量删除员工【" + empNames + "】  ?")) {
						deleteEmp(ids);
						to_page(currentPage);
						$("#check_all").prop("checked",false);
						
					}
				});
	</script>
</body>
</html>