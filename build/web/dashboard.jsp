<%@ page import="java.sql.*" %>
<%@ include file="../koneksi.jsp" %>

<%
if (session.getAttribute("username") == null ||
    !"admin".equals(session.getAttribute("role"))) {
    response.sendRedirect("../login.jsp");
}
%>

<%
int totalMember = 0;
int totalPaket = 0;
int totalTransaksi = 0;

Statement st = conn.createStatement();

ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM member");
if(rs.next()) totalMember = rs.getInt(1);

rs = st.executeQuery("SELECT COUNT(*) FROM paket");
if(rs.next()) totalPaket = rs.getInt(1);

rs = st.executeQuery("SELECT COUNT(*) FROM transaksi");
if(rs.next()) totalTransaksi = rs.getInt(1);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Admin Gym</title>
    <link rel="stylesheet" href="dashboard.css">
</head>
<body>

<div class="sidebar">
    <h2>GYM ADMIN</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="member.jsp">Data Member</a>
    <a href="paketgym.jsp">Paket Gym</a>
    <a href="transaksi.jsp">Transaksi</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="content">
    <h1>Dashboard Admin</h1>

    <div class="card-container">
        <div class="card">
            <h3>Total Member</h3>
            <p><%= totalMember %></p>
        </div>
        <div class="card">
            <h3>Total Paket</h3>
            <p><%= totalPaket %></p>
        </div>
        <div class="card">
            <h3>Total Transaksi</h3>
            <p><%= totalTransaksi %></p>
        </div>
    </div>
</div>

</body>
</html>

<%
conn.close();
%>

