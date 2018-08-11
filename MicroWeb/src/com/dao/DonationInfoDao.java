package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DataBase.DataBaseUtil;
import com.bean.DonationInfo;


public class DonationInfoDao {
	public String setDonationUpdate(String donation_id,int donation_verify_state) {
		Connection conn = DataBaseUtil.getConnection();
		String sql = "update T_DONATIONINFO set  donation_verify_state='"+donation_verify_state+"' where donation_id='"
				+ donation_id + "'";
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

	public static List<DonationInfo> getDonationList() {
		List<DonationInfo> list = new ArrayList<DonationInfo>();
		Connection conn = DataBaseUtil.getConnection();
		String sql = "select * from T_DONATIONINFO ";
		try {
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				DonationInfo donationInfo = new DonationInfo();
				donationInfo.setDonation_close_date(rs
						.getString("donation_close_date"));
				donationInfo.setDonation_describe(rs
						.getString("donation_describe"));
				donationInfo.setDonation_image(rs.getString("donation_image"));
				donationInfo.setDonation_min_image(rs
						.getString("donation_min_image"));
				donationInfo.setDonation_id(rs.getString("donation_id"));
				donationInfo.setDonation_open_date(rs
						.getString("donation_open_date"));
				donationInfo.setIs_delete(rs.getInt("is_delete"));
				donationInfo.setDonation_raise_goods(rs
						.getString("donation_raise_goods"));
				donationInfo.setDonation_select_need_or_dona(rs
						.getInt("donation_select_need_or_dona"));
				donationInfo.setDonation_title(rs.getString("donation_title"));
				donationInfo.setDonation_trans_cost(rs
						.getInt("donation_trans_cost"));
				donationInfo.setIs_donation_black(rs
						.getInt("is_donation_black"));
				donationInfo.setIs_success(rs.getInt("is_success"));
				donationInfo.setUser_id(rs.getString("user_id"));
				donationInfo.setDonation_verify_state(rs
						.getInt("donation_verify_state"));
				donationInfo.setDonation_addr(rs.getString("donation_addr"));
				list.add(donationInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DataBaseUtil.closeConnection(conn);
		}
		return list;
	}
}
