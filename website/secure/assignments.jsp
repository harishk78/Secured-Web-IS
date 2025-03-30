<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Current Assignments</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Source+Code+Pro&display=swap')
	;

body {
	font-family: 'Source Code Pro', monospace;
	background: #0a0a0a
		url('https://www.transparenttextures.com/patterns/paw-print.png');
	color: #00ff00;
	margin: 0;
	padding: 20px;
	min-height: 100vh;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	border: 3px solid #00ff00;
	padding: 2rem;
	box-shadow: 0 0 20px rgba(0, 255, 0, 0.3);
}

.target-profile {
	text-align: center;
	margin-bottom: 2rem;
}

.target-image {
	width: 200px;
	border: 2px solid #ff0000;
	border-radius: 5px;
	margin: 1rem 0;
	pointer-events: none;
}

.mission-type {
	color: white;
	font-size: 1.2rem;
	margin: 1rem 0;
}

.intel-section {
	border: 1px dashed #00ff00;
	padding: 1rem;
	margin: 1rem 0;
}

.submit-btn {
    background: #001100;
    color: #00ff00;
    border: 2px solid #00ff00;
    padding: 10px 30px;
    margin: 1rem 0;
    cursor: pointer;
    transition: all 0.3s;
    grid-column: span 2;
}

.submit-btn:hover {
    background: #00ff00;
    color: #001100;
    box-shadow: 0 0 15px rgba(0, 255, 0, 0.5);
}

.logout-btn {
    background: #001100;
    color: #ff0000;
    border: 2px solid #ff0000;
    padding: 10px 30px;
	margin: 1rem 0;
    cursor: pointer;
    transition: all 0.3s;
}

.logout-btn:hover {
    background: #ff0000;
    color: #001100;
}

</style>
<script>
        // Security scripts from other pages
        window.onbeforeprint = function() {
            alert("Printing is disabled for this page.");
            return false;
        };
        document.addEventListener('contextmenu', function(e) {
            e.preventDefault();
            alert("Right-click is disabled.");
        });
        document.addEventListener('selectstart', function(e) {
            e.preventDefault();
        });

		document.addEventListener('keydown', function (event) {
        // Check for Cmd + U (Mac) or Ctrl + U (Windows/Linux)
        if ((event.metaKey || event.ctrlKey) && event.key === 'u') {
            event.preventDefault(); // Prevent the default behavior
            alert('Viewing page source is disabled.'); // Optional: Show a message
        }
    });
		
    </script>
    
    <style type="text/css" media="print">
    body { visibility: hidden; display: none }
	</style>

</head>
<body>
	<%
        //Scriplet adds no caching so that once a user is logged out they arent able to log back in
        //Security requirement 1
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        
        // Session check if the user or session are null then redirect them to login
        if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login page
        }
    %>

	<div class="container">
		<div class="target-profile">
			<h1>ACTIVE TARGET PROFILE</h1>
			<div class="mission-type">OPERATION: RECONNAISSANCE</div>
			<img src="${pageContext.request.contextPath}/secureImage?name=mrbig.png" oncontextmenu="return false;">
			<h2>"MR. BIG"</h2>
			<h3 style="color: white;">Crime Lord</h3>
		</div>

		<div class="intel-section">
			<h3>KNOWN CRIMES:</h3>
			<p>
				▶ Illegal cheese trafficking<br> 
				▶ Black market deals<br>
				▶ Extortion<br>
		</div>		
		

		<div class="intel-section">
			<h3>LAST KNOWN WHEREABOUTS:</h3>
			<p>
				▶ Underground market<br> 
				▶ Coordinates: 40.7128° N, 74.0060° W<br>
		</div>

		<div class="intel-section">
			<h3>ADDITIONAL NOTES:</h3>
			<p>
				▶ Has a vast underground information network <br>
				▶ Highly intelligent<br> 
				▶ One daughter: Fru<br>
				▶ Weakness: Family
			</p>
		</div>

		<div
        	style="margin-top: 2rem; display: flex; gap: 1rem; justify-content: center;">
			<form action="${pageContext.request.contextPath}/Logout" method="post" style="display: inline;">
				<button type="submit" class="logout-btn">TERMINATE SESSION</button>
			</form>
			<button class="submit-btn" onclick="window.location='${pageContext.request.contextPath}/forward?page=dashboard&token=${sessionScope.token}'">RETURN
				TO DASHBOARD</button>
		</div>
	</div>
</body>
</html>