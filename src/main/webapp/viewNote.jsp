<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xem ghi chú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 600px; margin-top: 50px; }
        .note-content { background-color: #fff9e6; padding: 20px; border: 1px solid #ddd; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Xem ghi chú</h2>
    <c:if test="${not empty note}">
        <div class="note-content">
            <h5>${note.title}</h5>
            <p>${note.content}</p>
            <p><strong>Phân loại:</strong> ${note.type}</p>
        </div>
        <div class="text-center mt-3">
            <a href="notes?action=delete&id=${note.id}" class="btn btn-danger">Xóa</a>
            <a href="notes?action=search" class="btn btn-secondary">Quay lại</a>
        </div>
    </c:if>
    <c:if test="${empty note}">
        <p class="text-center">Ghi chú không tồn tại.</p>
        <div class="text-center">
            <a href="notes?action=search" class="btn btn-secondary">Quay lại</a>
        </div>
    </c:if>
</div>
</body>
</html>