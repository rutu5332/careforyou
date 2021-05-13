<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	//out.println("Hellooo");

%>
<button onclick="fun(5)">click here</button>

</body>
<script>
function fun(f1)
{
	if(f1 == 5)
		{
			
			window.location.href="a2.jsp?id="+f1+"&id2="+'update';
		}	
}


</script>
</html>