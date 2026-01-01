<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Member Gym</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container login-container">
    <h2>Login Gym</h2>
    <form action="proseslogin.jsp" method="post">
        <div class="input-group">
            <label>Username</label>
            <input type="text" name="username" required>
        </div>
        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <button type="submit">Login</button>
    </form>
</div>


</body>
</html>

