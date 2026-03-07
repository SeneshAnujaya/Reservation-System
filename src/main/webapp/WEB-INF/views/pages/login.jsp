

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - OceanView</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f6fffa;
        }

        .login-wrapper {
            width: 100%;
            max-width: 1100px;
            height: 80vh;
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            display: grid;
            grid-template-columns: 1.1fr 1.2fr;
            box-shadow: 0 24px 60px rgba(0, 0, 0, 0.25);
        }

        /* LEFT – form side */
        .login-left {
            padding: 40px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }

        .login-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 4px 12px;
            border-radius: 999px;
            background: #f4f9f6;
            color: #256f4d;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 18px;
        }

        .login-pill-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #22c55e;
        }

        .login-logo img{
            width: 230px;
            margin-bottom: 2rem;
        }

        .login-title {
            font-size: 28px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
            text-align: left;
        }

        .login-subtitle {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 26px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 500;
            color: #374151;
            margin-bottom: 6px;
        }

        .form-input {
            width: 100%;
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid #e5e7eb;
            font-size: 14px;
            outline: none;
            transition: border-color 0.15s, box-shadow 0.15s, background-color 0.15s;
            background-color: #f9fafb;
        }

        .form-input::placeholder {
            color: #9ca3af;
        }

        .form-input:focus {
            border-color: #16a34a;
            box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.25);
            background-color: #ffffff;
        }

        .login-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
            margin-top: 4px;
        }

        .remember-me {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: #4b5563;
        }

        .remember-me input[type="checkbox"] {
            width: 15px;
            height: 15px;
            accent-color: #15803d;
        }

        .forgot-link {
            font-size: 13px;
            color: #15803d;
            text-decoration: none;
            font-weight: 500;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        .btn-primary {
            width: 100%;
            padding: 11px 12px;
            border-radius: 999px;
            border: none;
            background: #15803d;
            color: #ffffff;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            margin-bottom: 10px;
            transition: background 0.15s, transform 0.1s, box-shadow 0.1s;
            box-shadow: 0 12px 26px rgba(21, 128, 61, 0.35);
            margin-top: 20px;
        }

        .btn-primary:hover {
            background: #166534;
            transform: translateY(-1px);
        }

        .btn-primary:active {
            transform: translateY(0);
            box-shadow: 0 8px 18px rgba(21, 128, 61, 0.3);
        }

        .btn-google {
            width: 100%;
            padding: 10px 12px;
            border-radius: 999px;
            border: 1px solid #e5e7eb;
            background: #ffffff;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-size: 14px;
            font-weight: 500;
            color: #374151;
            cursor: pointer;
            margin-top: 6px;
            transition: background 0.15s, box-shadow 0.15s, transform 0.1s;
        }

        .btn-google:hover {
            background: #f9fafb;
            box-shadow: 0 6px 16px rgba(15, 23, 42, 0.12);
            transform: translateY(-1px);
        }

        .btn-google-icon {
            width: 16px;
            height: 16px;
            border-radius: 4px;
            background: conic-gradient(from 180deg at 50% 50%, #ea4335 0deg, #fbbc05 90deg, #34a853 180deg, #4285f4 270deg, #ea4335 360deg);
        }

        .login-footer {
            margin-top: 18px;
            font-size: 13px;
            color: #6b7280;
            text-align: center;
        }

        .login-footer a {
            color: #15803d;
            font-weight: 500;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        .error-text {
            color: #dc2626;
            font-size: 13px;
            text-align: center;
            margin-top: 10px;
            min-height: 16px;
        }

        /* RIGHT – image / hero side */
        .login-right {
            position: relative;
            background-image: url('${pageContext.request.contextPath}/assets/images/hotel-sidepic.jpg');
            background-size: cover;
            background-position: center;
            overflow: hidden;
        }

        .login-right-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.75), rgba(8, 47, 35, 0.9));
            mix-blend-mode: multiply;
        }

        .login-right-content {
            position: relative;
            height: 100%;
            padding: 34px 40px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            color: #f9fafb;
        }

        .badge-row {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 6px 10px;
            border-radius: 999px;
            background: rgba(15, 23, 42, 0.5);
            backdrop-filter: blur(8px);
            font-size: 11px;
        }

        .badge-avatars {
            display: flex;
        }

        .badge-avatars span {
            width: 22px;
            height: 22px;
            border-radius: 999px;
            border: 2px solid #0b1120;
            background: #22c55e;
            margin-left: -6px;
        }

        .badge-avatars span:first-child {
            margin-left: 0;
        }

        .hero-title {
            font-size: 30px;
            line-height: 1.1;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .hero-subtitle {
            font-size: 13px;
            color: #e5e7eb;
            max-width: 320px;
        }

        .hero-tagline {
            font-size: 12px;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: #a7f3d0;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .hero-highlight {
            font-size: 13px;
            color: #bbf7d0;
            margin-top: 14px;
        }

        @media (max-width: 900px) {
            .login-wrapper {
                grid-template-columns: 1fr;
                height: auto;
            }

            .login-right {
                display: none;
            }

            .login-left {
                padding: 32px 24px;
            }
        }
    </style>
</head>

<body>
<div class="login-wrapper">

    <!-- LEFT: LOGIN FORM -->
    <div class="login-left">
<%--        <div class="login-pill">--%>
<%--            <span class="login-pill-dot"></span>--%>
<%--            Ocean View Resort--%>
<%--        </div>--%>

    <div class="login-logo">
        <img src="${pageContext.request.contextPath}/assets/images/oceanlogo.png" alt="logo"/>
    </div>

    <div>
        <h2 class="login-title">Welcome back</h2>
        <p class="login-subtitle">Welcome back! Please enter your details.</p>

        <form method="post" action="${pageContext.request.contextPath}/login">

            <div class="form-group">
                <label class="form-label">Username</label>
                <input
                        type="text"
                        name="username"
                        required
                        class="form-input"
                        placeholder="Enter your username">
            </div>

            <div class="form-group">
                <label class="form-label">Password</label>
                <input
                        type="password"
                        name="password"
                        required
                        class="form-input"
                        placeholder="Enter your password">
            </div>

<%--            <div class="login-row">--%>
<%--                <label class="remember-me">--%>
<%--                    <input type="checkbox" name="remember" value="true">--%>
<%--                    Remember for 30 days--%>
<%--                </label>--%>
<%--                <a href="#" class="forgot-link">Forgot password?</a>--%>
<%--            </div>--%>

            <button type="submit" class="btn-primary sign-in-btn">
                Sign in
            </button>

<%--            <button type="button" class="btn-google">--%>
<%--                <span class="btn-google-icon"></span>--%>
<%--                <span>Sign in with Google</span>--%>
<%--            </button>--%>

            <p class="error-text">
                ${error}
            </p>
        </form>
    </div>
<%--        <p class="login-footer">--%>
<%--            Don’t have an account?--%>
<%--            <a href="${pageContext.request.contextPath}/register">Sign up</a>--%>
<%--        </p>--%>
    </div>

    <!-- RIGHT: IMAGE / HERO -->
    <div class="login-right">
        <div class="login-right-overlay"></div>
        <div class="login-right-content">
            <div class="badge-row">
                <div class="badge-avatars">
                    <span></span><span></span><span></span><span></span>
                </div>
                <span>Trusted by over 10,000 Guests</span>
            </div>

            <div>
                <p class="hero-tagline">STAY IN NATURE</p>
                <h1 class="hero-title">Find your next stay in nature</h1>
                <p class="hero-subtitle">
                    Explore cozy cabins, forest hideaways, and mountain escapes hosted by locals.
                    Where comfort meets adventure.
                </p>
                <p class="hero-highlight">
                    Handpicked stays · Flexible booking · 24/7 support
                </p>
            </div>
        </div>
    </div>

</div>
</body>
</html>