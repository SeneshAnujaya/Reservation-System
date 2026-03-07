<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>OceanView HMS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/helppage.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/other.css">--%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<div class="app">

    <%@ include file="sidebar.jsp" %>

    <main class="main">

        <header class="topbar">
            <div></div>
<%--            <input type="text" placeholder="Search..." style="background-color: #f3fbf6">--%>
            <div class="user" style="color: #2b6945">
<%--                <i class="fa-solid fa-hand wave-icon"></i>--%>
                👋 Welcome, ${sessionScope.user}
            </div>
        </header>

        <section class="content">