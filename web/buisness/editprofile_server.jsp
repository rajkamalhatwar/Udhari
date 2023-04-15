<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import = "java.sql.*"  %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%
	String path = "A:/Java/Project/basic/udhari/web/buisness/profilepictures"; 
          out.print("jhvcjhsacvjh");
             if (ServletFileUpload.isMultipartContent(request)) 
	{
			try
			{
				
				
				String fname = null;
                                String name = null;
                String about = null;
//				
				//String fsize = null;
				//String ftype = null;
               // String fpath=null;
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						fname = new File(item.getName()).getName();
						// fsize = new Long(item.getSize()).toString();
						//ftype = item.getContentType();
						item.write(new File(path + File.separator+fname));
					                          
					}
                                        
                                      else if(item.getFieldName().equalsIgnoreCase("txtname")){
						name = item.getString();
					}else if(item.getFieldName().equalsIgnoreCase("txtabout")){
						about = item.getString();
					}
					
					//session.setAttribute("sesupload", "File Uploaded Success!!!");
					
					//RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
					// rd.forward(request, response);
                
                }
                
//                  String name = request.getParameter("txtname");
//                  String about = request.getParameter("txtabout");
                String username = (String)session.getAttribute("seslogs");
//                    String name = (String)session.getAttribute("sesname");
//                    String about = (String)session.getAttribute("sesabout");
//                  String username ="rajkamalhatwar@gmail.com";                     
                out.print(username);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udhari","root","");
                String sql = "update tbl_signup set BuisnessName='"+name+"', image='"+fname+"', about='"+about+"' where BuisnessEmail= '"+username+"' ";
                //String sql = "update tb_test set name= '"+txtname.getText()+"', city = '"+cb.getSelectedItem()+"',phone= '"+txtphone.getText()+"', address= '"+txtArea.getText()+"' where id = '"+txtid.getText()+"' ";
                PreparedStatement pst =con.prepareStatement(sql);
                int i = pst.executeUpdate();
                if(i>0){
                	
             	    response.sendRedirect("buisness.jsp");
                }
                
                  
			}catch(Exception ex)
			{
				out.println(" "+ex.getMessage());
			}
	} 
              
        
	


%>
