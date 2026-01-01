<%
    // Menghapus semua session
    session.invalidate();

    // Redirect ke halaman login
    response.sendRedirect("login_admin.jsp");
%>
