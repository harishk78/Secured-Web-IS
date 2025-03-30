<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Passport Request</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Source+Code+Pro&display=swap');

body {
    font-family: 'Source Code Pro', monospace;
    background: #0a0a0a url('https://www.transparenttextures.com/patterns/paw-print.png');
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
    background: rgba(0, 20, 0, 0.9);
}

.document-frame {
    border: 2px solid #00ff00;
    padding: 2rem;
    margin: 2rem 0;
    position: relative;
}

.document-frame::before {
    content: "CLASSIFIED DOCUMENT";
    position: absolute;
    top: -10px;
    left: 50%;
    transform: translateX(-50%);
    background: #0a0a0a;
    color: white;
    padding: 0 1rem;
    font-size: 0.9rem;
}

.passport-image {
    width: 300px;
    border: 1px dashed #00ff00;
    margin: 1rem 0;
    padding: 10px;
    pointer-events: none;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 1rem;
    margin: 2rem 0;
    align-items: center;
}

.input-group {
    border: 1px solid #00ff00;
    padding: 1rem;
    position: relative;
}

.input-group label {
    display: block;
    color: white;
    margin-bottom: 0.5rem;
    font-size: 0.9rem;
}

input[type="text"] {
    width: 70%;
    padding: 8px;
    background: #001100;
    border: 1px solid #00ff00;
    color: #00ff00;
    font-family: inherit;
    text-align: center;
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

.confirmation {
    color: WHITE;
    border: 1px dashed #00ff00;
    padding: 1rem;
    margin: 1rem 0;
    display: none;
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

.status-bar {
    border-top: 1px dashed #00ff00;
    margin-top: 2rem;
    padding-top: 1rem;
    color: white;
    font-size: 0.9rem;
}
</style>
<script>
    // Security scripts
    window.onbeforeprint = () => { alert("Printing disabled"); return false; };
    document.addEventListener('contextmenu', e => e.preventDefault());
    document.addEventListener('selectstart', e => e.preventDefault());

    document.addEventListener('keydown', function (event) {
        // Check for Cmd + U (Mac) or Ctrl + U (Windows/Linux)
        if ((event.metaKey || event.ctrlKey) && event.key === 'u') {
            event.preventDefault(); // Prevent the default behavior
            alert('Viewing page source is disabled.'); // Optional: Show a message
        }
    });

    function handleSubmission(e) {
        e.preventDefault();
        const confirmation = document.getElementById("confirmation");
        confirmation.style.display = "block";
        document.getElementById("countryInput").value = "";
        setTimeout(() => {
            confirmation.style.display = "none";
        }, 3000);
        return false;
    }
    
    
</script>

<style type="text/css" media="print">
    body { visibility: hidden; display: none }
</style>


</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        
        if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login page
        }
    %>
    
    

    <div class="container">
        <h1>IDENTITY DOCUMENT REQUEST</h1>
        
        <div class="document-frame">
            <img src="${pageContext.request.contextPath}/secureImage?name=passport.png" class="passport-image" oncontextmenu="return false;">
                 

            <form onsubmit="return handleSubmission(event)">
                <div class="form-grid">
                    <div class="input-group">
                        <label>TARGET NATIONALITY</label>
                        <input type="text" id="countryInput" 
                               placeholder="COUNTRY CODE" 
                               required
                               pattern="[A-Z]{3}"
                               title="3-letter country code">
                    </div>
                    
                    <div class="input-group">
                        <label>COVER IDENTITY</label>
                        <input type="text" 
                               placeholder="AUTO-GENERATED" 
                               disabled
                               value="«███████»">
                    </div>
                </div>

                <button type="submit" class="submit-btn">
                    GENERATE DOCUMENTATION
                </button>
                
                <div id="confirmation" class="confirmation">
                    DOCUMENTS REQUESTED<br>
                    CODE NAME: "SARAH MARTIN"
                </div>
            </form>
        </div>

        <div class="status-bar">
            CURRENT CLEARANCE: LEVEL 4<br>
            LAST UPDATE: <%= new java.util.Date().toString() %>
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