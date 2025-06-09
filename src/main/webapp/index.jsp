<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Trang chủ - iNotes</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f0f4f8;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .navbar-brand {
      font-weight: bold;
      font-size: 1.5rem;
    }
    .container {
      max-width: 1000px;
      margin-top: 20px;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .search-bar {
      margin-bottom: 20px;
    }
    .footer {
      margin-top: 30px;
      text-align: center;
      color: #6c757d;
    }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/notes">iNotes</a>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/notes?action=add">Thêm ghi chú</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Nội dung chính -->
<div class="container">
  <h1 class="mb-4 text-center">Quản lý ghi chú</h1>

  <!-- Thanh tìm kiếm -->
  <div class="search-bar">
    <form action="${pageContext.request.contextPath}/notes" method="get" class="d-flex">
      <input type="hidden" name="action" value="search">
      <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm ghi chú..." value="${param.keyword}">
      <%-- Chỉ hiển thị value nếu keyword không rỗng --%>
<%--      <c:if test="${not empty param.keyword}">--%>
<%--             value="${param.keyword}"--%>
<%--      </c:if>>--%>
      <button type="submit" class="btn btn-primary">Tìm kiếm</button>
    </form>
  </div>
</div>

<!-- Footer -->
<div class="footer">
  <p>© 2025 iNotes. Được thiết kế với ❤️.</p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>