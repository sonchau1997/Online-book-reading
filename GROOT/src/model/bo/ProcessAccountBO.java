package model.bo;

import java.sql.SQLException;

import model.bean.Account;
import model.dao.ProcessAccountDAO;

public class ProcessAccountBO {
	private ProcessAccountDAO loginDao;

	public ProcessAccountBO() {
		this.loginDao = new ProcessAccountDAO();
	}

	public boolean checkExistAccount(int mssv, String username) throws SQLException {
		return loginDao.checkExistAccount(mssv, fixSqlFieldValue(username));
	}

	public boolean checkLogin(String username, String password) throws SQLException {
		if (username == null || username.length() > 10)
			return false;
		if (password == null || password.length() > 8)
			return false;
		boolean result = loginDao.checkLogin(fixSqlFieldValue(username), fixSqlFieldValue(password));
		return result;
	}

	public Account getAccount(String username) throws SQLException {
		if (username == null || username.length() > 10)
			return null;
		Account acc = loginDao.getAccount(fixSqlFieldValue(username));
		return acc;
	}

	public boolean setAccount(int mssv, String firstname, String lastname, String username, String password) {
		boolean result = loginDao.setAccount(mssv, fixSqlFieldValue(firstname), fixSqlFieldValue(lastname),
				fixSqlFieldValue(username), fixSqlFieldValue(password));
		return result;
	}

	// xu ly khi username co dau '
	private static String fixSqlFieldValue(String value) {
		if (value == null)
			return null;
		int length = value.length();
		StringBuffer fixedValue = new StringBuffer((int) (length * 1.1));
		for (int i = 0; i < length; i++) {
			char c = value.charAt(i);
			if (c == '\'')
				fixedValue.append("''");
			else
				fixedValue.append(c);
		}
		return fixedValue.toString();
	}

//	public static void main(String[] args) {
//		System.out.println(new ProcessLoginBO().checkLogin("linh", "123"));
//		System.out.println(new ProcessLoginBO().getAccount("linh") == null);
//	}
}
