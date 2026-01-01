<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
/* Proteksi login */
if (session.getAttribute("id_member") == null) {
    response.sendRedirect("login.jsp");
    return;
}

int idMember = (Integer) session.getAttribute("id_member");

PreparedStatement ps = null;
ResultSet rs = null;

String namaMember = "";
String statusMember = "";
String namaPaket = "-";
String tglMulai = "-";
String tglSelesai = "-";
String statusPaket = "Belum Ada Paket";

try {
    /* Ambil data member */
    String sqlMember =
        "SELECT nama_member, status_member FROM member WHERE id_member=?";
    ps = conn.prepareStatement(sqlMember);
    ps.setInt(1, idMember);
    rs = ps.executeQuery();

    if (rs.next()) {
        namaMember = rs.getString("nama_member");
        statusMember = rs.getString("status_member");
    }
    rs.close();
    ps.close();

    /* Ambil transaksi terakhir */
    String sqlPaket =
        "SELECT p.nama_paket, t.tanggal_mulai, t.tanggal_selesai " +
        "FROM transaksi t " +
        "JOIN paket p ON t.id_paket=p.id_paket " +
        "WHERE t.id_member=? " +
        "ORDER BY t.id_transaksi DESC LIMIT 1";

    ps = conn.prepareStatement(sqlPaket);
    ps.setInt(1, idMember);
    rs = ps.executeQuery();

    if (rs.next()) {
        namaPaket = rs.getString("nama_paket");
        tglMulai = rs.getDate("tanggal_mulai").toString();
        tglSelesai = rs.getDate("tanggal_selesai").toString();

        java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
        java.sql.Date selesai = rs.getDate("tanggal_selesai");

        if (today.after(selesai)) {
            statusPaket = "Expired";
        } else {
            statusPaket = "Aktif";
        }
    }

} catch (Exception e) {
    out.println(e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
}
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Member</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container">
    <h2>Dashboard Member</h2>

    <p><b>Nama Member:</b> <%= namaMember %></p>
    <p><b>Status Member:</b> <%= statusMember %></p>

    <hr>

    <p><b>Paket:</b> <%= namaPaket %></p>
    <p><b>Tanggal Mulai:</b> <%= tglMulai %></p>
    <p><b>Tanggal Selesai:</b> <%= tglSelesai %></p>
    <p><b>Status Paket:</b> <%= statusPaket %></p>

    <hr>


    

    <a href="logout_member.jsp">
        <button style="margin-top:10px; background:#dc3545;">Logout</button>
    </a>
</div>

</body>
</html>