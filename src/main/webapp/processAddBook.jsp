<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\codingWorkspace\\JspWorkspace\\BookMarket\\src\\main\\webapp\\resources\\images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	String fileName = multi.getFilesystemName("BookImage");
	

	
	int price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	BookRepository dao = BookRepository.getInstance();			

	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setPublisher(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	
	System.out.println("File Parameter Name: " + filename);
	System.out.println("Uploaded File Name: " + fileName);
	System.out.println("Real Path: " + realFolder);
	
	newBook.setFilename(fileName);

	dao.addBook(newBook);

	response.sendRedirect("books.jsp");

%>
