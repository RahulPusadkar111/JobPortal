package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String email=request.getParameter("em");
		String password=request.getParameter("ps");
		HttpSession session = request.getSession();
		User u=new User();
		if (("Admin@gmail.com").equals(email) && ("Admin1234").equals(password)) {
			session.setAttribute("userobj", u);
			u.setRole("admin");
			response.sendRedirect("admin.jsp");
		}else {
			UserDao ud=new UserDao(DBconnect.getConnection());
			User us=ud.login(email, password);
			
			if(us!=null)
			{
				session.setAttribute("userobj", us);
				response.sendRedirect("user_home.jsp");
			}
			else
			{
				session.setAttribute("loginMSG", "Invalid email and password");
				response.sendRedirect("login.jsp");
			}
		}
	}

}
