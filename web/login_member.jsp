<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Member</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container">
    <h2>Login Member</h2>

    <form action="proses_login_member.jsp" method="post">

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="Masukkan email" required>
        </div>

        <button type="submit">Login</button>
    </form>

    <div class="auth-link">
        Belum punya akun? <a href="register.jsp">Register</a>
    </div>
</div>

</body>
</html>