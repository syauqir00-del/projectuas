<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="koneksi.jsp" %>
<%
    String namaMember = request.getParameter("nama_member");
    String jenisKelamin = request.getParameter("jenis_kelamin");
    String tanggalLahir = request.getParameter("tanggal_lahir");
    String alamat = request.getParameter("alamat");
    String noTelepon = request.getParameter("no_telepon");
    String email = request.getParameter("email");

    PreparedStatement ps = null;

    try {
        // Tanggal daftar otomatis = tanggal hari ini
        java.sql.Date tanggalDaftar = new java.sql.Date(new Date().getTime());
        String statusMember = "Aktif";

        String sql = "INSERT INTO member (nama_member, jenis_kelamin, tanggal_lahir, alamat, no_telepon, email, tanggal_daftar, status_member) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, namaMember);
        ps.setString(2, jenisKelamin);
        ps.setString(3, tanggalLahir);
        ps.setString(4, alamat);
        ps.setString(5, noTelepon);
        ps.setString(6, email);
        ps.setDate(7, tanggalDaftar); // tanggal daftar otomatis
        ps.setString(8, statusMember); // status otomatis

        int rows = ps.executeUpdate();
        if (rows > 0) {
            out.println("<script>alert('Member berhasil ditambahkan!'); window.location='member.jsp';</script>");
        } else {
            out.println("<script>alert('Gagal menambahkan member!'); window.location='tambah_member.jsp';</script>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) try { ps.close(); } catch(Exception e) {}
    }
%>
