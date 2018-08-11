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
import com.bean.Sharer;
import com.dao.DonationInfoDao;
import com.dao.MircoLoveDao;
import com.dao.SharerDao;


/**
 * Servlet implementation class ShowStuServlet
 */
@WebServlet("/ShenHe3.action")
public class ShenHe3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShenHe3Servlet() {
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
		List<Sharer> shares=SharerDao.getSharerList();
		request.setAttribute("shares",shares );
		request.getRequestDispatcher("ShenHe3.jsp").forward(request, response);
	}

}
