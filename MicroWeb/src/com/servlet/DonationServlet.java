package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.dao.DonationInfoDao;
import com.dao.LoginDao;
import com.dao.MircoLoveDao;
@WebServlet("/Donation.action")
public class DonationServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String donation_id=request.getParameter("donation_id");
		int donation_verify_state=Integer.valueOf(request.getParameter("donation_verify_state"));
		DonationInfoDao donationInfoDao=new DonationInfoDao();
		String flag=donationInfoDao.setDonationUpdate(donation_id, donation_verify_state);
		if(flag.equals("success")){
			System.out.println("修改成功");
		}
	}
}
