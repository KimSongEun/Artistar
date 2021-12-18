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
	var alertGo1 = "${alert1}";
	var alertGo2 = "${alert2}";
	var loc1 = "${loc1}"
	var loc2 = "${loc2}"
	var result = "${result}";
 	if(result==1) {
 	if(confirm(msg)==true) {
		alert(alertGo1); 
		if(confirm(alertGo2)==true) {
 			location.href=loc1;
		} else {
			location.href=loc2;
		}
	} else {
		history.back(); 
	} 
 	} else if(result==0) {
 		alert(msg);
 	}
</script>
</body>
</html>