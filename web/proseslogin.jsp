<%@ page import="java.sql.*" %>
<%@ include file="koneksi.jsp" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

/* VALIDASI INPUT */
if (username == null || password == null ||
    username.trim().isEmpty() || password.trim().isEmpty()) {

    out.println("<script>alert('Username dan password wajib diisi'); location='login.jsp';</script>");
    return;
}

PreparedStatement ps = null;
ResultSet rs = null;

try {
    String sql = "SELECT * FROM users WHERE username=? AND password=?";
    ps = conn.prepareStatement(sql);
    ps.setString(1, username);
    ps.setString(2, password);

    rs = ps.executeQuery();

    if (rs.next()) {

        // SET SESSION
        session.setAttribute("id_user", rs.getInt("id_user"));
        session.setAttribute("username", rs.getString("username"));
        session.setAttribute("role", rs.getString("role"));

        // REDIRECT SESUAI ROLE
        if ("admin".equalsIgnoreCase(rs.getString("role"))) {
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("member/dashboard.jsp");
        }
        return;
    } else {
        out.println("<script>alert('Username atau password salah!'); location='login_admin.jsp';</script>");
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (conn != null) conn.close();
}
%>
