<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>OceanView HMS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/other.css">--%>
</head>

<body>

<div class="app">

    <%@ include file="sidebar.jsp" %>

    <main class="main">

        <header class="topbar">
            <input type="text" placeholder="Search...">
            <div class="user">
                Welcome, ${sessionScope.user}
            </div>
        </header>

        <section class="content">