<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert</title>
</head>
<body>
<script>
	var msg = "${msg}";
	var result = "${result}";
	var loc = "${loc}"
 	if(result==1) {
		alert(msg);
		location.href=loc;
	} else if(result==0) {
 		alert(msg);
		history.back(); 
	}
	
</script>
</body>
</html>