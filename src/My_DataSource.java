

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/My_DataSource")
public class My_DataSource extends javax.servlet.http.HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/plain; charset=UTF-8");
		PrintWriter out = res.getWriter();

		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/tibamountain");
			if (ds != null) {
				Connection conn = ds.getConnection();

				if (conn != null) {
					out.println("Got Connection: " + conn.toString());
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select * from member_list");
					while(rs.next()) {
						out.println("memberId = " + rs.getString(1));
					}
					conn.close();
				}

			}

		} catch (NamingException e) {
			e.getStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
