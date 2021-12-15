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
	var location = "${loc}"
	var result = "${result}";
 	if(result==1) {
	if(confirm(msg)) {
		location.href=location;
		alert(alert);
	} else {
		history.back(); 
	}
 	} else {
 		alert(msg);
 		history.back();
 	}
</script>
</body>
</html>