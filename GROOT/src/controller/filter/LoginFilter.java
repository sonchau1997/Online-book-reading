package controller.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/ProcessWatchingServlet", "/ProcessUserBookstoreServlet" })
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();

		String contextPath = request.getContextPath();
		String WatchingfilterPath = contextPath + "/ProcessWatchingServlet";
		String BookstorefilterPath = contextPath + "/ProcessWatchingServlet";

		if ((WatchingfilterPath.equals(request.getContextPath() + "/ProcessWatchingServlet"))) {
			if (session.getAttribute("hadLogin") == null) {
				response.sendRedirect(request.getContextPath() + "/login-page.jsp");
			} else {
				chain.doFilter(request, response);
			}
		}

		if (BookstorefilterPath.equals(request.getContextPath() + "/ProcessUserBookstoreServlet")) {
			if (session.getAttribute("account") == null) {
				response.sendRedirect(request.getContextPath() + "/login-page.jsp");
			} else {
				chain.doFilter(request, response);

			}

		}

	}
}
