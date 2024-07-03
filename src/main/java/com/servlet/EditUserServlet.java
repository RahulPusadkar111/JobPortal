package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobsDao;
import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

/**
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		
		String name=request.getParameter("name");
		String qualification=request.getParameter("qua");
		String email=request.getParameter("email");
		String password=request.getParameter("ps");
		UserDao ud= new UserDao(DBconnect.getConnection());
		User u=new User();
		u.setId(id);
		u.setName(name);
		u.setQualification(qualification);
		u.setEmail(email);
		u.setPassword(password);
		boolean result =ud.update_User(u);
		HttpSession session=request.getSession();
		
		if(result)
		{
			session.setAttribute("edituserMSG", "Profile Updateded Succesfully");
			response.sendRedirect("user_home.jsp");
		}else
		{
			session.setAttribute("edituserMSG", "Something went wrong");
			response.sendRedirect("user_home.jsp");
		}
	}

}
