<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<%



Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password");

int reg;
String fullname,emailAdd,mobile,gender,dep,add;


reg=Integer.parseInt(request.getParameter("regno"));
fullname=request.getParameter("fullname");
emailAdd=request.getParameter("emailadd");
mobile=request.getParameter("mobile");
gender=request.getParameter("gender");
dep=request.getParameter("department");
add=request.getParameter("address");


String sql="update student1 set Fullname=?,Email=?,mobile=?,gender=?,department=?,address=? where registartionno=?";
PreparedStatement st=conn.prepareStatement(sql);

st.setInt(7, reg);
st.setString(1,fullname);
st.setString(2,emailAdd);
st.setString(3,mobile);
st.setString(4,gender);
st.setString(5,dep);
st.setString(6,add);

st.executeUpdate();
st.close();
conn.close();


%>

<script>

alert("Student updated Successfully");


<%


response.sendRedirect("index.jsp");

%>
</script>










