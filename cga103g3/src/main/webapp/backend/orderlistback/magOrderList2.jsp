<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coupontype.model.*"%>
<%@ page import="com.memcoupon.model.*"%>
<%@ page import="com.orderlist.model.*"%>
<%@ page import="com.orderdetail.model.*"%>

<jsp:useBean id="orderListSvc" scope="page" class="com.orderlist.model.OrderListService" />
<jsp:useBean id="orderDetailSvc" scope="page" class="com.orderdetail.model.OrderDetailService" />
<%
	
	List<OrderListVO> list = orderListSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../backend_template/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>�q��޲z</title>
<meta name="description" content="" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../backend_template/html/board-game (1).png" />
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />
<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="../backend_template/assets/vendor/fonts/boxicons.css" />
<!-- Core CSS -->
<link rel="stylesheet"
	href="../backend_template/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="../backend_template/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="../backend_template/assets/css/demo.css" />
<!-- Vendors CSS -->
<link rel="stylesheet"
	href="../backend_template/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
<link rel="stylesheet"
	href="../backend_template/assets/vendor/libs/apex-charts/apex-charts.css" />
<!-- Page CSS -->
<!-- Helpers -->
<script src="../backend_template/assets/vendor/js/helpers.js"></script>
<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="../backend_template/assets/js/config.js"></script>
<!-- ================================================================================================ -->
<style>
  
  * {
  	box-sizing: border-box;
  }
  
    table {
	width: 950px !important;
	
	margin-top: 5px !important;
	margin-bottom: 5px !important;
  }

   th{
   text-align: center  !important;
   color: black !important;
   }
  th, td {
    padding: 15px !important;
    text-align: center;
  }

  tr:nth-child(odd){
  	background-color: #eee
  }
  #page2{
  	padding-left: 690px;
  }

