package controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Account;

//@WebFilter(urlPatterns = { "*.java" }, initParams = {
//		@WebInitParam(name = "userPage", value = "/images/image-not-found.png"),
//		@WebInitParam(name = "adminPage", value = "/images/image-not-found.png") })

@WebFilter("/admin-pages/admin.jsp")
public class AccountFilter implements Filter {
	private String userPageUrl;
	private String adminPageUrl;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		userPageUrl = filterConfig.getInitParameter("userPage");
		adminPageUrl = filterConfig.getInitParameter("adminPage");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String contextPath = request.getContextPath();
		String filterPath = contextPath + "/admin-pages/admin.jsp";

		if (filterPath.equals(request.getContextPath() + "/admin-pages/admin.jsp")) {
			HttpSession session = request.getSession();
			Account acc = (Account) session.getAttribute("account");

			if (acc != null) {

				if (acc.isAdmin_role()) {
					chain.doFilter(request, response);
				} else {
					// request.getRequestDispatcher("user.jsp").forward(request, response);
					response.sendRedirect(request.getContextPath() + "/introduction.jsp");
				}

			}
		}

	}

}
