<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.boxtype.model.*"%>

<%
BoxTypeVO btVO = (BoxTypeVO) request.getAttribute("btVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="<%=request.getContextPath()%>/backend/backend_template/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
    <title>絆桌-ServerSide</title>
    <meta name="description" content="" />
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/backend/backend_template/html/board-game (1).png" />
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/fonts/boxicons.css" />
    <!-- Core CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/backend_template/assets/css/demo.css" />
    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/libs/apex-charts/apex-charts.css" />
    <!-- Page CSS -->
    <!-- Helpers -->
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/js/config.js"></script>
    <!-- ================================================================================================ -->

  </head>
  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="<%=request.getContextPath()%>/backend/index.jsp" class="app-brand-link">
              <span class="app-brand-logo demo">
               <img src="<%=request.getContextPath()%>/backend/backend_template/html/board-game (1).png" alt="LogoTest" width="35px">
              </span>
              <span class="app-brand-text demo menu-text fw-bolder ms-2">絆桌</span>
            </a>
            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>
          <div class="menu-inner-shadow"></div>
          <ul class="menu-inner py-1">
<!-- ======================================================================================================= -->

            <!-- Dashboard -->
            <li class="menu-item ">
              <a href="<%=request.getContextPath()%>/backend/index.jsp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">首頁</div>
              </a>
            </li>
<!-- ======================================================================================================= -->
            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">Pages</span>
            </li>
<!-- ======================================================================================================= -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">使用者管理</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/employee/addEmployee.jsp" class="menu-link">
                    <div data-i18n="Account">新增管理員</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/employee/listAllEmployee.jsp" class="menu-link">
                    <div data-i18n="Notifications">管理員管理</div>
                  </a>
                </li>
              </ul>
<!-- ======================================================================================================= -->
              <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link menu-toggle">
                  <i class="menu-icon tf-icons bx bx-file "></i>
                  <div data-i18n="Account Settings">前台網站管理</div>
                </a>
                <ul class="menu-sub">
                  <li class="menu-item">
                    <a href="<%=request.getContextPath()%>/frontend/member/listAllMember.jsp" class="menu-link">
                      <div data-i18n="Account">會員資料管理</div>
                    </a>
                  </li>
                </ul>
              </li>
<!-- ======================================================================================================= -->
            <li class="menu-item ">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-box"></i>
                <div data-i18n="Account Settings">商品管理</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/product/addProduct3.jsp" class="menu-link">
                    <div data-i18n="Account">新增商品</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/product/listAllProductFinal.jsp" class="menu-link">
                    <div data-i18n="Notifications">商品管理</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/orderlistback/magOrderList.jsp" class="menu-link">
                    <div data-i18n="Connections">訂單管理</div>
                  </a>
                </li>
              </ul>
            </li>
<!-- ======================================================================================================= -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Account Settings">遊戲分類管理</div>
              </a>
               <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/producttype/addProductType2.jsp" class="menu-link">
                    <div data-i18n="Account">新增遊戲種類</div>
                  </a>
                </li>
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/producttype/listAllProductType2.jsp" class="menu-link">
                    <div data-i18n="Account">遊戲種類管理</div>
                  </a>
                </li>
              </ul>
            </li>
<!-- ======================================================================================================= -->

<!-- == Leo ================================================================================================= -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-store-alt "></i>
                <div data-i18n="Account Settings"><b>門市管理</b></div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/store/model_AllStore.jsp" class="menu-link">
                    <div data-i18n="Account">門市查詢</div>
                  </a>
                </li>
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/store/model_AddStore.jsp" class="menu-link">
                    <div data-i18n="Account">新增門市</div>
                  </a>
                </li>
              </ul>
            </li>
<!-- == Leo ================================================================================================= -->
            <li class="menu-item active">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-briefcase-alt-2 "></i>
                <div data-i18n="Account Settings"><b>包廂管理</b></div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/box/model_AllBox.jsp" class="menu-link">
                    <div data-i18n="Account">包廂查詢</div>
                  </a>
                </li>
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/box/model_AddBox.jsp" class="menu-link">
                    <div data-i18n="Account">新增包廂</div>
                  </a>
                </li>
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/boxtype/model_AllBoxType.jsp" class="menu-link">
                    <div data-i18n="Account">包廂類型查詢</div>
                  </a>
                </li>
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/boxtype/model_AddBoxType.jsp" class="menu-link">
                    <div data-i18n="Account">新增包廂類型</div>
                  </a>
                </li>
              </ul>
            </li>
<!-- == Leo ================================================================================================= -->
            <li class="menu-item ">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bxs-calendar-check "></i>
                <div data-i18n="Account Settings"><b>門市訂位管理</b></div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/bookingorder/model_AllBookingOrder.jsp" class="menu-link">
                    <div data-i18n="Account">所有訂位訂單</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/GetStoreBookingOrd/GetStoreBookingOrd.do?StoreID=51001&action=get_StoreBookingOrd" class="menu-link">
                    <div data-i18n="Account">Java店/訂單</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/GetStoreBookingOrd/GetStoreBookingOrd.do?StoreID=51002&action=get_StoreBookingOrd" class="menu-link">
                    <div data-i18n="Account">Servlet店/訂單</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/GetStoreBookingOrd/GetStoreBookingOrd.do?StoreID=51003&action=get_StoreBookingOrd" class="menu-link">
                    <div data-i18n="Account">MySQL店/訂單</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/GetStoreBookingOrd/GetStoreBookingOrd.do?StoreID=51004&action=get_StoreBookingOrd" class="menu-link">
                    <div data-i18n="Account">不一樣的養身店/訂單</div>
                  </a>
                </li>
              </ul>
            </li>
  <!-- ======================================================================================================= -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-mobile-alt "></i>
                <div data-i18n="Account Settings">活動管理</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/act/addAct.jsp" class="menu-link">
                    <div data-i18n="Account">新增活動</div>
                  </a>
                </li>
              </ul>
               <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/act/listAllAct.jsp" class="menu-link">
                    <div data-i18n="Account">活動列表</div>
                  </a>
                </li>
              </ul>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/actregis/listAllActRegis.jsp" class="menu-link">
                    <div data-i18n="Account">報名列表</div>
                  </a>
                </li>
              </ul>
            </li>
<!-- ======================================================================================================= -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-user "></i>
                <div data-i18n="Account Settings">行銷管理</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/coupontype/addCouponType.jsp" class="menu-link">
                    <div data-i18n="Account">新增優惠券</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/coupontype/sendCoupon.jsp" class="menu-link">
                    <div data-i18n="Account">優惠券發放</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="<%=request.getContextPath()%>/backend/coupontype/listAllCouponType.jsp" class="menu-link">
                    <div data-i18n="Account">優惠券管理</div>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
<!-- ======================================================================================================= -->
          
        </aside>
        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          <nav
            class="layout-navbar    navbar-detached  "
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>
            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="<%=request.getContextPath()%>/backend/backend_template/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="<%=request.getContextPath()%>/backend/backend_template/assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block">John Doe</span>
                            <small class="text-muted">Admin</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-cog me-2"></i>
                        <span class="align-middle">設定</span>
                      </a>
                    </li>
                    <li>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">登出</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>
          <!-- / Navbar -->
          <!-- Content wrapper -->
          
<!-- ============================================ < Content內容 > ======================================================= -->
         <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>   		
            
                  <div class="card mb-4">
                    <h5 class="card-header"><span class="text-muted fw-light"><b><%=btVO.getBoxName() %> /</b></span>包廂類型更改</h5>
                    <!-- Account -->
                   <form id="formAccountSettings" method="POST" ACTION="<%=request.getContextPath()%>/boxtype/boxtype.do" >

                    <hr class="my-0" />
                    <div class="card-body">
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="firstName" class="form-label">包廂類型編號</label>
                            <input class="form-control" value="<%=btVO.getBoxTypeID()%>" style="width: 150px" readonly />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="firstName" class="form-label">包廂類型名稱</label>
                            <input class="form-control" name="boxName" value="<%=btVO.getBoxName()%>" style="width: 150px" />
                          </div>

                        </div>
                        <div class="mt-2">
                          <input type="hidden" name="action" value="updateBoxType">
                          <input type="hidden" name="boxTypeID" value="<%=btVO.getBoxTypeID()%>">
                          <input type="submit" value="送出修改" class="btn btn-primary me-2" />
                        </div>
                    </div>
                   </form>
                    <!-- /Account -->
                  </div>
          
          
          
          
          
          
<!-- ============================================ < Content內容 > ======================================================= -->

            <div class="content-backdrop fade"></div>
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
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/libs/popper/popper.js"></script>
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="<%=request.getContextPath()%>/backend/backend_template/assets/js/dashboards-analytics.js"></script>
      
<!--      圖片顯示.js -->
    <script src="<%=request.getContextPath()%>/backend/store/js/fileImg.js"> </script>
  </body>
</html>