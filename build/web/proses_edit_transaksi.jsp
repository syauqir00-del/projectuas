<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
int idTransaksi = Integer.parseInt(request.getParameter("id_transaksi"));
int idMember = Integer.parseInt(request.getParameter("id_member"));
int idPaket = Integer.parseInt(request.getParameter("id_paket"));
String tanggalMulaiStr = request.getParameter("tanggal_mulai");
String metode = request.getParameter("metode_pembayaran");

PreparedStatement ps = null;
ResultSet rs = null;

try {
    // Ambil durasi & harga paket
    String sqlPaket = "SELECT durasi_bulan, harga FROM paket WHERE id_paket=?";
    ps = conn.prepareStatement(sqlPaket);
    ps.setInt(1, idPaket);
    rs = ps.executeQuery();
    rs.next();

    int durasi = rs.getInt("durasi_bulan");
    double harga = rs.getDouble("harga");

    rs.close(); ps.close();

    // Hitung tanggal selesai
    java.sql.Date tanggalMulai = java.sql.Date.valueOf(tanggalMulaiStr);
    java.util.Calendar cal = java.util.Calendar.getInstance();
    cal.setTime(tanggalMulai);
    cal.add(java.util.Calendar.MONTH, durasi);
    java.sql.Date tanggalSelesai =
        new java.sql.Date(cal.getTimeInMillis());

    // Update transaksi
    String sqlUpdate =
        "UPDATE transaksi SET " +
        "id_member=?, id_paket=?, tanggal_mulai=?, tanggal_selesai=?, total_bayar=?, metode_pembayaran=? " +
        "WHERE id_transaksi=?";

    ps = conn.prepareStatement(sqlUpdate);
    ps.setInt(1, idMember);
    ps.setInt(2, idPaket);
    ps.setDate(3, tanggalMulai);
    ps.setDate(4, tanggalSelesai);
    ps.setDouble(5, harga);
    ps.setString(6, metode);
    ps.setInt(7, idTransaksi);

    ps.executeUpdate();

    out.println("<script>alert('Transaksi berhasil diupdate'); window.location='transaksi.jsp';</script>");

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
}
%>