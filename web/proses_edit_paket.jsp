<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
int idPaket = Integer.parseInt(request.getParameter("id_paket"));
String namaPaket = request.getParameter("nama_paket");
int durasiBulan = Integer.parseInt(request.getParameter("durasi_bulan"));
double harga = Double.parseDouble(request.getParameter("harga"));

PreparedStatement ps = null;

try {
    String sql = "UPDATE paket SET nama_paket=?, durasi_bulan=?, harga=? WHERE id_paket=?";
    ps = conn.prepareStatement(sql);
    ps.setString(1, namaPaket);
    ps.setInt(2, durasiBulan);
    ps.setDouble(3, harga);
    ps.setInt(4, idPaket);

    ps.executeUpdate();
    out.println("<script>alert('Paket berhasil diupdate'); window.location='paketgym.jsp';</script>");

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (ps != null) ps.close();
    if (conn != null) conn.close();
}
%>