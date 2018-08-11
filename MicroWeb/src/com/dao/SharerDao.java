package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DataBase.DataBaseUtil;
import com.bean.Sharer;

public class SharerDao {

	public String setShareUpdate(String witness_id,int witness_verify_state) {
		Connection conn = DataBaseUtil.getConnection();
		String sql = "update T_WITNESSINFO set witness_verify_state='"+witness_verify_state+"' where witness_id='"
				+ witness_id + "'";
		System.out.print(sql);
		String flag;
		try {
			Statement stm = conn.createStatement();
			stm.executeUpdate(sql);
			flag="success";
		} catch (SQLException e) {
			e.printStackTrace();
			flag="error";
		} finally {
			DataBaseUtil.closeConnection(conn);
		}
		return flag;
	}

	public static List<Sharer> getSharerList() {
		List<Sharer> list = new ArrayList<Sharer>();
		Connection conn = DataBaseUtil.getConnection();
		String sql = "select * from T_WITNESSINFO";
		try {
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				Sharer sharer = new Sharer();
				sharer.setUser_id(rs.getString("user_id"));
				sharer.setWitness_describe(rs.getString("witness_describe"));
				sharer.setWitness_id(rs.getString("witness_id"));
				sharer.setWitness_image(rs.getString("witness_image"));
				sharer.setWitness_min_image(rs.getString("witness_min_image"));
				sharer.setWitness_open_date(MircoLoveDao.getTime(rs
						.getString("witness_open_date")));
				sharer.setIs_witness_black(rs.getInt("is_witness_black"));
				sharer.setWitness_title(rs.getString("witness_title"));
				sharer.setWitness_verify_state(rs
						.getInt("witness_verify_state"));
				sharer.setIs_delete(rs.getInt("is_delete"));
				sharer.setWitness_addr(rs.getString("witness_addr"));
				list.add(sharer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeConnection(conn);
		}
		return list;
	}
}
