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
 * Servlet implementation class EditJobsServlet
 */
public class EditJobsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditJobsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String title=request.getParameter("title");
		String description=request.getParameter("desc");
		String catagory=request.getParameter("catagory");
		String status =request.getParameter("status");
		String location=request.getParameter("location");
		
		Jobs j=new Jobs();
		j.setId(id);
		j.setTitle(title);
		j.setCatagory(catagory);
		j.setDescription(description);
		j.setStatus(status);
		j.setLocation(location);
		
		JobsDao jd=new JobsDao(DBconnect.getConnection());
		boolean res=jd.updateJobs(j);
		
		HttpSession session=request.getSession();
		if(res)
		{
			session.setAttribute("editMsg", "Job Updated Successfully");
			response.sendRedirect("view_jobs.jsp");
		}
		else
		{
			session.setAttribute("editMsg", "Something wrong on server");
			response.sendRedirect("view_jobs.jsp");
		}
	}

}
