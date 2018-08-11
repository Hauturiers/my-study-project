package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.DonationInfo;
import com.bean.MircoLove;
import com.dao.DonationInfoDao;
import com.dao.MircoLoveDao;


/**
 * Servlet implementation class ShowStuServlet
 */
@WebServlet("/ShenHe2.action")
public class ShenHe2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShenHe2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DonationInfo> donations=DonationInfoDao.getDonationList();
		System.out.println("mircoLovesµÄ³¤¶È"+donations.size());
		request.setAttribute("donations",donations );
		request.getRequestDispatcher("ShenHe2.jsp").forward(request, response);
	}

}
