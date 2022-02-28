package model.bean;

public class Account {
	private int mssv;
	private String firstname;
	private String lastname;
	private String username;
	private String password;
	private boolean admin_role;

	public Account(int mssv, String firstname, String lastname, String username, String password, boolean admin_role) {
		super();
		this.mssv = mssv;
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.password = password;
		this.admin_role = admin_role;
	}

	public int getMssv() {
		return mssv;
	}

	public String getFirstname() {
		return firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setMssv(int mssv) {
		this.mssv = mssv;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin_role() {
		return admin_role;
	}

	public void setAdmin_role(boolean admin_role) {
		this.admin_role = admin_role;
	}

}
