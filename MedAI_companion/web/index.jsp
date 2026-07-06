<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MedAI Companion</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
  .container { background: white; border-radius: 20px; padding: 50px 60px; width: 600px; box-shadow: 0 20px 60px rgba(26,86,160,0.12); }
  .logo { display: flex; align-items: center; gap: 12px; margin-bottom: 8px; }
  .logo-icon { width: 48px; height: 48px; background: #1a56a0; border-radius: 12px; display: flex; align-items: center; justify-content: center; }
  .logo-icon svg { width: 28px; height: 28px; fill: none; stroke: white; stroke-width: 2; }
  h1 { font-size: 26px; font-weight: 700; color: #1a1a2e; }
  .subtitle { font-size: 14px; color: #888; margin-bottom: 36px; }
  label { display: block; font-size: 13px; font-weight: 600; color: #444; margin-bottom: 8px; text-transform: uppercase; letter-spacing: 0.05em; }
  input[type=text], textarea { width: 100%; padding: 14px 16px; border: 1.5px solid #e0e8f5; border-radius: 12px; font-size: 15px; color: #1a1a2e; outline: none; transition: border 0.2s; font-family: 'Segoe UI', sans-serif; }
  input[type=text]:focus, textarea:focus { border-color: #1a56a0; }
  textarea { height: 130px; resize: none; margin-bottom: 28px; }
  .name-field { margin-bottom: 20px; }
  .hint { font-size: 12px; color: #aaa; margin-top: 6px; margin-bottom: 20px; }
  button { width: 100%; padding: 16px; background: #1a56a0; color: white; border: none; border-radius: 12px; font-size: 16px; font-weight: 600; cursor: pointer; transition: background 0.2s; }
  button:hover { background: #134080; }
  .history-link { display: block; text-align: center; margin-top: 20px; color: #1a56a0; font-size: 14px; text-decoration: none; }
  .history-link:hover { text-decoration: underline; }
</style>
</head>
<body>
<div class="container">
  <div class="logo">
    <div class="logo-icon">
      <svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 100 20A10 10 0 0012 2z"/><path d="M12 8v4m0 4h.01"/></svg>
    </div>
    <div>
      <h1>MedAI Companion</h1>
    </div>
  </div>
  <p class="subtitle">AI-powered symptom analysis & first aid guidance</p>

  <form action="diagnose" method="post">
    <div class="name-field">
      <label>Your Name</label>
      <input type="text" name="patientName" placeholder="Enter your full name" required />
    </div>
    <label>Describe Your Symptoms</label>
    <textarea name="symptoms" placeholder="e.g. fever, headache, body pain, chills..." required></textarea>
    <p class="hint">Tip: Describe as many symptoms as possible for accurate results.</p>
    <button type="submit">Analyze Symptoms</button>
  </form>
  <a href="history.jsp" class="history-link">View consultation history →</a>
</div>
</body>
</html>