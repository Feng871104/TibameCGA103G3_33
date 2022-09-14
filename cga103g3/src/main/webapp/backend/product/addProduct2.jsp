<%@page import="com.productimg.model.ProductImgVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.productimg.model.*"%>
<%@ page import="com.producttype.model.*"%>

<%
ProductVO productVO = (ProductVO) request.getAttribute("productVO");
ProductImgVO productImgVO = (ProductImgVO) request.getAttribute("productImgVO");
ProductTypeVO productTypeVO = (ProductTypeVO) request.getAttribute("productTypeVO");


%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���u��Ʒs�W - addEmp.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>���u��Ʒs�W - addEmp.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<jsp:useBean id="producttypeSvc" scope="page"
		class="com.producttype.model.ProductTypeService" />

	<FORM METHOD="post" ACTION="product.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>�C���W��:</td>
				<td><input type="TEXT" name="pdName" size="45"
					value="<%=(productVO == null) ? " ���˶�" : productVO.getPdName()%>" /></td>
			</tr>
			<tr>

				<td>�����W��:</td>
				<td><select size="1" name="pdTypeID">
						<c:forEach var="producttypeVO" items="${producttypeSvc.all}">
							<option value="${producttypeVO.pdTypeID}">${producttypeVO.pdTypeName}
						</c:forEach>
				</select></td>


			</tr>
			<tr>
				<td>�C������:</td>
				<td><input type="TEXT" name="pdPrice" size="45"
					value="<%=(productVO == null) ? "500 " : productVO.getPdPrice()%>" /></td>
			</tr>
			<tr>
				<td>�C���ƶq:</td>
				<td><input type="TEXT" name="pdAmount" size="45"
					value="<%=(productVO == null) ? "50 " : productVO.getPdAmount()%>" /></td>
			</tr>

			<tr>
				<td>�C����T:</td>
				<td><input type="TEXT" name="pdDescription" size="45"
					value="<%=(productVO == null) ? "�U�W��q " : productVO.getPdDescription()%>" /></td>
			</tr>
			<tr>
				<td>�C�����A:<font color=red><b>*</b></font></td>
				<td><select size="1" name="pdStatus">
						<option value="0"
							<c:if test="${productVO.pdStatus == '0' }">selected</c:if>>���W�[</option>
						<option value="1"
							<c:if test="${productVO.pdStatus == '1' }">selected</c:if>>�w�W�[</option>
				</select></td>
			</tr>
			<tr>
				<td>�C�����˫�:<font color=yellow><b>*</b></font></td>
				<td><select size="1" name="pdStar">
						<option value="1"
							<c:if test="${productVO.pdStar == '1' }">selected</c:if>>1�P</option>
						<option value="2"
							<c:if test="${productVO.pdStar == '2' }">selected</c:if>>2�P</option>
						<option value="3"
							<c:if test="${productVO.pdStar == '3' }">selected</c:if>>3�P</option>
						<option value="4"
							<c:if test="${productVO.pdStar == '4' }">selected</c:if>>4�P</option>
						<option value="5"
							<c:if test="${productVO.pdStar == '5' }">selected</c:if>>5�P</option>
				</select></td>
			</tr>
			<tr>
				<td>�ʭ��Ӥ�:</td>
				<td><input type="file" name="pdImgCover" size="45"></td>
			</tr>
			<tr>
				<td>�ʭ��Ӥ��W��:</td>
				<td><input type="TEXT" name="pdImgCoverName" size="45"
					value="<%=(productImgVO == null) ? " ���˶��ʭ�" : productImgVO.getPdImgName()%>">
				</td>
			</tr>
			<tr>
				<td>�Ӥ�(�@):</td>
				<td><input type="file" name="pdImg01" size="45"></td>
			</tr>
			<tr>
				<td>�Ӥ�(�@)�W��:</td>
				<td><input type="TEXT" name="pdImg01Name" size="45"
					value="<%=(productImgVO == null) ? " ���˶��Ӥ�(�@)" : productImgVO.getPdImgName()%>">
				</td>
			</tr>
			<tr>
				<td>�Ӥ�(�G):</td>
				<td><input type="file" name="pdImg02" size="45"></td>
			</tr>
			<tr>
				<td>�Ӥ�(�G)�W��:</td>
				<td><input type="TEXT" name="pdImg02Name" size="45"
					value="<%=(productImgVO == null) ? " ���˶��Ӥ�(�G)" : productImgVO.getPdImgName()%>">
				</td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insertwithimg">
		<input type="submit" value="�e�X�s�W">
	</FORM>
</body>




</html>