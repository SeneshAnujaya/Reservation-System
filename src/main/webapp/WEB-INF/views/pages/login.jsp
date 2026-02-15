<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - OceanView</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body style="display:flex;align-items:center;justify-content:center;height:100vh;background:#f5f7fb;">

<div style="width:380px;background:white;padding:40px;border-radius:14px;box-shadow:0 10px 25px rgba(0,0,0,0.05);">

    <h2 style="text-align:center;margin-bottom:25px;color:#4f7cff;">OceanView Login</h2>

    <form method="post" action="${pageContext.request.contextPath}/login">

        <div style="margin-bottom:15px;">
            <label>Username</label>
            <input type="text" name="username" required
                   style="width:100%;padding:10px;border:1px solid #e5e7eb;border-radius:8px;">
        </div>

        <div style="margin-bottom:20px;">
            <label>Password</label>
            <input type="password" name="password" required
                   style="width:100%;padding:10px;border:1px solid #e5e7eb;border-radius:8px;">
        </div>

        <button type="submit"
                style="width:100%;padding:12px;background:#4f7cff;color:white;border:none;border-radius:8px;">
            Login
        </button>

        <p style="color:red;text-align:center;margin-top:15px;">
            ${error}
        </p>

    </form>
</div>

</body>
</html>