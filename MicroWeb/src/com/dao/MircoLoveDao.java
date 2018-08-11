package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.DataBase.DataBaseUtil;
import com.bean.MircoLove;

public class MircoLoveDao {

	public String setMircoLoveUpdate(String mircolove_id,int mircolove_list_select,int mircolove_verify_state) {
		Connection conn = DataBaseUtil.getConnection();
		String sql = "update T_MIRCOLOVE_CHILDREN set mircolove_list_select='"+mircolove_list_select+"', mircolove_verify_state='"+mircolove_verify_state+"' where mircolove_id='"
				+ mircolove_id + "'";
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


	public static List<MircoLove> getMircoLoveList() {
		List<MircoLove> list = new ArrayList<MircoLove>();
		Connection conn = DataBaseUtil.getConnection();
		String sql = "select * from T_MIRCOLOVE_CHILDREN ";
		try {
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				MircoLove mircolove = new MircoLove();
				mircolove.setMircolove_id(rs.getString("mircolove_id"));
				mircolove.setMircolove_target_amount(rs
						.getInt("mircolove_target_amount"));
				mircolove.setMircolove_raise_amount(rs
						.getInt("mircolove_raise_amount"));
				mircolove.setMircolove_open_date(rs
						.getString("mircolove_open_date"));
				mircolove.setMircolove_divid_num(rs
						.getInt("mircolove_divid_num"));
				mircolove.setMircolove_list_title(rs
						.getString("mircolove_list_title"));
				mircolove.setMircolove_list_describe(rs
						.getString("mircolove_list_describe"));
				mircolove.setMircolove_list_image(rs
						.getString("mircolove_list_image"));
				mircolove.setMircolove_list_min_image(rs
						.getString("mircolove_list_min_image"));
				mircolove.setMircolove_list_select(rs
						.getInt("mircolove_list_select"));
				mircolove.setMircolove_list_addr(rs
						.getString("mircolove_list_addr"));
				mircolove.setMircolove_list_support_time(rs
						.getInt("mircolove_list_support_time"));
				mircolove.setMircolove_verify_state(rs
						.getInt("mircolove_verify_state"));
				mircolove.setIs_delete(rs.getInt("is_delete"));
				mircolove.setUser_id(rs.getString("user_id"));
				list.add(mircolove);
				System.out.println("这是从数据库提取的"+mircolove.getMircolove_list_title()+mircolove.getMircolove_list_describe());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeConnection(conn);
		}
		return list;
	}

	public static String getTime(String open_date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date now = null;
		java.util.Date date = null;
		try {
			now = df.parse(df.format(new java.util.Date()));
			date = df.parse(open_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long l = now.getTime() - date.getTime();
		long day = l / (24 * 60 * 60 * 1000);
		long hour = (l / (60 * 60 * 1000) - day * 24);
		long min = ((l / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (l / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		String spaceTime = "";
		if (day == 0) {
			if (hour == 0) {
				if (min == 0) {
					spaceTime = s + "秒前";
				} else {
					spaceTime = min + "分" + s + "秒前";
				}
			} else {
				spaceTime = hour + "小时" + min + "分前";
			}
		} else {
			if (hour == 0) {
				spaceTime = day + "天" + min + "分前";
			} else {
				spaceTime = day + "天" + hour + "小时前";
			}
		}
		return spaceTime;
	}

}
