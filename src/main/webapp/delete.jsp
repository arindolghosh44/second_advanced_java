<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%


int reg=Integer.parseInt(request.getParameter("regno"));
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password");



String sql="delete from student1 where registartionno=?";
PreparedStatement st=conn.prepareStatement(sql);
st.setInt(1, reg);

st.executeUpdate();
st.close();
conn.close();


%>

<script>

alert("Student deleted Successfully");

<%


response.sendRedirect("index.jsp");

%>
</script>




