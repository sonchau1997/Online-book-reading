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

import model.bean.Account;
import model.bo.ProcessAccountBO;
import model.dao.ProcessAccountDAO;
import model.dao.ProcessUserBookstoreDAO;

@WebServlet("/ProcessAccountServlet")
public class ProcessAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessAccountServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// lay danh sach account
		if (request.getParameter("accountGetting") != null) {
			try {
				ArrayList<Account> loa = new ProcessAccountDAO().getAccountList();
				request.setAttribute("AccountList", loa);
				request.getRequestDispatcher("/admin-pages/user-management.jsp").forward(request, response);
			} catch (SQLException e) {
				request.setAttribute("notify", e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}

		// tim danh sach account theo ky tu
		if (request.getParameter("searchAccBtn") != null) {
			try {
				String searchStr = request.getParameter("searchForm");
				ArrayList<Account> loa = new ProcessAccountDAO().getSearchingAccountList(searchStr);
				request.setAttribute("AccountList", loa);
				request.getRequestDispatcher("/admin-pages/user-management.jsp").forward(request, response);
			} catch (SQLException e) {
				request.setAttribute("notify", e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProcessAccountBO loginBO = new ProcessAccountBO();

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		// chuc nang dang nhap
		if (request.getParameter("login") != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			try {
				if (loginBO.checkLogin(username, password)) {
					Account acc = loginBO.getAccount(username);
					int mssv = acc.getMssv();
					// lay bookstoreSize cua tai khoan de hien thi kho sach
					int bookstoreSize = ProcessUserBookstoreDAO.countBookstoreSize(mssv);

					session.setAttribute("account", acc);
					session.setAttribute("bookstoreSize", bookstoreSize);
					response.sendRedirect(request.getContextPath() + "/admin-pages/admin.jsp");
				} else {
					request.setAttribute("fail", "Sai mật khẩu hoặc tài khoản.");
					request.getRequestDispatcher("/login-page.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				request.setAttribute("notify", e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}
		// chuc nang dang xuat
		if (request.getParameter("logout") != null) {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/introduction.jsp");
		}
		// chuc nang dang ky
		if (request.getParameter("register") != null) {
			Integer mssv = Integer.parseInt(request.getParameter("mssv"));
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			try {
				if (!loginBO.checkExistAccount(mssv, username)) {
					if (loginBO.setAccount(mssv, firstname, lastname, username, password)) {
						request.setAttribute("success", "Đăng ký thành công, vui lòng đăng nhập.");
						request.getRequestDispatcher("/login-page.jsp").forward(request, response);
					} else {
						request.setAttribute("fail", "Tên đăng nhập hoặc mã số sinh viên không hợp lệ.");
						request.getRequestDispatcher("/register.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("fail", "Tên đăng nhập hoặc mã số sinh viên đã tồn tại");
					request.getRequestDispatcher("/register.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				request.setAttribute("notify", e.toString());
				request.getRequestDispatcher("/home-notify.jsp").forward(request, response);
			}
		}
	}

}
