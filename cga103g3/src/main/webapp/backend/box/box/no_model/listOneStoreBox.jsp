<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.box.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
BoxVO boxVO = (BoxVO) request.getAttribute("boxVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<title>�U�����]�[��� - listOneStoreBox.jsp</title>

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
	width: 600px;
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

	<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ��]�[��� - listOneStoreBox.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/selectAll_page.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�]�[�s��</th>
			<th>�����s��</th>
			<th>�]�[����</th>
			<th>�]�[�H��</th>
			<th>�]�[����</th>
			<th>�]�[����</th>
			<th>�]�[�Ӥ�</th>
			<th>�]�[�w�q�ɶ�</th>
			<th>�]�[�w�q�����ɶ�</th>
		</tr>
		<c:forEach var="boxVO" items="${list}" >
			<tr>
				<td>${boxVO.boxID}</td>
				<td>${boxVO.storeID}</td>
				<td>${boxVO.boxTypeID}</td>
				<td>${boxVO.boxCapcity}</td>
				<td>${boxVO.boxPrice}</td>
				<td>${boxVO.boxDescription}</td>
				<td><img src="<%=request.getContextPath()%>/BoxImg?BoxID=${boxVO.boxID}" width="50" height="50"></td>
				<td>${boxVO.boxBkStart}</td>
				<td>${boxVO.boxBkEnd}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>