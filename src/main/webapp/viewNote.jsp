<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xem ghi chú - iNotes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 600px; margin-top: 20px; }
        .note-content { background-color: #fff9e6; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }
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
    </div>
</nav>

<div class="container">
    <h2 class="mb-4 text-center">Xem ghi chú</h2>
    <c:if test="${not empty note}">
        <div class="note-content">
            <h5>${note.title}</h5>
            <p>${note.content}</p>
            <p><strong>Phân loại:</strong> ${note.type}</p>
            <p><strong>Ngày tạo:</strong> <fmt:formatDate value="${note.createdAt}" pattern="dd-MM-yyyy HH:mm"/></p>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/notes?action=edit&id=${note.id}" class="btn btn-info">Sửa</a>
            <form action="${pageContext.request.contextPath}/notes" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="${note.id}">
                <button type="submit" class="btn btn-danger">Xóa</button>
            </form>
            <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Quay lại</a>
        </div>
    </c:if>
    <c:if test="${empty note}">
        <p class="text-center">Ghi chú không tồn tại.</p>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Quay lại</a>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>