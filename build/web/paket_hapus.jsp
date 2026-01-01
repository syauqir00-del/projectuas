<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>
<%
    String idPaket = request.getParameter("id_paket");

    if(idPaket == null || idPaket.trim().isEmpty()){
        out.println("<script>alert('ID paket tidak ditemukan!'); window.location='paket.jsp';</script>");
        return;
    }

    PreparedStatement ps = null;

    try {
        // Delete permanen
        String sql = "DELETE FROM paket WHERE id_paket = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(idPaket));

        int rows = ps.executeUpdate();
        if(rows > 0){
            out.println("<script>alert('Paket berhasil dihapus!'); window.location='paketgym.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal menghapus paket! ID tidak ditemukan.'); window.location='paketgym.jsp';</script>");
        }

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) try { ps.close(); } catch(Exception e){}
        if(conn != null) try { conn.close(); } catch(Exception e){}
    }
%>
