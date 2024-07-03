package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

/**
 * Servlet implementation class SignupServlet
 */
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String qualification=request.getParameter("qua");
		String email=request.getParameter("email");
		String  password=request.getParameter("ps");
		//METHOD ONE TO SET USER OBJECT
		User u=new User();
		u.setEmail(email);
		u.setName(name);
		u.setQualification(qualification);
		u.setPassword(password);
		u.setRole("User");
		
		//METHOD Two TO SET USER OBJECT
//		User us=new User(name,email,qualification,password,"User");
		
		HttpSession session=request.getSession();
		UserDao ud=new UserDao(DBconnect.getConnection());
		boolean j=ud.add_User(u);
		
		if(j)
		{
			session.setAttribute("signupMSG", "Resistered Succesfully");
			response.sendRedirect("signup.jsp");
		}else
		{
			session.setAttribute("signupMSG", "Something went wrong on server");
			response.sendRedirect("signup.jsp");
		}
	}

}
