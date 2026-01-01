<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {

    int idMember = Integer.parseInt(request.getParameter("id_member"));
    int idPaket  = Integer.parseInt(request.getParameter("id_paket"));
    String tanggalMulaiStr = request.getParameter("tanggal_mulai");
    String metode = request.getParameter("metode_pembayaran");

    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // 1. Ambil durasi & harga paket
        String sqlPaket = "SELECT durasi_bulan, harga FROM paket WHERE id_paket=?";
        ps = conn.prepareStatement(sqlPaket);
        ps.setInt(1, idPaket);
        rs = ps.executeQuery();

        if (!rs.next()) {
            out.println("<script>alert('Paket tidak ditemukan');</script>");
            return;
        }

        int durasiBulan = rs.getInt("durasi_bulan");
        double harga = rs.getDouble("harga");

        rs.close();
        ps.close();

        // 2. Hitung tanggal selesai
        java.sql.Date tanggalMulai = java.sql.Date.valueOf(tanggalMulaiStr);
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.setTime(tanggalMulai);
        cal.add(java.util.Calendar.MONTH, durasiBulan);
        java.sql.Date tanggalSelesai =
            new java.sql.Date(cal.getTimeInMillis());

        // 3. Insert transaksi
        String sqlInsert =
            "INSERT INTO transaksi " +
            "(id_member, id_paket, tanggal_mulai, tanggal_selesai, total_bayar, metode_pembayaran) " +
            "VALUES (?,?,?,?,?,?)";

        ps = conn.prepareStatement(sqlInsert);
        ps.setInt(1, idMember);
        ps.setInt(2, idPaket);
        ps.setDate(3, tanggalMulai);
        ps.setDate(4, tanggalSelesai);
        ps.setDouble(5, harga);
        ps.setString(6, metode);

        ps.executeUpdate();

        out.println("<script>alert('Transaksi berhasil ditambahkan'); window.location='transaksi.jsp';</script>");

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (ps != null) try { ps.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
}
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Tambah Transaksi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container register-container">
    <h2>Tambah Transaksi</h2>

    <form method="post">

        <!-- Member -->
        <div class="input-group">
            <label>Member</label>
            <select name="id_member" required>
                <option value="">-- Pilih Member --</option>
                <%
                    try {
                        String sql = "SELECT id_member, nama_member FROM member";
                        PreparedStatement ps = conn.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("id_member") %>">
                    <%= rs.getString("nama_member") %>
                </option>
                <%
                        }
                        rs.close(); ps.close();
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
            </select>
        </div>

        <!-- Paket -->
        <div class="input-group">
            <label>Paket</label>
            <select name="id_paket" required>
                <option value="">-- Pilih Paket --</option>
                <%
                    try {
                        String sql = "SELECT id_paket, nama_paket FROM paket";
                        PreparedStatement ps = conn.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("id_paket") %>">
                    <%= rs.getString("nama_paket") %>
                </option>
                <%
                        }
                        rs.close(); ps.close();
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
            </select>
        </div>

        <!-- Tanggal Mulai -->
        <div class="input-group">
            <label>Tanggal Mulai</label>
            <input type="date" name="tanggal_mulai" required>
        </div>

        <!-- Metode Pembayaran -->
        <div class="input-group">
            <label>Metode Pembayaran</label>
            <select name="metode_pembayaran" required>
                <option value="Cash">Cash</option>
                <option value="Transfer">Transfer</option>
            </select>
        </div>

        <button type="submit">Tambah Transaksi</button>
    </form>
</div>

</body>
</html>