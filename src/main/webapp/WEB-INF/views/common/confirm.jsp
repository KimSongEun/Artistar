<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm</title>
</head>
<body>
<script>
	var msg = "${msg}";
	var alert = "${alert}";
	var loc = "${loc}"
	var result = "${result}";
 	if(result==1) {
 	if(confirm(msg)==true) {
 		location.href=loc;
		alert(alert); 
	} else {
		history.back(); 
	} 
 	} else if(result==0) {
 		alert(msg);
 	}
</script>
</body>
</html>