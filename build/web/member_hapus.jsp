<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>
<%
    // Ambil ID member dari parameter URL atau form
    String idMember = request.getParameter("id_member");

    if (idMember == null || idMember.isEmpty()) {
        out.println("<script>alert('ID member tidak ditemukan!'); window.location='member.jsp';</script>");
        return;
    }

    PreparedStatement ps = null;

    try {
        // Query hapus member berdasarkan ID
        String sql = "DELETE FROM member WHERE id_member = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(idMember));

        int rows = ps.executeUpdate();
        if (rows > 0) {
            out.println("<script>alert('Member berhasil dihapus!'); window.location='member.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal menghapus member! ID tidak ditemukan.'); window.location='member.jsp';</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) try { ps.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
