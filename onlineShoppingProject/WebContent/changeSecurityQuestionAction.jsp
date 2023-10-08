<%@ page import="java.sql.*" %>
<%@ page import="onlineShoppingProject.ConnectionProvider" %>

<%
    String email = session.getAttribute("email").toString();
    String securityQuestion = request.getParameter("securityQuestion");
    String answer = request.getParameter("answer");
    String password = request.getParameter("password");
    int check = 0;

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = ConnectionProvider.getCon();
        String selectQuery = "SELECT * FROM users WHERE email = ? AND password = ?";
        pstmt = con.prepareStatement(selectQuery);
        pstmt.setString(1, email);
        pstmt.setString(2, password);

        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            check = 1;
            String updateQuery = "UPDATE users SET securityQuestion = ?, answer = ? WHERE email = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setString(1, securityQuestion);
            pstmt.setString(2, answer);
            pstmt.setString(3, email);
            pstmt.executeUpdate();

            response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
        } else {
            response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the exception properly, e.g., log or display an error message.
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception properly, e.g., log or display an error message.
        }
    }
%>
