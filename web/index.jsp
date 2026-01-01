<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gym FitLife</title>
    <link rel="stylesheet" href="landing.css">
</head>
<body>

<!-- Navbar -->
<header>
    <div class="container">
        <h1 class="logo">Gym FitLife</h1>
        <nav>
            <ul>
                <li><a href="#home">Beranda</a></li>
                <li><a href="#services">Layanan</a></li>
                <li><a href="#packages">Paket</a></li>
                <li><a href="#contact">Kontak</a></li>
                <li><a href="login_member.jsp" class="btn-login">Login</a></li>
            </ul>
        </nav>
    </div>
</header>

<!-- Hero Section -->
<section id="home" class="hero">
    <div class="container hero-content"style="color: black">
        <h2 >Capai Kebugaran Maksimalmu</h2>
        <p>Bergabunglah dengan Gym FitLife dan raih tubuh sehat serta bugar dengan program latihan terbaik.</p>
        <a href="register.jsp" class="btn-primary">Daftar Sekarang</a>
    </div>
</section>

<!-- Layanan -->
<section id="services" class="services">
    <div class="container">
        <h2>Layanan Kami</h2>
        <div class="service-cards">
            <div class="card">
                <h3>Personal Training</h3>
                <p>Latihan khusus bersama trainer profesional untuk hasil optimal.</p>
            </div>
            <div class="card">
                <h3>Kelas Group</h3>
                <p>Bergabung dalam kelas aerobik, yoga, zumba, dan banyak lagi.</p>
            </div>
            <div class="card">
                <h3>Fasilitas Lengkap</h3>
                <p>Alat gym modern, locker, sauna, dan area kardio lengkap.</p>
            </div>
        </div>
    </div>
</section>

<!-- Paket -->
<section id="packages" class="packages">
    <div class="container">
        <h2>Paket Keanggotaan</h2>
        <div class="package-cards">
            <div class="card">
                <h3>Paket 1 Bulan</h3>
                <p>Rp 300.000 / bulan</p>
                <a href="login_member.jsp" class="btn-secondary">Daftar</a>
            </div>
            <div class="card">
                <h3>Paket 3 Bulan</h3>
                <p>Rp 850.000 / 3 bulan</p>
                <a href="login_member.jsp" class="btn-secondary">Daftar</a>
            </div>
            <div class="card">
                <h3>Paket 6 Bulan</h3>
                <p>Rp 1.600.000 / 6 bulan</p>
                <a href="login_member.jsp" class="btn-secondary">Daftar</a>
            </div>
        </div>
    </div>
</section>

<!-- Kontak -->
<section id="contact" class="contact">
    <div class="container">
        <h2>Kontak Kami</h2>
        <p>Email: info@gymfitlife.com | Telepon: 0812-3456-7890 | Alamat: Jl. Sehat No.1, Kota Cilegon</p>
        <form action="#" method="post">
            <input type="text" name="nama" placeholder="Nama" required>
            <input type="email" name="email" placeholder="Email" required>
            <textarea name="pesan" placeholder="Pesan" required></textarea>
            <button type="submit">Kirim Pesan</button>
        </form>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <p>&copy; 2025 Gym FitLife. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
