<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, medai.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Consultation History - MedAI</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; padding: 40px 20px; }
  .container { max-width: 900px; margin: 0 auto; }
  h2 { font-size: 24px; color: #1a1a2e; margin-bottom: 6px; }
  .sub { font-size: 14px; color: #888; margin-bottom: 28px; }
  table { width: 100%; border-collapse: collapse; background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 20px rgba(26,86,160,0.07); }
  th { background: #1a56a0; color: white; padding: 14px 18px; text-align: left; font-size: 13px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; }
  td { padding: 14px 18px; font-size: 14px; color: #333; border-bottom: 1px solid #f0f4ff; }
  tr:last-child td { border-bottom: none; }
  tr:hover td { background: #f7faff; }
  .LOW { color: #1d9e75; font-weight: 700; }
  .MEDIUM { color: #ba7517; font-weight: 700; }
  .HIGH { color: #e24b4a; font-weight: 700; }
  .CRITICAL { color: #7d0000; font-weight: 700; }
  .back-btn { display: inline-block; margin-bottom: 24px; color: #1a56a0; font-size: 14px; text-decoration: none; }
  .back-btn:hover { text-decoration: underline; }
  .empty { text-align: center; padding: 60px; color: #aaa; font-size: 15px; }
</style>
</head>
<body>
<div class="container">
  <a href="index.jsp" class="back-btn">← Back to Home</a>
  <h2>Consultation History</h2>
  <p class="sub">All past AI health consultations</p>

  <table>
    <thead>
      <tr>
        <th>#</th>
        <th>Patient</th>
        <th>Symptoms</th>
        <th>Diagnosis</th>
        <th>Severity</th>
        <th>Specialist</th>
        <th>Date</th>
      </tr>
    </thead>
    <tbody>
      <%
        int count = 0;
        try {
          Connection conn = DBConnection.getConnection();
          Statement stmt = conn.createStatement();
          ResultSet rs = stmt.executeQuery("SELECT * FROM consultations ORDER BY consulted_at DESC");
          while(rs.next()) {
            count++;
            String sev = rs.getString("severity");
      %>
      <tr>
        <td><%= count %></td>
        <td><%= rs.getString("patient_name") %></td>
        <td><%= rs.getString("symptoms") %></td>
        <td><%= rs.getString("diagnosis") %></td>
        <td class="<%= sev %>"><%= sev %></td>
        <td><%= rs.getString("specialist") %></td>
        <td><%= rs.getString("consulted_at") %></td>
      </tr>
      <%
          }
          conn.close();
        } catch(Exception e) { out.println("<tr><td colspan='7'>DB Error: " + e.getMessage() + "</td></tr>"); }
        if(count == 0) {
      %>
      <tr><td colspan="7" class="empty">No consultations yet. Be the first to consult!</td></tr>
      <% } %>
    </tbody>
  </table>
</div>
</body>
</html>