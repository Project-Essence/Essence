<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ##### Footer Area Start ##### -->
<footer class="footer_area clearfix">
    <div class="container">
        <div class="row">
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area d-flex mb-30">
                    <!-- Logo -->
                    <div class="footer-logo mr-50">
                        <a href="#"><img src="../img/core-img/logo2.png" alt=""></a>
                    </div>
                    <!-- Footer Menu -->
                    <div class="footer_menu">
                        <ul>
                            <li><a href="shop.html">Shop</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area mb-30">
                    <ul class="footer_widget_menu">
                        <li><a href="#">Order Status</a></li>
                        <li><a href="#">Payment Options</a></li>
                        <li><a href="#">Shipping and Delivery</a></li>
                        <li><a href="#">Guides</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Use</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row align-items-end">
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area">
                    <div class="footer_heading mb-30">
                        <h6>Subscribe</h6>
                    </div>
                    <div class="subscribtion_form">
                        <form action="#" method="post">
                            <input type="email" name="mail" class="mail" placeholder="Your email here">
                            <button type="submit" class="submit"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Single Widget Area -->
            <div class="col-12 col-md-6">
                <div class="single_widget_area">
                    <div class="footer_social_area">
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-12 text-center">
                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>

    </div>
</footer>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/loginIndex.htm" method="get">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>

                        <div class="col-12 mb-3">
                            <label for="city">Username </label>
                            <input type="text" name="txtUser" class="form-control" id="city" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Password </label>
                            <input type="password" name="txtPass" class="form-control" id="state" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Đăng ký tài khoản <a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#user_register" >tại đây </a> </label>
                            <label for="state" style="float: right;"><a href="#" style="font-size: 14px;">Quên mật khẩu ? </a> </label>
                        </div>
                        <div style="width: 100%;text-align: center;">
                            <button type="submit" class="btn essence-btn" >Submit</button>
                            <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>             

<!-- User Info Modal -->
<div class="modal fade" id="userInfo" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">User Info</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <c:forEach var="rows" items="${listUser}">
                    <div>
                        <div class="row">
                            <div class="col-3" style="line-height: 5vh;">
                                <label>ID </label>
                            </div>
                            <div class="col-9">
                                <input type="text" disabled="true" class="form-control" id="state" value="${rows.id}">
                            </div>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Username </label>
                            </div>
                            <div class="col-9">
                                <input type="text" disabled="true" class="form-control" id="state" value="${rows.username}">
                            </div>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Password </label>
                            </div>
                            <div class="col-9">
                                <input type="text" disabled="true" class="form-control" id="state" value="*********">
                            </div>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Name </label>
                            </div>
                            <div class="col-9">
                                <input type="text" disabled="true" class="form-control" id="state" value="${rows.name}">
                            </div>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Role </label>
                            </div>
                            <c:if test="${rows.roleid == 1}">
                                <div class="col-9">
                                    <input type="text" disabled="true" class="form-control" id="state" value="Admin">
                                </div>
                            </c:if>
                            <c:if test="${rows.roleid == 2}">
                                <div class="col-9">
                                    <input type="text" disabled="true" class="form-control" id="state" value="Nhân viên">
                                </div>
                            </c:if>
                            <c:if test="${rows.roleid == 3}">
                                <div class="col-9">
                                    <input type="text" disabled="true" class="form-control" id="state" value="Khách hàng">
                                </div>
                            </c:if>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Image </label>
                            </div>
                            <div class="col-9">
                                <img src="../img/users-img/${rows.imageuser}" style="margin-bottom: 2%;">
                            </div>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Phone </label>
                            </div>
                            <div class="col-9">
                                <input type="text" disabled="true" class="form-control" id="state" value="${rows.phone}">
                            </div>
                            <div class="col-3" style="line-height: 5vh;">
                                <label>Address </label>
                            </div>
                            <div class="col-9">
                                <input type="text" disabled="true" class="form-control" id="state" value="${rows.address}" style="overflow: hidden;text-overflow: ellipsis;">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div style="width: 100%;text-align: center;">
                            <a href="../login/logout.htm" class="btn essence-btn" >Đăng xuất</a>
                            <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>      

<!-- User Register -->
<div class="modal fade" id="user_register" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Register</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/register.htm" method="post">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>
                        <div class="col-12 mb-3">
                            <label for="city">Username </label>
                            <input type="text" name="txtUser" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Password </label>
                            <input type="password" name="txtPass" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Email </label>
                            <input type="email" name="txtEmail" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Name </label>
                            <input type="text" name="txtName" class="form-control" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Image </label>
                            <input type="file" class="form-control" name="txtImage" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Phone Number </label>
                            <input type="text" class="form-control" name="txtPhone" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Address </label>
                            <input type="text" class="form-control" name="txtAddress" value="">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="width: 100%;text-align: center;">
                        <button type="submit" class="btn essence-btn" >Submit</button>
                        <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Forgot password -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="../login/loginIndex.htm" method="get">
                <!-- Modal body -->
                <div class="modal-body">
                    <div>

                        <div class="col-12 mb-3">
                            <label for="city">Username </label>
                            <input type="text" name="txtUser" class="form-control" id="city" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Password </label>
                            <input type="password" name="txtPass" class="form-control" id="state" value="">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="state">Đăng ký tài khoản <a href="#" style="font-size: 14px;" data-toggle="modal" data-target="#user_register" >tại đây </a> </label>
                            <label for="state" style="float: right;"><a href="#" style="font-size: 14px;">Quên mật khẩu ? </a> </label>
                        </div>
                        <div style="width: 100%;text-align: center;">
                            <button type="submit" class="btn essence-btn" >Submit</button>
                            <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>