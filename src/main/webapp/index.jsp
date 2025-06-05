<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    .table th, .table td {
      vertical-align: middle;
    }
    .table thead {
      background-color: #007bff;
      color: white;
    }
    .btn {
      margin: 5px;
      transition: all 0.3s ease;
    }
    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    .search-bar {
      margin-bottom: 20px;
    }
    .footer {
      margin-top: 30px;
      text-align: center;
      color: #6c757d;
    }
    .alert {
      margin-top: 20px;
    }
  </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/notes">iNotes</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
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
      <c:set var="keywordValue" value="${param.keyword != null ? param.keyword : ''}"/>
      <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm ghi chú..." >
      <button type="submit" class="btn btn-primary">Tìm kiếm</button>
      <a href="${pageContext.request.contextPath}/notes?action=add" class="btn btn-success ms-3">Thêm mới</a>
    </form>
  </div>

  <!-- Thông báo nếu không tìm thấy ghi chú -->
  <c:if test="${not empty param.keyword and empty notes}">
    <div class="alert alert-warning text-center" role="alert">
      Không tìm thấy ghi chú nào với từ khóa: <strong>${param.keyword}</strong>.
    </div>
  </c:if>

  <!-- Bảng danh sách ghi chú -->
  <c:if test="${not empty notes}">
    <table class="table table-striped table-hover">
      <thead>
      <tr>
        <th>STT</th>
        <th>Tiêu đề</th>
        <th>Phân loại</th>
        <th>Ngày tạo</th>
        <th>Hành động</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="note" items="${notes}" varStatus="loop">
        <tr>
          <td>${loop.count}</td>
          <td>${note.title}</td>
          <td>${note.type}</td>
          <td><fmt:formatDate value="${note.createdAt}" pattern="dd-MM-yyyy HH:mm"/></td>
          <td>
            <a href="${pageContext.request.contextPath}/notes?action=view&id=${note.id}" class="btn btn-sm btn-warning">Xem</a>
            <a href="${pageContext.request.contextPath}/notes?action=edit&id=${note.id}" class="btn btn-sm btn-info">Sửa</a>
            <form action="${pageContext.request.contextPath}/notes" method="post" style="display:inline;">
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="id" value="${note.id}">
              <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
            </form>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </c:if>
  <c:if test="${empty notes and empty param.keyword}">
    <p class="text-center text-muted">Không có ghi chú nào. Hãy thêm một ghi chú mới!</p>
  </c:if>
</div>

<!-- Footer -->
<div class="footer">
  <p>© 2025 iNotes. Được thiết kế với ❤️.</p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>