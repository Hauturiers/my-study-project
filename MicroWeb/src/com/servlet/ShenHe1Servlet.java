package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.MircoLove;
import com.dao.MircoLoveDao;


/**
 * Servlet implementation class ShowStuServlet
 */
@WebServlet("/ShenHe1.action")
public class ShenHe1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShenHe1Servlet() {
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
		List<MircoLove> mircoLoves=MircoLoveDao.getMircoLoveList();
		System.out.println("mircoLovesµÄ³¤¶È"+mircoLoves.size());
		request.setAttribute("mircoLoves",mircoLoves );
		request.getRequestDispatcher("ShenHe.jsp").forward(request, response);
	}

}
