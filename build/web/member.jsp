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
    <title>Data Member Gym</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>

<div class="sidebar">
    <h2>GYM ADMIN</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="member.jsp" class="active">Data Member</a>
    <a href="paketgym.jsp">Paket Gym</a>
    <a href="transaksi.jsp">Transaksi</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="content">
    <h1>Data Member Gym</h1>

    <a href="tambah_member.jsp" class="btn">+ Tambah Member</a>

    <table>
        <tr>
            <th>No</th>
            <th>Nama</th>
            <th>JK</th>
            <th>No HP</th>
            <th>Email</th>
            <th>Status</th>
            <th>Aksi</th>
        </tr>

        <%
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM member");

        int no = 1;
        while(rs.next()){
        %>
        <tr>
            <td><%= no++ %></td>
            <td><%= rs.getString("nama_member") %></td>
            <td><%= rs.getString("jenis_kelamin") %></td>
            <td><%= rs.getString("no_telepon") %></td>
            <td><%= rs.getString("email") %></td>
            <td>
                <span class="status <%= rs.getString("status_member").toLowerCase() %>">
                    <%= rs.getString("status_member") %>
                </span>
            </td>
            <td>
                <a href="member_edit.jsp?id_member=<%= rs.getInt("id_member") %>" class="btn-edit">Edit</a>
               <a href="member_hapus.jsp?id_member=<%= rs.getInt("id_member") %>"
   onclick="return confirm('Hapus member ini?')"
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

