<%@page import="com.producttype.model.ProductTypeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.producttype.model.*"%>
<%
ProductTypeService productTypeSvc = new ProductTypeService();
List<ProductTypeVO> list = productTypeSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<%@include file="/backend/bkhead.jsp"%>
<html>
<head>
<meta charset="utf-8" />
<title></title>
</head>
<body>

	<div class="content-wrapper">
		<!-- =============================================================================================== -->
		<!-- Content���e-->
		<!-- Basic -->
		<div class="container-xxl flex-grow-1 container-p-y">
			<!-- Search -->
			<div class="navbar-nav align-items-center">
				<div class="nav-item d-flex align-items-center">
					<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
						class="form-control border-0 shadow-none light-table-filter "
						placeholder="�j�M..." aria-label="Search..."
						data-table="order-table" />
				</div>
			</div>
			<br>
			<!-- /Search -->

			<ul class="navbar-nav flex-row align-items-center ms-auto">

				<!-- Basic Bootstrap Table -->
				<div class="card">
					<h5 class="card-header">
						<strong style="font-size: 30px">�C������</strong>
					</h5>
					<div class="table-responsive text-nowrap">
						<table class="table order-table">
							<thead>
								<tr>
									<th style="font-size: 25px">�s��</th>
									<th style="font-size: 25px">�W��</th>
									<th style="font-size: 25px">�ק�</th>
								</tr>
							</thead>
							<tbody class="table-border-bottom-0">
								<c:forEach var="productTypeVO" items="${list}">
							
									<td style="width: 500px;"><strong style="font-size: 20px">${productTypeVO.pdTypeID}</strong></td>
									<td style="width: 600px;"><strong style="font-size: 20px">${productTypeVO.pdTypeName}</strong></td>
									<td>
										<FORM METHOD="post"
											ACTION="/cga103g3/producttype/ProductTypeServlet"
											style="margin-bottom: 0px;">
											<input type="submit" value="�ק�"> <input type="hidden"
												name="pdTypeID" value="${productTypeVO.pdTypeID}"> <input
												type="hidden" name="action" value="getOne_For_Update">
										</FORM>
									</td>
								</tr>
							</tbody>
								</c:forEach>
							
						</table>
					</div>
				</div>
				<!--/ Basic Bootstrap Table -->
				<!-- / Content -->
				<!-- =============================================================================================== -->
				<div class="content-backdrop fade"></div>
		</div>
		<script>
			(function(document) {
				'use strict';

				// �إ� LightTableFilter
				var LightTableFilter = (function(Arr) {

					var _input;

					// ��ƿ�J�ƥ�B�z���
					function _onInputEvent(e) {
						_input = e.target;
						var tables = document.getElementsByClassName(_input
								.getAttribute('data-table'));
						Arr.forEach.call(tables, function(table) {
							Arr.forEach.call(table.tBodies, function(tbody) {
								Arr.forEach.call(tbody.rows, _filter);
							});
						});
					}

					// ��ƿz���ơA��ܥ]�t����r���C�A��l����
					function _filter(row) {
						var text = row.textContent.toLowerCase(), val = _input.value
								.toLowerCase();
						row.style.display = text.indexOf(val) === -1 ? 'none'
								: 'table-row';
					}

					return {
						// ��l�ƨ��
						init : function() {
							var inputs = document
									.getElementsByClassName('light-table-filter');
							Arr.forEach.call(inputs, function(input) {
								input.oninput = _onInputEvent;
							});
						}
					};
				})(Array.prototype);

				// �������J������A�Ұ� LightTableFilter
				document.addEventListener('readystatechange', function() {
					if (document.readyState === 'complete') {
						LightTableFilter.init();
					}
				});

			})(document);
		</script>
</body>
</html>
<%@include file="/backend/bkfoot.jsp"%>

