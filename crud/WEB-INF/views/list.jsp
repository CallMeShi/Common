<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 引入 Bootstrap -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
<!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
</head>
<body>
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
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 	表格 -->
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-12">
				<table class="table-hover table">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageinfo.list }" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<td>${emp.empName }</td>
							<td>${emp.gender }</td>
							<td>${emp.email }</td>
							<td>${emp.department.deptName }</td>
							<th>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil "></span> 编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="	glyphicon glyphicon-trash"></span> 删除
								</button>
							</th>
						</tr>
					</c:forEach>
					<tr>
				</table>
			</div>
		</div>
		<!-- 显示分页信息	数据 -->
		<div class="row">
			<!--  分页文字信息 总记录数，总页码 -->
			<div class="col-md-5">
				当前第<span style="color: #0000ff">${pageinfo.pageNum }</span>页,总共<span
					style="color: #0000ff">${pageinfo.pages }</span>,总共有<span
					style="color: #0000ff">${pageinfo.total }</span>条记录
			</div>

			<div class="col-md-5">
				<ul class="pagination">
					<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
					<!-- 					如果有上一页，则显示上一页 -->
					<c:if test="${pageinfo.hasPreviousPage }">
						<li><a href="${APP_PATH }/emps?pn=${pageinfo.pageNum-1 }">&laquo;</a></li>
					</c:if>


					<c:forEach items="${pageinfo.navigatepageNums }" var="page_Num">
						<!-- 					判断显示的页面是不是当前页，如果是，样式为高亮 -->
						<c:if test="${page_Num == pageinfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageinfo.pageNum }">
							<li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageinfo.hasNextPage }">
						<li><a href="${APP_PATH }/emps?pn=${pageinfo.pageNum+1 }">&raquo;</a></li>
					</c:if>

					<li><a href="${APP_PATH }/emps?pn=${pageinfo.pages}">末页</a></li>
				</ul>
			</div>


			<div class="form-inline col-md-2">
				<div class="pagination form-group ">
					<input class="form-control"
						style="width: 80px; margin-left: -10px;" type="text" min="1"
						max="{$pagecount}" id="pageindex" name="pageindex"
						placeholder="页码" /> <input class="btn btn-danger" type="button"
						onclick="openPage()" value="确定" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>