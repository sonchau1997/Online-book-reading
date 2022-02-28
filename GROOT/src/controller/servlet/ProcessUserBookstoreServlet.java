package controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Book;
import model.dao.ProcessUserBookstoreDAO;

/**
 * Servlet implementation class ProcessUserBookstoreServlet
 */
@WebServlet("/ProcessUserBookstoreServlet")
public class ProcessUserBookstoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessUserBookstoreServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// xem sau o giao dien chinh
		if (request.getParameter("laterWatchingBtn") != null) {
			int mssv = (int) session.getAttribute("mssv");
			Integer bookId = Integer.parseInt(request.getParameter("bookId"));
			try {
				ProcessUserBookstoreDAO.setUserBookstore(mssv, bookId);
				// lay lai size cua bookstore
				int bookstoreSize = ProcessUserBookstoreDAO.countBookstoreSize(mssv);
				session.setAttribute("bookstoreSize", bookstoreSize);
				request.getRequestDispatcher("/ProcessBookServlet?setting=linkBook").forward(request, response);
				// response.sendRedirect(request.getContextPath() + "/home.jsp");
			} catch (SQLException e) {
				request.setAttribute("notify", "Không thể thiết lập xem sau: " + e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}

		// vao gio hang
		if (request.getParameter("bookStoreBtn") != null) {
			// lay mssv tu jsp
			int mssv = (int) session.getAttribute("mssv");
			try {
				ArrayList<Book> bookStore = ProcessUserBookstoreDAO.getUserBookstore(mssv);
				session.setAttribute("bookStore", bookStore);
				response.sendRedirect(request.getContextPath() + "/bookstore.jsp");
			} catch (SQLException e) {
				request.setAttribute("notify", "Lấy bookstore thất bại: " + e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}

		// tro ve trang ban dau
		if (request.getParameter("returnLaterWatchingBtn") != null) {
			try {
				// lay lai size cua bookstore
				int mssv = (int) session.getAttribute("mssv");
				int bookstoreSize;
				bookstoreSize = ProcessUserBookstoreDAO.countBookstoreSize(mssv);
				session.setAttribute("bookstoreSize", bookstoreSize);
				request.getRequestDispatcher("/ProcessBookServlet?setting=linkBook").forward(request, response);

			} catch (SQLException e) {
				request.setAttribute("notify", "Không thể trở về: " + e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}

		// xoa sach trong gio
		if (request.getParameter("deleteLaterWatchingBtn") != null) {
			try {
				int mssv = (int) session.getAttribute("mssv");
				Integer bookId = Integer.parseInt(request.getParameter("bookId"));
				boolean deleteResult = ProcessUserBookstoreDAO.removeBookInStore(mssv, bookId);
				// lay lai size cua bookstore
				int bookstoreSize = ProcessUserBookstoreDAO.countBookstoreSize(mssv);
				session.setAttribute("bookstoreSize", bookstoreSize);
				/*
				 * nếu xóa thành công thì thì gọi lại chính servlet này và thiết lập giá trị cho
				 * bookStoreBtn
				 */
				if (deleteResult) {
					request.getRequestDispatcher("/ProcessUserBookstoreServlet?bookStoreBtn=true").forward(request,
							response);
				}

			} catch (SQLException e) {
				request.setAttribute("notify", "Không thể xóa sách: " + e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}

	}

}
