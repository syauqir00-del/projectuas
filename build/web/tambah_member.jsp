<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Member Gym</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container register-container">
    <h2>Tambah Member Gym</h2>
    <form action="proses_tambah_member.jsp" method="post">
        <div class="input-group">
            <label>Nama Member</label>
            <input type="text" name="nama_member" placeholder="Masukkan nama member" required>
        </div>
        <div class="input-group">
            <label>Jenis Kelamin</label>
            <select name="jenis_kelamin" required>
                <option value="">-- Pilih Jenis Kelamin --</option>
                <option value="Laki-laki">Laki-laki</option>
                <option value="Perempuan">Perempuan</option>
            </select>
        </div>
        <div class="input-group">
            <label>Tanggal Lahir</label>
            <input type="date" name="tanggal_lahir" required>
        </div>
        <div class="input-group">
            <label>Alamat</label>
            <textarea name="alamat" placeholder="Masukkan alamat" required></textarea>
        </div>
        <div class="input-group">
            <label>No. Telepon</label>
            <input type="text" name="no_telepon" placeholder="Masukkan nomor telepon" required>
        </div>
        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="Masukkan email" required>
        </div>
      
        <button type="submit">Tambah Member</button>
    </form>
</div>

</body>
</html>
