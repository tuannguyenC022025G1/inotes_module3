<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Các ghi chú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { margin-top: 50px; }
        .table th, .table td { vertical-align: middle; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Các ghi chú</h2>
    <div class="mb-3">
        <form action="${pageContext.request.contextPath}/notes" method="get" class="d-flex">
            <input type="hidden" name="action" value="search">
            <input type="text" name="keyword" class="form-control me-2" placeholder="Tìm kiếm..." value="${param.keyword}">
            <button type="submit" class="btn btn-primary">Tìm</button>
            <a href="${pageContext.request.contextPath}/notes?action=add" class="btn btn-success ms-2">Thêm mới</a>
        </form>
    </div>
    <c:if test="${not empty notes}">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tiêu đề</th>
                <th>Phân loại</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="note" items="${notes}" varStatus="loop">
                <tr>
                    <td>${loop.count}</td>
                    <td>${note.title}</td>
                    <td>${note.type}</td>
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
    <c:if test="${empty notes}">
        <p class="text-center">Không có ghi chú nào.</p>
    </c:if>
</div>
</body>
</html>