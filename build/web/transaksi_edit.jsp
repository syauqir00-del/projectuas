<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
String id = request.getParameter("id_transaksi");
if (id == null) {
    out.println("<script>alert('ID transaksi tidak ditemukan'); window.location='transaksi.jsp';</script>");
    return;
}

int idMember = 0;
int idPaket = 0;
String tanggalMulai = "";
String metode = "";

PreparedStatement ps = null;
ResultSet rs = null;

try {
    String sql = "SELECT * FROM transaksi WHERE id_transaksi=?";
    ps = conn.prepareStatement(sql);
    ps.setInt(1, Integer.parseInt(id));
    rs = ps.executeQuery();

    if (rs.next()) {
        idMember = rs.getInt("id_member");
        idPaket = rs.getInt("id_paket");
        tanggalMulai = rs.getDate("tanggal_mulai").toString();
        metode = rs.getString("metode_pembayaran");
    } else {
        out.println("<script>alert('Transaksi tidak ditemukan'); window.location='transaksi.jsp';</script>");
        return;
    }
} catch (Exception e) {
    out.println(e.getMessage());
}
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Transaksi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="auth-container register-container">
    <h2>Edit Transaksi</h2>

    <form action="proses_edit_transaksi.jsp" method="post">
        <input type="hidden" name="id_transaksi" value="<%= id %>">

        <!-- Member -->
        <div class="input-group">
            <label>Member</label>
            <select name="id_member" required>
                <%
                    String sqlM = "SELECT * FROM member";
                    ps = conn.prepareStatement(sqlM);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                %>
                <option value="<%= rs.getInt("id_member") %>"
                    <%= rs.getInt("id_member") == idMember ? "selected" : "" %>>
                    <%= rs.getString("nama_member") %>
                </option>
                <%
                    }
                    rs.close(); ps.close();
                %>
            </select>
        </div>

        <!-- Paket -->
        <div class="input-group">
            <label>Paket</label>
            <select name="id_paket" required>
                <%
                    String sqlP = "SELECT * FROM paket";
                    ps = conn.prepareStatement(sqlP);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                %>
                <option value="<%= rs.getInt("id_paket") %>"
                    <%= rs.getInt("id_paket") == idPaket ? "selected" : "" %>>
                    <%= rs.getString("nama_paket") %>
                </option>
                <%
                    }
                    rs.close(); ps.close();
                %>
            </select>
        </div>

        <!-- Tanggal Mulai -->
        <div class="input-group">
            <label>Tanggal Mulai</label>
            <input type="date" name="tanggal_mulai" value="<%= tanggalMulai %>" required>
        </div>

        <!-- Metode -->
        <div class="input-group">
            <label>Metode Pembayaran</label>
            <select name="metode_pembayaran" required>
                <option value="Cash" <%= "Cash".equals(metode) ? "selected" : "" %>>Cash</option>
                <option value="Transfer" <%= "Transfer".equals(metode) ? "selected" : "" %>>Transfer</option>
            </select>
        </div>

        <button type="submit">Update Transaksi</button>
    </form>
</div>

</body>
</html>