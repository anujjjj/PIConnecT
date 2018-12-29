

import java.io.IOException;

import java.io.*;
import java.sql.*; 
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Pdf
 */
@WebServlet("/Pdf")
public class Pdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pdf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 /* Create Connection objects */
		        
}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try { Class.forName("com.mysql.jdbc.Driver");
			// loads driver
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms", "root", "123"); // gets a new connection

			PreparedStatement ps = c.prepareStatement(
					"Select * from Event");
			

			ResultSet rs = ps.executeQuery();
     Document report = new Document();
     PdfWriter.getInstance(report, new FileOutputStream("../pdf_report.pdf"));
     report.open();            
     //we have four columns in our table
     PdfPTable report_table = new PdfPTable(5);
     //create a cell object
     PdfPCell table_cell;
    
  Paragraph re=new Paragraph("Event Report");
  re.setAlignment(Element.ALIGN_CENTER);
     report.add(Chunk.NEWLINE);
     table_cell=new PdfPCell(new Phrase("Event Name"));
     report_table.addCell(table_cell); 
     table_cell=new PdfPCell(new Phrase("Start Date"));
     report_table.addCell(table_cell);  
     table_cell=new PdfPCell(new Phrase("End Date"));
     report_table.addCell(table_cell);  
     table_cell=new PdfPCell(new Phrase("Last Date for volunteer"));
     report_table.addCell(table_cell);  
     table_cell=new PdfPCell(new Phrase("Last Date for Registration"));
     report_table.addCell(table_cell);
    
     while (rs.next()) {          
				
				
	        	  String eventName = rs.getString("eventName");
                     table_cell=new PdfPCell(new Phrase(eventName));
                    report_table.addCell(table_cell);
     				String startDate = rs.getString("startDate");
                     table_cell=new PdfPCell(new Phrase(startDate));
                    report_table.addCell(table_cell);
     				String endDate = rs.getString("endDate");
                     table_cell=new PdfPCell(new Phrase(endDate));
                    report_table.addCell(table_cell);
     				String ldatevol = rs.getString("ldatevol");
                     table_cell=new PdfPCell(new Phrase(ldatevol));
                    report_table.addCell(table_cell);
                     String ldatereg = rs.getString("ldatereg");
                     table_cell=new PdfPCell(new Phrase(ldatereg));
                    report_table.addCell(table_cell);
                     }
     

     
     /* Attach report table to PDF */
    report.add(report_table);                       
    report.close();
     
     /* Close all DB related objects */
     rs.close();
     ps.close(); 
     c.close(); 
     response.sendRedirect("/test2/jsp/super_admin.jsp");
		 }
		 
		 catch (ClassNotFoundException | DocumentException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	}

}
