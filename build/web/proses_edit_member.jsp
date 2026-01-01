<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>
<%
    String idMember = request.getParameter("id_member");
    String namaMember = request.getParameter("nama_member");
    String jenisKelamin = request.getParameter("jenis_kelamin");
    String tanggalLahir = request.getParameter("tanggal_lahir");
    String alamat = request.getParameter("alamat");
    String noTelepon = request.getParameter("no_telepon");
    String email = request.getParameter("email");

    PreparedStatement ps = null;

    try {
        String sql = "UPDATE member SET nama_member=?, jenis_kelamin=?, tanggal_lahir=?, alamat=?, no_telepon=?, email=? WHERE id_member=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, namaMember);
        ps.setString(2, jenisKelamin);
        ps.setDate(3, java.sql.Date.valueOf(tanggalLahir));
        ps.setString(4, alamat);
        ps.setString(5, noTelepon);
        ps.setString(6, email);
        ps.setInt(7, Integer.parseInt(idMember));

        int rows = ps.executeUpdate();
        if(rows > 0){
            out.println("<script>alert('Member berhasil diupdate!'); window.location='member.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal update member!'); window.location='member.jsp';</script>");
        }
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) try { ps.close(); } catch(Exception e){}
        if(conn != null) try { conn.close(); } catch(Exception e){}
    }
%>

