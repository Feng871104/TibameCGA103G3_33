<%@page import="com.producttype.model.ProductTypeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.productfavorite.model.*"%>
<%@ page import="com.productimg.model.*"%>
<%@include file="/frontend/frontendhead.jsp"%>


<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
ProductFavoriteService productFavoriteService = new ProductFavoriteService();
List<ProductFavoriteVO> list = productFavoriteService.getAll();
pageContext.setAttribute("list", list);
ProductImgService productImgsvc = new ProductImgService();
List<ProductImgVO> list1 = productImgsvc.getAll();
pageContext.setAttribute("list1", list1);
%>


<html>
<head>
<title>�ڪ�����</title>
<style>
.ratings {
	position: relative;
	vertical-align: middle;
	display: inline-block;
	color: #ddd; /*�I���P�P�C��*/
	overflow: hidden;
	font-size: 20px; /*�վ�r��j�p�i��j�Y�p�P�P*/
	text-shadow: 0px 1px 0 #999;
}

.star5 {
	width: 100%; /*�վ�e�ץi�ܧ�P��*/
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: #D56A16; /*�e���P�P�C��*/
}

.star1 {
	width: 20%; /*�վ�e�ץi�ܧ�P��*/
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: #D56A16; /*�e���P�P�C��*/
}

.star2 {
	width: 40%; /*�վ�e�ץi�ܧ�P��*/
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: #D56A16; /*�e���P�P�C��*/
}

.star3 {
	width: 60%; /*�վ�e�ץi�ܧ�P��*/
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: #D56A16; /*�e���P�P�C��*/
}

.star4 {
	width: 80%; /*�վ�e�ץi�ܧ�P��*/
	position: absolute;
	left: 0;
	top: 0;
	white-space: nowrap;
	overflow: hidden;
	color: #D56A16; /*�e���P�P�C��*/
}
</style>
</head>
<body>
	<div class="bg0 m-t-23 p-b-140">
		<div class="container ">
			<h1>
				<strong>�ڪ�����</strong>
			</h1>
			<br>
			<div class="m-l-25 m-r--38 m-lr-0-xl ">
				<div class="flex-w flex-sb-m p-b-52">

					<table class="table-shopping-cart">
						<thead>
							<tr>
								<th style="font-size: 20px; width: 15%">�C���Ϥ�</th>
								<th style="font-size: 20px; width: 20%">�C���W��</th>
								<th style="font-size: 20px; width: 10%">�C������</th>
								<th style="font-size: 20px; width: 10%">���B</th>
								<th style="font-size: 20px; width: 5%">�C���S��</th>
							</tr>
						</thead>

						<c:forEach var="productFavoriteVO" items="${list}">
							<tbody>

								<tr class="table_row isotope-item">
									<td><c:forEach var="productImgVO" items="${list1}"
											varStatus="imgCount" begin="1" end="1">

											<div>
												<img
													src="<%=request.getContextPath()%>/ShowProductImg?pdID=${productFavoriteVO.pdID}&count=${imgCount.count}"
													width=80% alt="IMG">
											</div>
										</c:forEach></td>
									<td style="font-size: 20px;"><b>${productFavoriteVO.productVO.pdName}</b><br>
									<div class="ratings">
											<div class="empty_star">����������</div>
											<div class=" star${productFavoriteVO.productVO.pdStar} ">����������</div>
										</div></td>
									<td style="font-size: 20px;">${productFavoriteVO.productVO.productTypeVO.pdTypeName}</td>
									<td style="font-size: 20px;">${productFavoriteVO.productVO.pdPrice}</td>
									<td style="width: 30%; font-size: 18px;">${productFavoriteVO.productVO.pdDescription}</td>
									<td>&emsp;</td>
									<td>&emsp;</td>



									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/frontend/product/ProductServlet">
											<input type="hidden" name="pdID"
												value="${productFavoriteVO.productVO.pdID}"> <input
												type="hidden" name="action" value="getOne_For_Display">
											<button
												class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
												�ݧ�h</button>
										</FORM> <br>






										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/frontend/productfavorite/ProductFavoriteServlet"
											style="margin-bottom: 0px;">
											<button
												class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">�R��</button>
											<input type="hidden" name="memID"
												value="${productFavoriteVO.memID}"> <input
												type="hidden" name="pdID" value="${productFavoriteVO.pdID}">
											<input type="hidden" name="action" value="delete">
										</FORM>
									</td>
								</tr>
							</tbody>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="/frontend/frontendfoot.jsp"%>