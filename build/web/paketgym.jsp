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
    <title>Data Paket Gym</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>

<div class="sidebar">
    <h2>GYM ADMIN</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="member.jsp">Data Member</a>
    <a href="paketgym.jsp" class="active">Paket Gym</a>
    <a href="transaksi.jsp">Transaksi</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="content">
    <h1>Data Paket Gym</h1>

    <a href="tambah_paket.jsp" class="btn">+ Tambah Paket</a>

    <table>
        <tr>
            <th>No</th>
            <th>Nama Paket</th>
            <th>Durasi</th>
            <th>Harga</th>
            <th>Aksi</th>
        </tr>

        <%
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM paket");

        int no = 1;
        while(rs.next()){
        %>
        <tr>
            <td><%= no++ %></td>
            <td><%= rs.getString("nama_paket") %></td>
            <td><%= rs.getInt("durasi_bulan") %> Bulan</td>
            <td>Rp <%= String.format("%,.0f", rs.getDouble("harga")) %></td>
            <td>
                <a href="edit_paket.jsp?id_paket=<%= rs.getInt("id_paket") %>" class="btn-edit">Edit</a>
                <a href="paket_hapus.jsp?id_paket=<%= rs.getInt("id_paket") %>" 
   onclick="return confirm('Hapus paket ini?')" 
   class="btn-hapus">Hapus</a>

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
