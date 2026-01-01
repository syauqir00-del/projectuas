<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
String email = request.getParameter("email");

PreparedStatement ps = null;
ResultSet rs = null;

try {
    String sql =
        "SELECT id_member, nama_member " +
        "FROM member WHERE email=? AND status_member='Aktif'";

    ps = conn.prepareStatement(sql);
    ps.setString(1, email);
    rs = ps.executeQuery();

    if (rs.next()) {
        // Simpan session
        session.setAttribute("id_member", rs.getInt("id_member"));
        session.setAttribute("nama_member", rs.getString("nama_member"));

        out.println("<script>alert('Login berhasil'); window.location='member_dashboard.jsp';</script>");
    } else {
        out.println("<script>alert('Email tidak terdaftar atau tidak aktif'); window.location='login.jsp';</script>");
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
}
%>