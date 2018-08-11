package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.dao.LoginDao;
import com.dao.MircoLoveDao;
@WebServlet("/MicroPower.action")
public class MicroPowerServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MicroPowerServlet() {
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
		String mircolove_id=request.getParameter("mircolove_id");
		int mircolove_list_select=Integer.valueOf(request.getParameter("mircolove_list_select"));
		int mircolove_verify_state=Integer.valueOf(request.getParameter("mircolove_verify_state"));
		MircoLoveDao mircoLoveDao=new MircoLoveDao();
		String flag=mircoLoveDao.setMircoLoveUpdate(mircolove_id, mircolove_list_select, mircolove_verify_state);
		if(flag.equals("success")){
			System.out.println("修改成功");
		}
	}
}
