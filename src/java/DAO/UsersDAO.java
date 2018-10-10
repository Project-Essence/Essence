/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
