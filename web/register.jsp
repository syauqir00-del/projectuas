<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Register Member</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container">
    <h2>Register Member</h2>

    <form action="proses_register.jsp" method="post">
        <div class="input-group">
            <label>Nama Lengkap</label>
            <input type="text" name="nama_member" required>
        </div>

        <div class="input-group">
            <label>Jenis Kelamin</label>
            <select name="jenis_kelamin" required>
                <option value="">Pilih</option>
                <option>Laki-laki</option>
                <option>Perempuan</option>
            </select>
        </div>

        <div class="input-group">
            <label>Tanggal Lahir</label>
            <input type="date" name="tanggal_lahir" required>
        </div>

        <div class="input-group">
            <label>Alamat</label>
            <textarea name="alamat" rows="2" required></textarea>
        </div>

        <div class="input-group">
            <label>No Telepon</label>
            <input type="text" name="no_telepon" required>
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <button type="submit">Register</button>
    </form>

    <div class="auth-link">
        Sudah punya akun? <a href="login_member.jsp">Login</a>
    </div>
</div>
</body>
</html>