<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>
<%
    String idMember = request.getParameter("id_member");
    if(idMember == null || idMember.isEmpty()){
        out.println("<script>alert('ID member tidak ditemukan!'); window.location='member.jsp';</script>");
        return;
    }

    PreparedStatement ps = null;
    ResultSet rs = null;
    String namaMember="", jenisKelamin="", tanggalLahir="", alamat="", noTelepon="", email="";

    try {
        String sql = "SELECT * FROM member WHERE id_member = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(idMember));
        rs = ps.executeQuery();
        if(rs.next()){
            namaMember = rs.getString("nama_member");
            jenisKelamin = rs.getString("jenis_kelamin");
            tanggalLahir = rs.getString("tanggal_lahir");
            alamat = rs.getString("alamat");
            noTelepon = rs.getString("no_telepon");
            email = rs.getString("email");
        } else {
            out.println("<script>alert('Member tidak ditemukan!'); window.location='member.jsp';</script>");
            return;
        }
    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(ps != null) try { ps.close(); } catch(Exception e) {}
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Member</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="auth-container register-container">
    <h2>Edit Member</h2>
    <form action="proses_edit_member.jsp" method="post">
        <input type="hidden" name="id_member" value="<%= idMember %>">
        <div class="input-group">
            <label>Nama Member</label>
            <input type="text" name="nama_member" value="<%= namaMember %>" required>
        </div>
        <div class="input-group">
            <label>Jenis Kelamin</label>
            <select name="jenis_kelamin" required>
                <option value="Laki-laki" <%= "Laki-laki".equals(jenisKelamin) ? "selected" : "" %>>Laki-laki</option>
                <option value="Perempuan" <%= "Perempuan".equals(jenisKelamin) ? "selected" : "" %>>Perempuan</option>
            </select>
        </div>
        <div class="input-group">
            <label>Tanggal Lahir</label>
            <input type="date" name="tanggal_lahir" value="<%= tanggalLahir %>" required>
        </div>
        <div class="input-group">
            <label>Alamat</label>
            <textarea name="alamat" required><%= alamat %></textarea>
        </div>
        <div class="input-group">
            <label>No. Telepon</label>
            <input type="text" name="no_telepon" value="<%= noTelepon %>" required>
        </div>
        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" value="<%= email %>" required>
        </div>
        <button type="submit">Update Member</button>
    </form>
</div>
</body>
</html>

