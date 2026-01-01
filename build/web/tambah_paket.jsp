<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {

    String namaPaket = request.getParameter("nama_paket");
    int durasiBulan = Integer.parseInt(request.getParameter("durasi_bulan"));
    double harga = Double.parseDouble(request.getParameter("harga"));

    PreparedStatement ps = null;

    try {
        String sql = "INSERT INTO paket (nama_paket, durasi_bulan, harga) VALUES (?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, namaPaket);
        ps.setInt(2, durasiBulan);
        ps.setDouble(3, harga);

        int rows = ps.executeUpdate();

        if (rows > 0) {
            out.println("<script>alert('Paket berhasil ditambahkan'); window.location='paketgym.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal menambahkan paket');</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
}
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Paket Gym</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container register-container">
    <h2>Tambah Paket Gym</h2>

    <form method="post">
        <div class="input-group">
            <label>Nama Paket</label>
            <input type="text" name="nama_paket" required>
        </div>

        <div class="input-group">
            <label>Durasi (Bulan)</label>
            <input type="number" name="durasi_bulan" placeholder="Contoh: 1 / 3 / 6" required>
        </div>

        <div class="input-group">
            <label>Harga (Rp)</label>
            <input type="number" name="harga" required>
        </div>

        <button type="submit">Tambah Paket</button>
    </form>
</div>

</body>
</html>