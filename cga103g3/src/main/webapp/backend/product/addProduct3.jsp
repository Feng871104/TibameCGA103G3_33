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

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="../backend_template/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<title>�̮�-ServerSide</title>
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
							src="../backend_template/html/board-game (1).png" alt="LogoTest" width="35px">
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
					<li class="menu-item active open"><a href="javascript:void(0);"
						class="menu-link menu-toggle"> <i
							class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="Account Settings">�ӫ~�޲z</div>
					</a>
						<ul class="menu-sub">
							<li class="menu-item active"><a
								href="./addProduct3.jsp" class="menu-link">
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
														<img src="../backend_template/assets/img/avatars/1.png" alt
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


					<div class="content-wrapper">
						<!-- =============================================================================================== -->
						<!-- Content���e-->
						<div class="container-xxl flex-grow-1 container-p-y">
							<div style="width: 100%">

								<div class="card mb-4">
									<h5 class="card-header" style="font-weight: bold">�s�W�C��</h5>
									<div class="card-body demo-vertical-spacing demo-only-element">
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�C���W��</span>
											<input type="text" class="form-control"
												placeholder="Username" aria-label="Username"
												aria-describedby="basic-addon11" name="pdName"
												value="<%=(productVO == null) ? " ���˶�" : productVO.getPdName()%>" />
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�C������</span>
											<select class="form-select" id="exampleFormControlSelect1"
												aria-label="Default select example" name="pdTypeID">
												<c:forEach var="producttypeVO" items="${producttypeSvc.all}">
													<option value="${producttypeVO.pdTypeID}">${producttypeVO.pdTypeName}
												</c:forEach>
											</select>
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�C�����B</span>
											<input type="text" class="form-control"
												placeholder="Username" aria-label="Username"
												aria-describedby="basic-addon11" name="pdPrice"
												value="<%=(productVO == null) ? "500 " : productVO.getPdPrice()%>" />
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�C���ƶq</span>
											<input type="text" class="form-control"
												placeholder="Username" aria-label="Username"
												aria-describedby="basic-addon11" name="pdAmount"
												value="<%=(productVO == null) ? "50 " : productVO.getPdAmount()%>" />
										</div>
										<div class="input-group">
											<span class="input-group-text">�C����T</span>
											<textarea class="form-control" aria-label="With textarea"
												placeholder=" " name="pdDescription">�ܦn��</textarea>
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�C�����A</span>
											<select class="form-select" id="exampleFormControlSelect1"
												aria-label="Default select example" name="pdStatus">
												<option selected></option>
												<option value="0"
													<c:if test="${productVO.pdStatus == '0' }">selected</c:if>>���W�[</option>
												<option value="1"
													<c:if test="${productVO.pdStatus == '1' }">selected</c:if>>�w�W�[</option>
											</select>
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�C�����˫�</span>
											<select class="form-select" id="exampleFormControlSelect1"
												aria-label="Default select example" name="pdStar">
												<option selected></option>
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
											</select>
										</div>
										<div style="font-size: 18px; font-weight: bold;">�s�W�Ӥ�</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">�ʭ��W��</span>
											<input type="text" class="form-control" placeholder=""
												aria-label="Username" aria-describedby="basic-addon11"
												name="pdImgCoverName"
												value="<%=(productImgVO == null) ? " ���˶��ʭ�" : productImgVO.getPdImgName()%>" />
										</div>
										<div class="input-group">
											<input type="file" class="form-control" id="inputGroupFile02"
												onchange="showImg(this)" name="pdImgCover" />
											<label class="input-group-text" for="inputGroupFile02">
												<img id="showimg" src="" style="display: none;" width="150" />
											</label>
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">��(�@)�W��</span>
											<input type="text" class="form-control" placeholder=""
												aria-label="Username" aria-describedby="basic-addon11"
												name="pdImg01Name"
												value="<%=(productImgVO == null) ? " ���˶��Ӥ�(�@)" : productImgVO.getPdImgName()%>" />
										</div>
										<div class="input-group">
											<input type="file" class="form-control" id="inputGroupFile02"
												onchange="showImg2(this)" name="pdImg01" /> <label
												class="input-group-text" for="inputGroupFile02"> <img
												id="showimg2" src="" style="display: none;" width="150" />
											</label>
										</div>
										<div class="input-group">
											<span class="input-group-text" id="basic-addon11">��(�G)�W��</span>
											<input type="text" class="form-control" placeholder=""
												aria-label="Username" aria-describedby="basic-addon11"
												name="pdImg02Name"
												value="<%=(productImgVO == null) ? " ���˶��Ӥ�(�G)" : productImgVO.getPdImgName()%>" />
										</div>
										<div class="input-group">
											<input type="file" class="form-control" id="inputGroupFile02"
												onchange="showImg3(this)" name="pdImg02" /> <label
												class="input-group-text" for="inputGroupFile02"> <img
												id="showimg3" src="" style="display: none;" width="150" />
											</label>
										</div>
										<br> <input type="hidden" name="action"
											value="insertwithimg">

										<button type="submit" class="btn btn-primary">�s�W</button>

									</div>
								</div>
							</div>
						</div>

						<!-- / Content -->
						<!-- =============================================================================================== -->
						<div class="content-backdrop fade"></div>
					</div>
				</FORM>
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

	<script>
		function showImg(thisimg) {
			var file = thisimg.files[0];
			if (window.FileReader) {
				var fr = new FileReader();

				var showimg = document.getElementById('showimg');
				fr.onloadend = function(e) {
					showimg.src = e.target.result;
				};
				fr.readAsDataURL(file);
				showimg.style.display = 'block';
			}
		}
	</script>
	<script>
		function showImg2(thisimg) {
			var file = thisimg.files[0];
			if (window.FileReader) {
				var fr = new FileReader();

				var showimg = document.getElementById('showimg2');
				fr.onloadend = function(e) {
					showimg.src = e.target.result;
				};
				fr.readAsDataURL(file);
				showimg.style.display = 'block';
			}
		}
	</script>
	<script>
		function showImg3(thisimg) {
			var file = thisimg.files[0];
			if (window.FileReader) {
				var fr = new FileReader();

				var showimg = document.getElementById('showimg3');
				fr.onloadend = function(e) {
					showimg.src = e.target.result;
				};
				fr.readAsDataURL(file);
				showimg.style.display = 'block';
			}
		}
	</script>

</body>

</html>