</style>
</head>
<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<a href="Top&Fot.html" class="app-brand-link"> <span
						class="app-brand-logo demo"> <img
							src="../backend_template/html/board-game (1).png" alt="LogoTest"
							width="35px">
					</span> <span class="app-brand-text demo menu-text fw-bolder ms-2">�̮�</span>
					</a> <a href="javascript:void(0);"
						class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
						<i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>
				<div class="menu-inner-shadow"></div>
				<ul class="menu-inner py-1">
					<!-- ======================================================================================================= -->

					<!-- Dashboard -->
					<li class="menu-item "><a href="Top&Fot.html"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">����</div>
					</a></li>
					<!-- ======================================================================================================= -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">Pages</span></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-dock-top"></i>
							<div data-i18n="Account Settings">�ϥΪ̺޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�޲z����ƺ޲z</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-notifications.html"
								class="menu-link">
									<div data-i18n="Notifications">�޲z���v���޲z</div>
							</a></li>
						</ul> <!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-file "></i>
							<div data-i18n="Account Settings">�e�x�����޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�|����ƺ޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item active"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="Account Settings">�ӫ~�޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�s�W�ӫ~</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-notifications.html"
								class="menu-link">
									<div data-i18n="Notifications">�ק�ӫ~</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-connections.html" class="menu-link">
									<div data-i18n="Connections">�q��޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-detail"></i>
							<div data-i18n="Account Settings">�C�������޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�C�������޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-collection "></i>
							<div data-i18n="Account Settings">�Q�װϺ޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�峹�޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-credit-card "></i>
							<div data-i18n="Account Settings">�q��޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�q���T�޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-mobile-alt "></i>
							<div data-i18n="Account Settings">���ʺ޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">���W�޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-lock-open-alt "></i>
							<div data-i18n="Account Settings">���|�޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�峹���|</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-notifications.html"
								class="menu-link">
									<div data-i18n="Notifications">�|�����|</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-notifications.html"
								class="menu-link">
									<div data-i18n="Notifications">�d�����|</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-user "></i>
							<div data-i18n="Account Settings">��P�޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�s�W�u�f��</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�u�f��o��</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�u�f��޲z</div>
							</a></li>
						</ul></li>
					<!-- ======================================================================================================= -->
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-search "></i>
							<div data-i18n="Account Settings">FQ�޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item"><a
								href="pages-account-settings-account.html" class="menu-link">
									<div data-i18n="Account">�u�W��r�ȪA</div>
							</a></li>
							<li class="menu-item"><a
								href="pages-account-settings-notifications.html"
								class="menu-link">
									<div data-i18n="Notifications">��Ѿ����H�]�w</div>
							</a></li>
						</ul></li>
				</ul>
			</aside>
			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<nav class="layout-navbar    navbar-detached  " id="layout-navbar">
					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4"
							href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>
					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- User -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="../backend_template/assets/img/avatars/1.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="../assets/img/avatars/1.png" alt
															class="w-px-40 h-auto rounded-circle" />
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block">John Doe</span> <small
														class="text-muted">Admin</small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="#"> <i
											class="bx bx-cog me-2"></i> <span class="align-middle">�]�w</span>
									</a></li>
									<li></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="auth-login-basic.html">
											<i class="bx bx-power-off me-2"></i> <span
											class="align-middle">�n�X</span>
									</a></li>
								</ul>
							</li>
							<!--/ User -->
						</ul>
					</div>
				</nav>
				<!-- / Navbar -->
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- =============================================================================================== -->
					<!-- Content���e-->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="card">
							<h2 class="card-header">�q��޲z</h2>
					<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/orders/showOrdersBySearch" >
						<div style="text-align: right;" class="row">
							<div class="col">
								<h6>
									<span style="color: blue">�q��d��:</span>
								</h6>
							</div>
							<div class="col">
								<b>�q��s��:</b> <input type="text" name="ordNo" value=""
									placeholder="22001">
							</div>
						
							<div class="col" style="text-align: center;">
								<b>�q�檬�A:</b><br>
								<select name="ordStatus" id="ordStatus">
									<option value="0">���X�f</option>
									<option value="1">�w�X�f</option>
									<option value="2">�w����</option>
									<option value="3">����</option>
								</select>
							</div>
							<div class="col">
								<b>����H�m�W:</b> <input type="text" name="recName" value=""
									placeholder="�i��J����r"> <input type="submit" value="�}�l�j�M"
									class="btn btn-outline-primary"> <input type="hidden"
									name="action" value="CompositeQuery">
							</div>
						</div>
					</FORM>
					
					
							<%@ include file="page1.file"%>
							<c:forEach var="orderListVO" items="${list}" begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">
								<table class="table" >
									
										<tr>
											<th>�q��s��</th>
											<th>�|���m�W</th>
											<th>�u�f��s��</th>
											<th>�`��</th>
											<th>�q�檬�A</th>
											<th>�U��ɶ�</th>
											<th>����H</th>
											<th>�q��</th>
											<th>�a�}</th>
											<th>���f�覡</th>
											<th>�ק�</th>
											<th>����</th>
										</tr>
										
										<tr>
											<td>${orderListVO.ordNo}</td>
											<td>${orderListVO.memID}</td> 
											<td>${orderListVO.coupNo}</td>
											<td>${orderListVO.ordLastPrice}</td>
											<td>
												<c:if test="${orderListVO.ordStatus == 0 }"><span class="badge bg-label-warning me-1">���X�f</span></c:if>
												<c:if test="${orderListVO.ordStatus == 1 }"><span class="badge bg-label-info me-1">�w�X�f</span></c:if>
												<c:if test="${orderListVO.ordStatus == 2 }"><span class="badge bg-label-success me-1">�w����</span></c:if>
												<c:if test="${orderListVO.ordStatus == 3 }"><span class="badge bg-label-danger me-1">����</span></c:if>
											</td>
											<td>${orderListVO.ordCreate}</td>
											<td>${orderListVO.recName}</td>
											<td>${orderListVO.recPhone}</td>
											<td>${orderListVO.recAddress}</td>
											<td>${orderListVO.ordPick}</td>
											<td><c:if
													test="${orderListVO.ordStatus != 2 && orderListVO.ordStatus != 3}"
													var="condition">
													<FORM METHOD="post"
														ACTION="<%=request.getContextPath()%>          "
														style="margin-bottom: 0px;">
														<input type="submit" value="�ק�" type="button"
															> <input type="hidden"
															name="orderNo" value="${orderListVO.ordNo}"> <input
															type="hidden" name="action" value="getOne_For_Update">
													</FORM>
												</c:if>
											</td>
											<td>
												<button
			                          				  class="btn rounded-pill btn-primary"
							                          type="button"
							                          data-bs-toggle="collapse"
							                          data-bs-target="#collapseExample${orderListVO.ordNo}"
							                          aria-expanded="false"
							                          aria-controls="collapseExample${orderListVO.ordNo}">�i�}
							                     </button>
											</td>											
										</tr>	
										
							
								</table>
<!-- 								=================�H�U���q�����================================ -->
											<div class="collapse" id="collapseExample${orderListVO.ordNo}">
						                        <div class="d-grid d-sm-flex p-3 border">
						                          
								                      <table class="table table-bordered table-hover mb-0">
														<thead class="text-700 bg-gray-200">
															<tr>
																<th class="fw-600">�C���W��</th>
																<th class="fw-600">�ƶq</th>
																<th class="fw-600">�p�p</th>
															</tr>
														</thead>
														<c:forEach var="orderDetailVO" 
														items="${orderDetailSvc.showOneOrderDetail(orderListVO.getOrdNo())}">
															<tbody>
																<tr style="background-color: #B7EBEB;">
<%-- 																	<td class="p-3">${orderDetailVO.getProductVO(orderDetailVO.pdID).getPdName()}</td> --%>
																	<td class="p-3">${orderDetailVO.pdID}</td>
																	<td class="p-3">${orderDetailVO.itemSales}</td>
																	<td class="p-3">${orderDetailVO.price}</td>
																</tr>
															</tbody>
														</c:forEach>
													</table>
			                        			</div>
			                        		</div>
<!-- 								=================�H�W���q�����================================ -->

							</c:forEach>		
								
						</div>
						<div id="page2">
							<%@ include file="page2.file"%>
						</div>
					</div>
					<!-- / Content -->
					<!-- =============================================================================================== -->
					<div class="content-backdrop fade"></div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>
		<!-- Overlay -->
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../backend_template/assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../backend_template/assets/vendor/libs/popper/popper.js"></script>
	<script src="../backend_template/assets/vendor/js/bootstrap.js"></script>
	<script
		src="../backend_template/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../backend_template/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script
		src="../backend_template/assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script src="../backend_template/assets/js/main.js"></script>

	<!-- Page JS -->
	<script src="../backend_template/assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<input type="hidden" name="action" value="insert">


</body>
</html>