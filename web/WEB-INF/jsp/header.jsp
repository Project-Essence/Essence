<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header_area">
    <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
        <!-- Classy Menu -->
        <nav class="classy-navbar" id="essenceNav">
            <!-- Logo -->
            <a class="nav-brand" href="../products/productsIndex.htm"><img src="../img/core-img/logo.png" alt=""></a>
            <!-- Navbar Toggler -->
            <div class="classy-navbar-toggler">
                <span class="navbarToggler"><span></span><span></span><span></span></span>
            </div>
            <!-- Menu -->
            <div class="classy-menu">
                <!-- close btn -->
                <div class="classycloseIcon">
                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                </div>
                <!-- Nav Start -->
                <div class="classynav">
                    <ul>
                        <li><a href="#">Shop</a>
                            <div class="megamenu">
                                <ul class="single-mega cn-col-4">
                                    <li class="title"><b>Thương hiệu</b></li>
                                        <c:forEach var="rows" items="${listNav_thuonghieu}">
                                        <li><a href="<s:url value="../products/${rows.catalogmenuid}.htm"/>">${rows.catalogmenuname}</a></li>
                                        </c:forEach>
                                </ul>
                                <ul class="single-mega cn-col-4">
                                    <li class="title"><b>Linh kiện</b></li>
                                        <c:forEach var="rows" items="${listNav_linhkien}">
                                        <li><a href="<s:url value="../products/${rows.catalogmenuid}.htm"/>">${rows.catalogmenuname}</a></li>
                                        </c:forEach>
                                </ul>
                                <ul class="single-mega cn-col-4">
                                    <li class="title"><b>Đồng hồ cho giới tính</b></li>
                                        <c:forEach var="rows" items="${listNav_gioitinh}">
                                        <li><a href="<s:url value="../products/${rows.catalogmenuid}.htm"/>">${rows.catalogmenuname}</a></li>
                                        </c:forEach>
                                </ul>
                                <div class="single-mega cn-col-4">
                                    <img src="../img/bg-img/bg-98.jpg" alt="">
                                </div>
                            </div>
                        </li>
                        <li><a href="blog.html">News</a></li>
                        <li><a href="/Essence/contact/contact.htm">Contact</a></li>
                        <li><a href="#">Languages</a>
                            <ul class="dropdown">
                                <li><a href="?lang=en">English</a></li>
                                <li><a href="?lang=vi">Vietnamese</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- Nav End -->
            </div>
        </nav>

        <!-- Header Meta Data -->
        <div class="header-meta d-flex clearfix justify-content-end">
            <!-- Search Area -->
            <div class="search-area">
                <form action="../products/search.htm" method="get">
                    <input type="search" name="txtSearch" id="headerSearch" placeholder="Type for search">
                    <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                </form>
            </div>
            <!-- Favourite Area -->
            <div class="favourite-area">
                <a href="#"><img src="../img/core-img/heart.svg" alt=""><span>${sessionScope.CARTSIZE}</span></a>
            </div>

            <!-- User Login Info -->
            <c:if test="${sessionScope.USER == null}">
                <div class="classy-menu">
                    <div class="classynav">
                        <ul>
                            <li class="user-login-info">
                                <a href="#"><img src="../img/core-img/user.svg" alt=""></a>
                                <div class="megamenu" style="width: 50%;left:50%;">
                                    <ul class="single-mega cn-col-4" style="width: 100%">
                                        <form action="../login/loginIndex.htm" method="get">
                                            <div class="row">
                                                ${login_error}
                                                <div class="col-12 mb-3">
                                                    <label for="city">Username </label>
                                                    <input type="text" name="txtUser" class="form-control" id="city" value="">
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <label for="state">Password </label>
                                                    <input type="password" name="txtPass" class="form-control" id="state" value="">
                                                </div>
                                                <div style="width: 100%;text-align: center;">
                                                    <input class="btn essence-btn" type="submit"/>
                                                </div>
                                            </div>
                                        </form>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.USER != null}">
                <div class="user-login-info">
                    <a href="#"><img src="../img/core-img/user.svg" alt=""></a>
                </div>
            </c:if>

            <!-- Cart Area -->
            <div class="cart-area">
                <a href="#" id="essenceCartBtn"><img src="../img/core-img/bag.svg" alt=""> <span>${sessionScope.CARTSIZE}</span></a>
            </div>
        </div>

    </div>
</header>