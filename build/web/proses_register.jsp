<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
String nama   = request.getParameter("nama_member");
String jk     = request.getParameter("jenis_kelamin");
String tgl    = request.getParameter("tanggal_lahir");
String alamat = request.getParameter("alamat");
String telp   = request.getParameter("no_telepon");
String email  = request.getParameter("email");

PreparedStatement ps = null;
ResultSet rs = null;

try {
    // Cek email sudah terdaftar atau belum
    String cekSql = "SELECT id_member FROM member WHERE email=?";
    ps = conn.prepareStatement(cekSql);
    ps.setString(1, email);
    rs = ps.executeQuery();

    if (rs.next()) {
        out.println("<script>alert('Email sudah terdaftar'); window.location='register.jsp';</script>");
        return;
    }
    rs.close();
    ps.close();

    // Insert member baru
    String sql =
        "INSERT INTO member " +
        "(nama_member, jenis_kelamin, tanggal_lahir, alamat, no_telepon, email, tanggal_daftar, status_member) " +
        "VALUES (?,?,?,?,?,?,CURDATE(),'Aktif')";

    ps = conn.prepareStatement(sql);
    ps.setString(1, nama);
    ps.setString(2, jk);
    ps.setDate(3, java.sql.Date.valueOf(tgl));
    ps.setString(4, alamat);
    ps.setString(5, telp);
    ps.setString(6, email);

    ps.executeUpdate();

    out.println("<script>alert('Register berhasil, silakan login'); window.location='login_member.jsp';</script>");

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
}
%>