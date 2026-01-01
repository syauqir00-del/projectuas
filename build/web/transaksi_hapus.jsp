<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>
<%
    String idTransaksi = request.getParameter("id_transaksi");

    if(idTransaksi == null || idTransaksi.trim().isEmpty()){
        out.println("<script>alert('ID transaksi tidak ditemukan!'); window.location='transaksi.jsp';</script>");
        return;
    }

    PreparedStatement ps = null;
    try{
        String sql = "DELETE FROM transaksi WHERE id_transaksi = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(idTransaksi));

        int rows = ps.executeUpdate();
        if(rows>0){
            out.println("<script>alert('Transaksi berhasil dihapus!'); window.location='transaksi.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal menghapus transaksi! ID tidak ditemukan.'); window.location='transaksi.jsp';</script>");
        }
    }catch(Exception e){
        out.println("Error: " + e.getMessage());
    }finally{
        if(ps != null) try{ ps.close(); } catch(Exception e){}
        if(conn != null) try{ conn.close(); } catch(Exception e){}
    }
%>
