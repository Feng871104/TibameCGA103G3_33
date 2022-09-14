<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.productimg.model.*"%>

<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
ProductService productsvc = new ProductService();
List<ProductVO> list = productsvc.getAll();
ProductImgService productImgsvc = new ProductImgService();
List<ProductImgVO> list1 = productImgsvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ��C����� - listAllProduct.jsp</title>

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
	width: 800px;
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

	<h4>�����m�߱ĥ� EL ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ��C����� - listAllProduct.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�C���s��</th>
			<th>�C���W��</th>
			<th>�C������</th>
			<th>�C�����B</th>
			<th>�C���ƶq</th>
			<th>�C���y�z</th>
			<th>�W�[���A</th>
			<th>�C�����˫�</th>
			<th>�W�[�ɶ�</th>
			<th>�ʭ��Ϥ�</th>
			<th>�Ϥ�(�@)</th>
			<th>�Ϥ�(�G)</th>


			<th>�ק�</th>
			<th>�R��</th>
		</tr>
<%-- 		<%@ include file="page1.file"%> --%>
		<c:forEach var="productVO" items="${list}" >

			<tr>
				<td>${productVO.pdID}</td>
				<td>${productVO.pdName}</td>
				<td>${productVO.productTypeVO.pdTypeName}</td>
				<td>${productVO.pdPrice}</td>
				<td>${productVO.pdAmount}</td>
				<td>${productVO.pdDescription}</td>
				<td>${productVO.pdStatus}</td>
				<td>${productVO.pdStar}</td>
				<td>${productVO.pdUpdate}</td>

				<c:forEach var="productImgVO" items="${list}" varStatus="imgCount" step="4"
					>

					<td><img
						src="<%=request.getContextPath()%>/ShowProductImg?pdID=${productVO.pdID}&count=${imgCount.count}"
						width=150px height=100px></td>

				</c:forEach>

				<td>
					<FORM METHOD="post" ACTION="product.do" style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="pdID" value="${productVO.pdID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="product.do" style="margin-bottom: 0px;">
						<input type="submit" value="�R��"> <input type="hidden"
							name="pdID" value="${productVO.pdID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
<%-- 	<%@ include file="page2.file"%> --%>

</body>
</html>