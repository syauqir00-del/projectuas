<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
if (session.getAttribute("username") == null ||
    !"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("../login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Data Transaksi Gym</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>

<div class="sidebar">
    <h2>GYM ADMIN</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="member.jsp">Data Member</a>
    <a href="paketgym.jsp">Paket Gym</a>
    <a href="transaksi.jsp" class="active">Transaksi</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="content">
    <h1>Data Transaksi Gym</h1>

    <a href="transaksi_tambah.jsp" class="btn">+ Tambah Transaksi</a>

    <table>
        <tr>
            <th>No</th>
            <th>Nama Member</th>
            <th>Paket</th>
            <th>Mulai</th>
            <th>Selesai</th>
            <th>Total Bayar</th>
            <th>Metode</th>
            <th>Aksi</th>
        </tr>

        <%
        String sql =
            "SELECT t.*, m.nama_member, p.nama_paket " +
            "FROM transaksi t " +
            "JOIN member m ON t.id_member = m.id_member " +
            "JOIN paket p ON t.id_paket = p.id_paket " +
            "ORDER BY t.id_transaksi DESC";

        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql);

        int no = 1;
        while (rs.next()) {
        %>
        <tr>
            <td><%= no++ %></td>
            <td><%= rs.getString("nama_member") %></td>
            <td><%= rs.getString("nama_paket") %></td>
            <td><%= rs.getDate("tanggal_mulai") %></td>
            <td><%= rs.getDate("tanggal_selesai") %></td>
            <td>Rp <%= String.format("%,.0f", rs.getDouble("total_bayar")) %></td>
            <td><%= rs.getString("metode_pembayaran") %></td>
            <td>
       <a href="transaksi_edit.jsp?id_transaksi=<%= rs.getInt("id_transaksi") %>" class="btn-edit">
    Edit
</a>

               <a href="transaksi_hapus.jsp?id_transaksi=<%= rs.getInt("id_transaksi") %>" 
   onclick="return confirm('Hapus transaksi ini?')" class="btn-hapus">Hapus</a>

            </td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>

<%
rs.close();
st.close();
conn.close();
%>

