<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Intelligence Briefing</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Source+Code+Pro&display=swap')
	;

body {
	font-family: 'Source Code Pro', monospace;
	background: #0a0a0a;
	color: #00ff00;
	margin: 0;
	padding: 20px;
	min-height: 100vh;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	border: 1px solid #003300;
	padding: 2rem;
}

.intel-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 2rem;
	margin-top: 2rem;
}

.surveillance-card {
	border: 1px solid #004400;
	padding: 1rem;
	background: #001100;
}

.satellite-map {
	width: 100%;
	height: 250px;
	background: #000;
	border: 1px solid #003300;
	margin: 1rem 0;
	position: relative;
}

.map-grid {
	position: absolute;
	width: 100%;
	height: 100%;
	background-image: linear-gradient(#002200 1px, transparent 1px),
		linear-gradient(90deg, #002200 1px, transparent 1px);
	background-size: 20px 20px;
}

.intel-image {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border: 1px solid #003300;
	margin: 1rem 0;
}

.data-table {
	width: 100%;
	border-collapse: collapse;
	margin: 1rem 0;
}

.data-table td {
	padding: 8px;
	border: 1px solid #003300;
}

.status-bar {
	border-top: 1px solid #003300;
	padding-top: 1rem;
	margin-top: 2rem;
	color: white;
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
        // Security scripts
        window.onbeforeprint = () => { alert("Document reproduction prohibited"); return false; };
        document.addEventListener('contextmenu', e => e.preventDefault());
        document.addEventListener('selectstart', e => e.preventDefault());


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

	if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login page
	}
	%>

	<div class="container">
		<h1>OPERATIONS BRIEFING</h1>

		<div class="intel-grid">
			<div class="surveillance-card">
				<h2>LIVE SURVEILLANCE</h2>
				<div class="satellite-map">
					<div class="map-grid"></div>
					<img src="${pageContext.request.contextPath}/secureImage?name=grid.png" class="intel-image"
						oncontextmenu="return false;">
				</div>
				<table class="data-table">
					<tr>
						<td>Last Update</td>
						<td>22:45:17 ZULU</td>
					</tr>
					<tr>
						<td>Grid Coordinates</td>
						<td>48.8584° N, 2.2945° E</td>
					</tr>
					<tr>
						<td>Signal Strength</td>
						<td>87%</td>
					</tr>
				</table>
			</div>

			<div class="surveillance-card">
				<h2>THREAT ASSESSMENT</h2>
					<img src="${pageContext.request.contextPath}/secureImage?name=threatmap.png" class="intel-image"
						oncontextmenu="return false;">
				<table class="data-table">
					<tr>
						<td>Active Targets</td>
						<td>12</td>
					</tr>
					<tr>
						<td>Risk Level</td>
						<td>ELEVATED</td>
					</tr>
					<tr>
						<td>Compromised Nodes</td>
						<td>3</td>
					</tr>
				</table>
			</div>

			<div class="surveillance-card">
				<h2>ASSET STATUS</h2>
					<img src="${pageContext.request.contextPath}/secureImage?name=falcon.png" class="intel-image"
						oncontextmenu="return false;">
				<table class="data-table">
					<tr>
						<td>Asset</td>
						<td>SPY BIRD</td>
					</tr>
					
					<tr>
						<td>Callsign</td>
						<td>FALCON</td>
					</tr>
					<tr>
						<td>Status</td>
						<td>ACTIVE</td>
					</tr>
					<tr>
						<td>Last Contact</td>
						<td>6h 22m ago</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="status-bar">
			INTELLIGENCE CORE STATUS: OPERATIONAL<br> LAST SYSTEM UPDATE:
			<%=new java.util.Date().toString()%>
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