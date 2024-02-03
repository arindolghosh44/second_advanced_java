<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("images/18963844186_914b489d31_h-1024x683.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>




<meta charset="ISO-8859-1">
<title>JSP Web Application</title>
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div  class="container-fluid back-img">



<div class="header">
	<h1>Student <span>Management</span> App</h1>
	
</div>

<%

int regno=Integer.parseInt(request.getParameter("regno"));


Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password");



String sql="select * from student1 where registartionno=?";
PreparedStatement st=conn.prepareStatement(sql);
st.setInt(1,regno);
ResultSet rs=st.executeQuery();




String fullname="";
String email="";
String mobile="";
String gender="";
String dep="";
String add="";
if(rs.next()){
	
	fullname=rs.getString(2);
	email=rs.getString(3);
	mobile=rs.getString(4);

	gender=rs.getString(5);
	dep=rs.getString(6);
	add=rs.getString(7);
	
	
}

st.close();
conn.close();


%>




<div class="popup" id="popup">
	<div class="title">
		<h2>Update Student</h2>
	</div>
	<form   method="post"  action="update.jsp">
		<div class="field">
			<label>Registration No</label>
			<input type="number" value="<%=regno %>" name="regno" required readonly>
		</div>
		<div class="field">
			<label>Full Name</label>
			<input type="text" value="<%=fullname %>" name="fullname" required>
		</div>
		<div class="field">
			<label>Email Address</label>
			<input type="email" name="emailadd" value="<%=email %>" required>
		</div>
		<div class="field">
			<label>Mobile No</label>
			<input type="number" maxlength="10" value="<%=mobile %>"  name="mobile" required>
		</div>
		<div class="field">
			<label>Gender</label>
			<select name="gender">
				<option value=""  ><%=gender%></option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
			</select>
		</div>
		<div class="field">
			<label>Department</label>
			<select name="department">
				<option value="" ><%=dep%></option>
				<option value="IT">IT</option>
				<option value="CSE">CSE</option>
				<option value="AIML">AIML</option>
				<option value="CSBS">CSBS</option>
			</select>
		</div>
		<div class="textarea-field">
			<label>Address</label>
			<textarea name="address"><%=add %></textarea>
		</div>
		<div class="action-field">
			<input type="submit" value="update Student">
		</div>
		
	
	</form>


</div>
</div>


</body>
</html>