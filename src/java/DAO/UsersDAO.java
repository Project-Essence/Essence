/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Users;

/**
 *
 * @author tanks
 */
public class UsersDAO {

    public UsersDAO() {
    }

    public String Login(String username, String password) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Users where Username like ? and Password like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
//                String usernameDB = rs.getString(1);
//                String passwordDB = rs.getString(2);
//                String fullnameDB = rs.getString(3);
                int roleDB = rs.getInt(5);
                if (roleDB == 1) {
                    return "admin";
                } else if (roleDB == 2) {
                    return "nhanvien";
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "false";
    }

    public List<Users> showUsers(String usernamee) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Users where Username like '"+usernamee+"'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Users> list = new ArrayList<Users>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String username = rs.getString(2);
                String pass = rs.getString(3);
                String name = rs.getString(4);
                int roleid = rs.getInt(5);
                String imageuser = rs.getString(6);
                String phone = rs.getString(7);
                String address = rs.getString(8);
                Users a = new Users(id, username, pass, name, roleid, imageuser, phone, address);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showUsers(DAO)");
            e.printStackTrace();
        }
        return null;
    }
}
