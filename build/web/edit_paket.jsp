<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
String idPaket = request.getParameter("id_paket");
if (idPaket == null || idPaket.isEmpty()) {
    out.println("<script>alert('ID paket tidak ditemukan'); window.location='paketgym.jsp';</script>");
    return;
}

PreparedStatement ps = null;
ResultSet rs = null;

String namaPaket = "";
int durasiBulan = 0;
double harga = 0;

try {
    String sql = "SELECT * FROM paket WHERE id_paket = ?";
    ps = conn.prepareStatement(sql);
    ps.setInt(1, Integer.parseInt(idPaket));
    rs = ps.executeQuery();

    if (rs.next()) {
        namaPaket = rs.getString("nama_paket");
        durasiBulan = rs.getInt("durasi_bulan");
        harga = rs.getDouble("harga");
    } else {
        out.println("<script>alert('Paket tidak ditemukan'); window.location='paketgym.jsp';</script>");
        return;
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
}
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Paket Gym</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container register-container">
    <h2>Edit Paket Gym</h2>

    <form action="proses_edit_paket.jsp" method="post">
        <input type="hidden" name="id_paket" value="<%= idPaket %>">

        <div class="input-group">
            <label>Nama Paket</label>
            <input type="text" name="nama_paket" value="<%= namaPaket %>" required>
        </div>

        <div class="input-group">
            <label>Durasi (Bulan)</label>
            <input type="number" name="durasi_bulan" value="<%= durasiBulan %>" required>
        </div>

        <div class="input-group">
            <label>Harga (Rp)</label>
            <input type="number" name="harga" value="<%= harga %>" required>
        </div>

        <button type="submit">Update Paket</button>
    </form>
</div>

</body>
</html>