package model.bean;

public class Book {
	private int id;
	private String name;
	private String author;
	private String type;
	private String imgBase64;
	private int views;

	public Book(int id, String name, String author, String type) {
		this.id = id;
		this.name = name;
		this.author = author;
		this.type = type;
	}

	public Book(int id, String name, String author, String type, String imgBase64, int views) {
		this.id = id;
		this.name = name;
		this.author = author;
		this.imgBase64 = imgBase64;
		this.views = views;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getAuthor() {
		return author;
	}

	public String getType() {
		return type;
	}

	public String getImgBase64() {
		return imgBase64;
	}

	public int getViews() {
		return views;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setImgBase64(String imgBase64) {
		this.imgBase64 = imgBase64;
	}

	public void setViews(int views) {
		this.views = views;
	}
}
