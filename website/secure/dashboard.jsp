<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
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

.agent-header {
	border-bottom: 2px solid #00ff00;
	padding-bottom: 1rem;
	margin-bottom: 2rem;
}

.mission-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 1.5rem;
	margin-top: 2rem;
}

.mission-card {
	background: #001100;
	padding: 1.5rem;
	border: 1px solid #00ff00;
	transition: all 0.3s;
	cursor: pointer;
}

.mission-card:hover {
	box-shadow: 0 0 15px rgba(0, 255, 0, 0.5);
	transform: translateY(-5px);
}

.status-bar {
	color: white;
	margin: 2rem 0;
	padding: 1rem;
	border: 1px dashed #00ff00;
}

.logout-btn {
	background: none;
	color: #ff0000;
	border: 2px solid #ff0000;
	padding: 10px 30px;
	margin-right: 20px;
	margin-top: -40px;
	float: right;
	cursor: pointer;
}

.logout-btn:hover {
	background: #ff0000;
	color: #001100;
}

 @keyframes blink {
     0% { opacity: 1; }
     50% { opacity: 0.5; }
     100% { opacity: 1; }
  }

.blink {
 	 animation: blink 1s infinite;
}

</style>
<script>
        // Prevent printing
        window.onbeforeprint = function() {
            alert("Printing is disabled for this page.");
            return false;
        };

        // Prevent right-click (to block image saving and text copying)
        document.addEventListener('contextmenu', function(e) {
            e.preventDefault();
            alert("Right-click is disabled.");
        });

		
		document.addEventListener('keydown', function (event) {
        // Check for Cmd + U (Mac) or Ctrl + U (Windows/Linux)
        if ((event.metaKey || event.ctrlKey) && event.key === 'u') {
            event.preventDefault(); // Prevent the default behavior
            alert('Viewing page source is disabled.'); // Optional: Show a message
        }
    });

        // Prevent text selection
        document.addEventListener('selectstart', function(e) {
            e.preventDefault();
        });
    </script>
    
    <style type="text/css" media="print">
    body { visibility: hidden; display: none }
	</style>
	
</head>
<body>
	<%
	    // Prevent caching of the dashboard page
	    //Scriplet adds no caching so that once a user is logged out they arent able to log back in
        //Security requirement 1
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setHeader("Expires", "0");
	
	    // Check if the user is logged in
	    if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login page
	    }
	%>


	<div class="container">
		<div class="agent-header">
			<h1>
				Welcome, Agent Snowball<span class="blink">_</span>
			</h1>
			<div class="status-bar">
				Agent ID: 00537 <br> Clearance: Level 4<br> Current Alias:
				"Ryan Smith"
			</div>
		</div>

		<div class="mission-grid">
    		<div class="mission-card" onclick="window.location='${pageContext.request.contextPath}/forward?page=assignments&token=${sessionScope.token}'">    			
    		<h2>Current Assignments</h2>
				<p>1 active operation</p>
				<span style="color: #00eeff">>> ACCESS</span>
			</div>

    		<div class="mission-card" onclick="window.location='${pageContext.request.contextPath}/forward?page=passport&token=${sessionScope.token}'">				
    		<h2>Identity</h2>
				<p>Request a passport</p>
				<span style="color: #00eeff">>> ACCESS</span>
			</div>

    		<div class="mission-card" onclick="window.location='${pageContext.request.contextPath}/forward?page=intel&token=${sessionScope.token}'">				
				<h2>Intel Hub</h2>
				<p>Classified briefings</p>
				<span style="color: #00eeff">>> ACCESS</span>
			</div>
		</div>

		<div style="margin-top: 3rem; color: #ff0000">
			SECURITY STATUS: ENCRYPTED & SECURED<br> ALL COMMUNICATIONS
			MONITORED
		</div>

		<form action="${pageContext.request.contextPath}/Logout" method="post" style="display: inline;">
			<button type="submit" class="logout-btn">TERMINATE SESSION</button>
		</form>
	</div>
</body>
</html>