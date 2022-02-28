package model.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.Collection;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class BookDataGetting {
	private String imgBase64;
	private InputStream bookDataInput;

	public BookDataGetting(HttpServletRequest request) {
		try {
			Collection<Part> parts = request.getParts();
			for (Part part : parts) {
				String fileName = extractFileName(part);
				System.out.println(fileName);
				if (fileName != null && fileName.length() > 0) {
					StringTokenizer stoken = new StringTokenizer(fileName, ".");
					stoken.nextToken();
					if (stoken.nextToken().equals("pdf")) {
						bookDataInput = part.getInputStream();
					} else {
						// chấp nhận ảnh bị lỗi nếu nhập sai định dạng file
						imgBase64 = convertToBase64(part.getInputStream());
					}
				}
			}
		} catch (IOException e) {
			bookDataInput = null;
			imgBase64 = null;
		} catch (ServletException e) {
			bookDataInput = null;
			imgBase64 = null;
		}
	}

	public String getImgBase64() {
		return imgBase64;
	}

	public InputStream getBookDataInput() {
		return bookDataInput;
	}

	private String extractFileName(Part part) {
		// form-data; name="file"; filename="C:\file1.zip"
		// form-data; name="file"; filename="C:\Note\file2.zip"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				// C:\file1.zip
				// C:\Note\file2.zip
				String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
				clientFileName = clientFileName.replace("\\", "/");
				int i = clientFileName.lastIndexOf('/');
				// file1.zip
				// file2.zip
				return clientFileName.substring(i + 1);
			}
		}
		return null;
	}

	private String convertToBase64(InputStream dataInput) {
		try {
			/*
			 * tạo một mảng byte để chứa dữ liệu nhị phân của ByteArrayOutputStream đọc được
			 * từ InputStream
			 */
			byte[] imgByte;
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int binaryData;
			while ((binaryData = dataInput.read()) != -1)
				baos.write(binaryData);
			imgByte = baos.toByteArray();
			// mã hóa bytes thành base64
			String imgBase64 = Base64.getEncoder().encodeToString(imgByte);
			baos.close();
			dataInput.close();
			return imgBase64;
		} catch (IOException e) {
			return null;
		}

	}
}
