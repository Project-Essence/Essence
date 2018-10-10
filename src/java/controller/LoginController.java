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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
import model.Products;
import model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/login/")
public class LoginController {

    @RequestMapping(value = "loginIndex", method = RequestMethod.GET)
    public String loginIndex(ModelMap model, HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPass");
        UsersDAO users = new UsersDAO();
        if (users.Login(username, password) == "admin" || users.Login(username, password) == "nhanvien") {
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
            return "login";
        }
    }
}
