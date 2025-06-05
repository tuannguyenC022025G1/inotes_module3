<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa ghi chú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 600px; margin-top: 50px; }
        .form-control { margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Sửa ghi chú</h2>
    <c:if test="${not empty note}">
        <form action="${pageContext.request.contextPath}/notes" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="${note.id}">
            <div class="form-group">
                <label>Tiêu đề</label>
                <input type="text" name="title" class="form-control" value="${note.title}" required>
            </div>
            <div class="form-group">
                <label>Nội dung</label>
                <textarea name="content" class="form-control" rows="5" required>${note.content}</textarea>
            </div>
            <div class="form-group">
                <label>Thể loại</label>
                <select name="typeId" class="form-control">
                    <option value="1" ${note.type == 'Cá nhân' ? 'selected' : ''}>Cá nhân</option>
                    <option value="2" ${note.type == 'Công ty' ? 'selected' : ''}>Công ty</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Lưu</button>
            <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Hủy</a>
        </form>
    </c:if>
    <c:if test="${empty note}">
        <p class="text-center">Ghi chú không tồn tại.</p>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Quay lại</a>
        </div>
    </c:if>
</div>
</body>
</html>