<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CIA Login</title>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Source+Code+Pro&display=swap');

body {
    font-family: 'Source Code Pro', 'Courier New', monospace;
    background: #0a0a0a
        url('https://www.transparenttextures.com/patterns/paw-print.png');
    color: #00ff00;
    margin: 0;
    padding: 20px;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.login-container {
    background: rgba(0, 20, 0, 0.9);
    padding: 2rem;
    border-radius: 10px;
    border: 3px solid #00ff00;
    box-shadow: 0 0 20px rgba(0, 255, 0, 0.3);
    max-width: 400px;
    width: 100%;
    text-align: center;
}

.ascii-cat {
    font-family: 'Courier New', monospace;
    color: white;
    font-size: 26px; 
    text-align: center;
    margin-bottom: 10px;
    white-space: pre;
    transform: scale(1.5); 
    display: inline-block; 
}


h1 {
    color: white;
    font-size: 2rem;
    margin-bottom: 1.5rem;
    text-shadow: 0 0 10px rgba(255, 105, 180, 0.5);
}

input[type="text"], input[type="password"] {
    width: 80%;
    padding: 10px;
    margin: 10px 0;
    background: #001100;
    border: 2px solid #00ff00;
    color: #00ff00;
    font-family: 'Courier New', monospace;
    border-radius: 5px;
    transition: all 0.3s;
}

input[type="submit"] {
    background: none;
    color: white;
    padding: 10px 30px;
    border: 2px solid #00ff00;
    border-radius: 5px;
    font-family: 'Courier New', monospace;
    font-weight: bold;
    cursor: pointer;
    margin-top: 1rem;
    transition: all 0.3s;
}

input[type="submit"]:hover {
    background: #00ff00;
    box-shadow: 0 0 15px rgba(255, 105, 180, 0.5);
}

.classified-text {
    font-size: 0.7rem;
    color: #ff0000;
    opacity: 0.7;
    margin-top: 2rem;
}

.error-message {
    color: #ff0000;
    margin: 10px 0;
    font-size: 0.9rem;
    text-shadow: 0 0 10px rgba(255, 0, 0, 0.5);
    animation: blink 1s infinite;
}

@keyframes blink {
    0% { opacity: 1; }
    50% { opacity: 0.5; }
    100% { opacity: 1; }
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
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
    %>

    <div class="login-container">
        <pre class="ascii-cat">
 /\_/\  
 (⌐■_■)  
        </pre>
       
        <h1>
            THE CAT INTELLIGENCE AGENCY (CIA) <br/><br/>Secure Portal
        </h1>

        <form action="LoginServlet" method="post">
            <input type="text" name="user" placeholder="AgentID" required><br>
            <input type="password" name="pass" placeholder="••••••••••" required><br>
            <input type="submit" value="ENTER">
            
            <%-- Error message display --%>
            <% if(request.getAttribute("error") != null) { %>
                <div class="error-message">ACCESS DENIED</div>
            <% } %>
        </form>

        <div class="classified-text">
            SECURITY LEVEL: HIGHLY CLASSIFIED<br> AUTHORIZED PERSONNEL ONLY<br>
        </div>
    </div>
</body>
</html>