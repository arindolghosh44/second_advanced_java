<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("images/books-1204029_1280.jpg");
	height: 100vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>JSP Web Application</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div  class="container-fluid back-img">



<div class="header">
	<h1>Student <span>Management</span> App</h1>
	<button onclick="toggle()"><i class="fa-solid fa-user-plus"></i>Add Student</button>
</div>

<div class="details">

<table >
  <thead >
<tr>
<th>RegNo</th>
<th>FullName</th>
<th>Email</th>
<th>mobile</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","password");

String sql="select * from student1";
PreparedStatement st=conn.prepareStatement(sql);

ResultSet rs=st.executeQuery();

int regno=0;
String fullname="";
String email="";
String mobile="";
while(rs.next()){
	regno=rs.getInt(1);
	fullname=rs.getString(2);
	email=rs.getString(3);
	mobile=rs.getString(4);
	
	


%>


<tr>
<td><%=regno %></td>
<td><%=fullname %></td>
<td><%=email %></td>
<td><%=mobile %></td>
<td>
<a href="edit.jsp?regno=<%=regno%>" >
<i class="fa-solid fa-pen-to-square"></i>
Edit
</a>


<a href="delete.jsp?regno=<%=regno%>" >
<i class="fa-solid fa-trash"></i>
Delete
</a>



</td>

<tr>

<% }
st.close();
conn.close();

%>

</tbody>


</table>





</div>







<div class="popup" id="popup">
	<div class="title">
		<h2>Add Student</h2>
	</div>
	<form   method="post"  action="studentadd.jsp">
		<div class="field">
			<label>Registration No</label>
			<input type="number"  name="regno" required>
		</div>
		<div class="field">
			<label>Full Name</label>
			<input type="text"  name="fullname" required>
		</div>
		<div class="field">
			<label>Email Address</label>
			<input type="email" name="emailadd"  required>
		</div>
		<div class="field">
			<label>Mobile No</label>
			<input type="number" maxlength="10"  name="mobile" required>
		</div>
		<div class="field">
			<label>Gender</label>
			<select name="gender">
				<option value="" selected>Gender</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
			</select>
		</div>
		<div class="field">
			<label>Department</label>
			<select name="department">
				<option value="" selected>Department</option>
				<option value="IT">IT</option>
				<option value="CSE">CSE</option>
				<option value="AIML">AIML</option>
				<option value="CSBS">CSBS</option>
			</select>
		</div>
		<div class="textarea-field">
			<label>Address</label>
			<textarea name="address"></textarea>
		</div>
		<div class="action-field">
			<input type="submit" value="Add Student">
		</div>
		
	
	</form>


</div>
</div>
<script>
	function toggle(){
		var popup=document.querySelector("#popup")
		if(popup.style.display=='none'){
			popup.style.display='block'
			
		} else{
			popup.style.display='none'
		}
		
	}


</script>

</body>
</html>