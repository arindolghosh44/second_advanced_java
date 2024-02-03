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


String sql="insert into student1 (registartionno,Fullname,Email,mobile,gender,department,address)values (?,?,?,?,?,?,?)";
PreparedStatement st=conn.prepareStatement(sql);

st.setInt(1, reg);
st.setString(2,fullname);
st.setString(3,emailAdd);
st.setString(4,mobile);
st.setString(5,gender);
st.setString(6,dep);
st.setString(7,add);

st.executeUpdate();
st.close();
conn.close();


%>

<script>

alert("Student register Successfully");
<%


response.sendRedirect("index.jsp");

%>
</script>










