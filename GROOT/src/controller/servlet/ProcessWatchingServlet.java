package controller.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.ProcessWatchingDAO;

@WebServlet("/ProcessWatchingServlet")
public class ProcessWatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessWatchingServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookId = request.getParameter("bookId") != null ? request.getParameter("bookId") : "NA";
			response.setContentType("application/pdf");
			//response.setHeader("Content-disposition", "inline; filename=" + bookId + ".pdf");
			
			// them luoc xem cho sach
			ProcessWatchingDAO.setBookViews(Integer.parseInt(bookId));
			
			// doc sach
			ServletOutputStream sos = response.getOutputStream();
			sos.write(ProcessWatchingDAO.getBookData(bookId));
			sos.flush();
			sos.close();

		} catch (SQLException e) {
			request.setAttribute("notify", "Không xem được: " + e.toString());
			request.getRequestDispatcher(request.getContextPath() + "/home-notify.jsp").forward(request, response);
		}

	}

}
