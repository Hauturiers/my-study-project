package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.DataBase.DataBaseUtil;
import com.bean.User;

public class LoginDao {

	public static String login(User user){
		Connection conn = DataBaseUtil.getConnection();
		String flag = null;
		String sql="select * from userinfo where username=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if(rs.getString("userpwd").equals(user.getUserPwd())){
					flag="success";
				}else{
					flag="error";
				}
			}
			else{
				flag="error";
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return flag;
	}
}
