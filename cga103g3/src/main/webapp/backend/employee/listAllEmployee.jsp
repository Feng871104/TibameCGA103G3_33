<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<%@include file="/backend/bkhead.jsp"%>

<%
EmployeeService employeeSvc = new EmployeeService();
List<EmployeeVO> list = employeeSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ����u��� - listAllEmployee.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>


	<table>
		<tr>
			<th>���u�s��</th>
			<th>���u�m�W</th>
			<th>�q��</th>
			<th>�b��</th>
			<th>�K�X</th>
			<th>�J¾�ɶ�</th>
			<th>���A</th>
			<th>�ק�</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="employeeVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${employeeVO.empID}</td>
				<td>${employeeVO.empName}</td>
				<td>${employeeVO.empPhone}</td>
				<td>${employeeVO.empAccount}</td>
				<td>${employeeVO.empPassWord}</td>
				<td>${employeeVO.empHireDate}</td>
				<td>${employeeVO.empStatus}</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/employee/employee.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="empID" value="${employeeVO.empID}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>
<%@include file="/backend/bkfoot.jsp"%>