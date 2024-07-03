package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobsDao;
import com.db.DBconnect;
import com.entity.Jobs;

/**
 * Servlet implementation class DeleteJobsServlet
 */
public class DeleteJobsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJobsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		//System.out.println(id);
		Jobs j=new Jobs();
		j.setId(id);
		JobsDao jdo=new JobsDao(DBconnect.getConnection());
		HttpSession session=request.getSession();
		boolean rs=jdo.deleteJobs(j);
		if(rs)
		{
			session.setAttribute("deleteMSG", "Job Deleted Successfully");
			response.sendRedirect("view_jobs.jsp");
		}
		else
		{
			session.setAttribute("deleteMSG", "Something went wrong");
			response.sendRedirect("view_jobs.jsp");
		}
	}

}
