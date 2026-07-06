<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Diagnosis Result - MedAI</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; padding: 40px 20px; }
  .container { max-width: 640px; margin: 0 auto; }
  h2 { font-size: 22px; color: #1a1a2e; margin-bottom: 6px; }
  .sub { font-size: 14px; color: #888; margin-bottom: 28px; }
  .card { background: white; border-radius: 16px; padding: 24px 28px; margin-bottom: 16px; box-shadow: 0 4px 20px rgba(26,86,160,0.07); }
  .card-label { font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.08em; color: #aaa; margin-bottom: 8px; }
  .diagnosis-text { font-size: 22px; font-weight: 700; color: #1a56a0; }
  .severity-bar { margin-top: 14px; }
  .bar-bg { background: #f0f4ff; border-radius: 100px; height: 12px; }
  .bar-fill-LOW { background: #1d9e75; border-radius: 100px; height: 12px; width: 25%; }
  .bar-fill-MEDIUM { background: #ba7517; border-radius: 100px; height: 12px; width: 55%; }
  .bar-fill-HIGH { background: #e24b4a; border-radius: 100px; height: 12px; width: 80%; }
  .bar-fill-CRITICAL { background: #7d0000; border-radius: 100px; height: 12px; width: 100%; animation: pulse 1s infinite alternate; }
  @keyframes pulse { from { opacity: 1; } to { opacity: 0.6; } }
  .sev-label { margin-top: 8px; font-weight: 700; font-size: 15px; }
  .LOW { color: #1d9e75; } .MEDIUM { color: #ba7517; } .HIGH { color: #e24b4a; } .CRITICAL { color: #7d0000; }
  .specialist-text { font-size: 18px; font-weight: 600; color: #1a1a2e; }
  .firstaid-text { font-size: 15px; color: #444; line-height: 1.7; }
  .btn-row { display: flex; gap: 12px; margin-top: 8px; }
  .btn { flex: 1; padding: 14px; border-radius: 12px; font-size: 15px; font-weight: 600; cursor: pointer; text-align: center; text-decoration: none; display: block; }
  .btn-primary { background: #1a56a0; color: white; border: none; }
  .btn-outline { background: white; color: #1a56a0; border: 2px solid #1a56a0; }
  .warning-box { background: #fff4e0; border-left: 4px solid #ba7517; border-radius: 8px; padding: 14px 18px; font-size: 13px; color: #7a4f00; margin-top: 4px; }
</style>
</head>
<body>
<div class="container">
  <h2>Hello, <%= request.getAttribute("patientName") %></h2>
  <p class="sub">Here is your AI-generated health analysis</p>

  <div class="card">
    <div class="card-label">Possible Condition</div>
    <div class="diagnosis-text"><%= request.getAttribute("diagnosis") %></div>
  </div>

  <div class="card">
    <div class="card-label">Severity Level</div>
    <div class="severity-bar">
      <div class="bar-bg">
        <div class="bar-fill-<%= request.getAttribute("severity") %>"></div>
      </div>
    </div>
    <div class="sev-label <%= (String)request.getAttribute("severity") %>">
      <%= request.getAttribute("severity") %>
    </div>
    <% if("CRITICAL".equals(request.getAttribute("severity"))) { %>
    <div class="warning-box" style="margin-top:12px;">⚠️ This may be a medical emergency. Please seek immediate hospital care.</div>
    <% } %>
  </div>

  <div class="card">
    <div class="card-label">Recommended Specialist</div>
    <div class="specialist-text">🩺 <%= request.getAttribute("specialist") %></div>
  </div>

  <div class="card">
    <div class="card-label">First Aid Tips</div>
    <div class="firstaid-text"><%= request.getAttribute("firstAid") %></div>
  </div>

  <div class="warning-box" style="margin-bottom:20px;">
    ⚕️ This is an AI-based analysis only. Always consult a qualified doctor for proper diagnosis and treatment.
  </div>

  <div class="btn-row">
    <a href="index.jsp" class="btn btn-primary">New Consultation</a>
    <a href="history.jsp" class="btn btn-outline">View History</a>
  </div>
</div>
</body>
</html>