/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.ProductsDAO;
import DAO.UsersDAO;
import java.util.ArrayList;
import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
import model.Products;
import model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.RandomString;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/login/")
public class LoginController {

    @Autowired
    JavaMailSender mailer1;

    @RequestMapping(value = "loginIndex", method = RequestMethod.POST)
    public String loginIndex(ModelMap model, HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPass");
        UsersDAO users = new UsersDAO();
        if (users.Login(username, password) == "admin" || users.Login(username, password) == "nhanvien" || users.Login(username, password) == "guest") {
            session.setAttribute("USER", username);
            session.setAttribute("PASS", password);
            session.setAttribute("ROLE", users.Login(username, password));

            ProductsDAO products = new ProductsDAO();
            List<Products> ds = new ArrayList<Products>();
            ds = products.showProducts();
            model.addAttribute("listProducts", ds);

            List<Users> ds2 = new ArrayList<Users>();
            ds2 = users.showUsers(username);
            session.setAttribute("IMGUSER", ds2.get(0).getImageuser());
            session.setAttribute("listUser", ds2);

            NavigationBarDAO navigation = new NavigationBarDAO();
            List<NavigationBar> thuonghieu = new ArrayList<NavigationBar>();
            thuonghieu = navigation.showNav("1");
            List<NavigationBar> linhkien = new ArrayList<NavigationBar>();
            linhkien = navigation.showNav("2");
            List<NavigationBar> gioitinh = new ArrayList<NavigationBar>();
            gioitinh = navigation.showNav("3");
            model.addAttribute("listNav_thuonghieu", thuonghieu);
            model.addAttribute("listNav_linhkien", linhkien);
            model.addAttribute("listNav_gioitinh", gioitinh);
            session.getAttribute("CARTSIZE");
            return "index";
        } else {
            model.addAttribute("login_error", "Sai tên tài khoản hoặc mật khẩu !");
            return "index";
        }
    }

    @RequestMapping("logout")
    public String logout(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ProductsDAO products = new ProductsDAO();
        List<Products> ds = new ArrayList<Products>();
        ds = products.showProducts();
        model.addAttribute("listProducts", ds);

        NavigationBarDAO navigation = new NavigationBarDAO();
        List<NavigationBar> thuonghieu = new ArrayList<NavigationBar>();
        thuonghieu = navigation.showNav("1");
        List<NavigationBar> linhkien = new ArrayList<NavigationBar>();
        linhkien = navigation.showNav("2");
        List<NavigationBar> gioitinh = new ArrayList<NavigationBar>();
        gioitinh = navigation.showNav("3");
        model.addAttribute("listNav_thuonghieu", thuonghieu);
        model.addAttribute("listNav_linhkien", linhkien);
        model.addAttribute("listNav_gioitinh", gioitinh);
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");

        session.invalidate();

        return "index";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession(false);
        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPass");
        String name = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String image = request.getParameter("txtImage");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        Users a = new Users(username, password, name, email, image, phone, address);
        UsersDAO user = new UsersDAO();
        user.Insert(a);
        List<Users> ds = new ArrayList<Users>();
        ds = user.showUsers("");
        model.addAttribute("listUser_adminpage", ds);
        model.addAttribute("mess", "Thêm thành công");

        NavigationBarDAO navigation = new NavigationBarDAO();
        List<NavigationBar> thuonghieu = new ArrayList<NavigationBar>();
        thuonghieu = navigation.showNav("1");
        List<NavigationBar> linhkien = new ArrayList<NavigationBar>();
        linhkien = navigation.showNav("2");
        List<NavigationBar> gioitinh = new ArrayList<NavigationBar>();
        gioitinh = navigation.showNav("3");
        model.addAttribute("listNav_thuonghieu", thuonghieu);
        model.addAttribute("listNav_linhkien", linhkien);
        model.addAttribute("listNav_gioitinh", gioitinh);
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        return "index";
    }

    @RequestMapping("fogetPass")
    public String fogetPass(ModelMap model, HttpServletRequest request) {
        try {
            String username = request.getParameter("txtUser");
            String email = request.getParameter("txtEmail");
            String new_password = RandomString.getRandomString(4, 7);
            UsersDAO a = new UsersDAO();
            if (a.isExitEmail(username, email)) {
                a.getPassword(new_password, username);
                // Tạo mail
                MimeMessage mail = mailer1.createMimeMessage();
                // Sử dụng lớp trợ giúp
                MimeMessageHelper helper = new MimeMessageHelper(mail);
                String from = "khoivtps05357@fpt.edu.vn";
                String subject = "Quên mật khẩu";
                String body = "Mật khẩu mới của bạn là: " + new_password;
                helper.setFrom(from, from);
                helper.setTo(email);
                helper.setReplyTo(from, from);
                helper.setSubject(subject);
                helper.setText(body, true);
                // Gửi mail
                mailer1.send(mail);
                model.addAttribute("message", "Gửi email thành công !");
            } else {
                model.addAttribute("message", "Email không tồn tại !");
            }

        } catch (Exception ex) {
            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "fogetpass";
    }
}
